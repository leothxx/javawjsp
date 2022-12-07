package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getIdxSearch(idx);
		
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
		// 파일 압축에 필요한 객체들을 선언한다.
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null; // 클라이언트에 전송하기 위해 필요함.
		
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		
		String zipPath = request.getServletContext().getRealPath("/data/pds/temp/");
		String zipName = vo.getTitle() + ".zip"; //zip파일의 이름은 타이틀.zip으로 지정한다.
		
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] b = new byte[2048];
		int data = 0;
		
		for(int i=0; i<fNames.length; i++) {
			File file = new File(realPath + fSNames[i]); //서버의 저장된 파일 이름의 i번째를 가져온다.
			//File copyAndRename = new File(realPath + fNames[i]); //올렸을때의 이름의 i번째를 가져온다.
			
			//file.renameTo(copyAndRename); //file에 있는 이름을 copyAndRename으로 이름을 바꾼다. renameTo
			
			//fis = new FileInputStream(copyAndRename);
			fis = new FileInputStream(file);
			
			zos.putNextEntry(new ZipEntry(fNames[i]));
			
			while((data = fis.read(b, 0, b.length)) != - 1) {
				zos.write(b, 0, data);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
		}
		zos.close();
		
		// 서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 압축되어 있는 파일을 삭제한다.
		// 전송프로토콜인 http 헤더에 필요한 정보를 알려준다.
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		// 헤더 정보를 가지고 서버의 zip파일을 클라이언트에 전송 처리한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// Java로 실제파일을 클라이언트로 다운 처리 시켜준다.
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		while((data = fis.read(b, 0, b.length)) != - 1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		
		sos.close();
		fis.close();
		// 이곳까지가 클라이언트로 전송 완료됨...
		
		// 서버에 존재하는 zip파일을 삭제처리한다.
		new File(zipPath + zipName).delete();
		
		// 다운로드 횟수를 증가처리 한다.
		dao.setDownNum(idx);
	}
}
