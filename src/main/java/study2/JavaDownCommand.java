package study2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JavaDownCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdstest/"); //서버에 경로를 가져오기. realPath
		String fName = request.getParameter("file"); // 넘어온 파일명을 받는다.
		
		File file = new File(realPath + fName); // realPath에 있는 경로에 넘어온 파일명으로 껍데기를 만듬. 사실상 그 파일을 가르킨다고 보면 된다.
		
		// 프로토콜 형식에 맞도록 헤더에 정보를 제공해 준다.
		// mimeType : 파일형식(예:텍스트파일? 바이너리?....등등...) -- > 2진 바이너리 형식으로 전송해야 한다.
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream"); // 2진 바이너리 형식
		}
		
		// 사용하는 브라우저에 대한 정보 : 만약에 인터넷 익스플로러 (IE)인 경우에는 'EUC-KR', 'UTF-8'로 전송한다.
 		String downLoadName = "";
 		if(request.getHeader("user-agent").indexOf("MSIE") == -1) { //Micro Soft IE 가 아니라면 ?
 			downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
 		}
 		else {
 			downLoadName = new String(fName.getBytes("EUC-KR"), "8859_1");
 		}
 		
 		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다.
 		response.setHeader("Content-Disposition", "attachment;filename=Java_"+downLoadName);
 		
 		// java에 의해서 실제로 파일을 다운(업로드) 처리 시켜준다. (FileInputStream / FileOutputStream / ServletOutputStream)
		
		FileInputStream fis = new FileInputStream(file); // input은 가져오는 곳, output은 내보내는 곳이다. file이 서버에 있는 파일이기에 File Input Stream 이다.
		//FileOutputStream fos = new FileOutputStream(nfile);
		ServletOutputStream sos = response.getOutputStream(); // 서버에서 꺼내서 클라이언트에 보낼꺼임.
		
		// 전송할 객체를 생성 후 실제로 파일을 객체에 담아서 처리시켜준다.
		byte[] b = new byte[2048]; // 한번에 2kb씩 담아 보내겠다.
		int data = 0;
		
		while((data = fis.read(b, 0, b.length)) != -1) { //초당 2k씩 계속 전송함. 반복문
			sos.write(b, 0, data); //담아둔것을 전부 다 가져간다.
		}
		sos.flush(); //반복문에 2048에 딱 남아 떨어지지않아, 남아있는 용량까지도 객체에 담아 넘긴다.
		// 여기까지 수행하면 파일 다운로드 처리가 완료된다.
		sos.close();
		fis.close();
	}
}
