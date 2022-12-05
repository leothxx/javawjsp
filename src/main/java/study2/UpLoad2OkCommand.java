package study2;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpLoad2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdstest"); //위와 같은거지만 밑이 한줄로 할 수 있다. 서블릿에 있는 루트부터 찾는다는 개념으로 "/" 를 기입함.
		int maxSize = 1024 * 1024 * 10; // 서버에 저장할 최대 파일 용량 5MB (1회 저장)
		String encoding = "UTF-8";
		
		// 파일 업로드 처리 끝
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
			                //연습
		/* Enumeration e = multipartRequest.getFileNames();
		while(e.hasMoreElements()) {
			String name = (String) e.nextElement();
			System.out.println("name : " + name);
		}
		*/
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String fileSystemName = "";
		
		while(fileNames.hasMoreElements()) { // fileNames에 한건이라도 자료가 있다면 true
			file = (String) fileNames.nextElement(); // 업로드시의 폼태그 안의 필드네임(name)
			originalFileName = multipartRequest.getOriginalFileName(file);
			fileSystemName = multipartRequest.getFilesystemName(file);
			System.out.println("업로드시의 원본 파일명 : "+originalFileName);
			System.out.println("서버에 저장될 파일명 : "+fileSystemName);
			System.out.println();
		}
		if(fileSystemName.equals("")) request.setAttribute("msg", "upLoad1No");
		else request.setAttribute("msg", "upLoad1Ok");
		
		int upLoadFlag = multipartRequest.getParameter("upLoadFlag") == null ? 2 : Integer.parseInt(multipartRequest.getParameter("upLoadFlag"));
		if(upLoadFlag == 2) {
			request.setAttribute("url", request.getContextPath()+"/upLoad2.st");
		}
		else if(upLoadFlag == 3) {
			request.setAttribute("url", request.getContextPath()+"/upLoad3.st");
		}
		else if(upLoadFlag == 4) {
			request.setAttribute("url", request.getContextPath()+"/upLoad4.st");
		}
	}
}
