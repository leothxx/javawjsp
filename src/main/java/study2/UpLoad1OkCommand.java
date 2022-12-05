package study2;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String fName = request.getParameter("fName")==null ? "" :
		//ystem.out.println("pdstest에서 넘어온 파일명 ? " + fName);
		//request.getParameter("fName");
		
		// COS라이브러리에서 제공해주는 객체... MuyltipartRequest() / DefaultFileRenamePolicy()
		// MuyltipartRequest(저장소명(request), "서버에 저장될 파일 경로", "서버에 저장될 파일의 최대용량","코드 변환방식", 기타옵션(중복방지를 위한 클래스 등))
		
		
		//ServletContext application = request.getServletContext();
		//String realPath = application.getRealPath(null);
		String realPath = request.getServletContext().getRealPath("/data/pdstest"); //위와 같은거지만 밑이 한줄로 할 수 있다. 서블릿에 있는 루트부터 찾는다는 개념으로 "/" 를 기입함.
		int maxSize = 1024 * 1024 * 10; // 서버에 저장할 최대 파일 용량 5MB (1회 저장)
		String encoding = "UTF-8";
		// 파일 업로드 처리 끝
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드 된 파일의 정보를 추출해보자
		String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName"); // X
		String originalFileName = multipartRequest.getOriginalFileName("fName"); // 업로드 시킬때의 업로드 파일명이다.
		
		// 서버에 저장될 파일명
		String filesystemName = multipartRequest.getFilesystemName("fName"); // 실제 서버에 저장된 파일명.
		
		System.out.println("원본 파일명 : " + fName); // (X) 업로드 시킬때의 업로드 파일명이다.
		System.out.println("원본 파일명 : " + originalFileName); // (O) 업로드 시킬때의 업로드 파일명이다.
		System.out.println("파일이 저장될 서버의 경로 : " + realPath);
		System.out.println("서버에 저장될 파일명 : " + filesystemName);
		
		if(filesystemName == null) {
			request.setAttribute("msg", "upLoad1No");
		}
		else {
			request.setAttribute("msg", "upLoad1Ok");
		}
		request.setAttribute("url", request.getContextPath()+"/upLoad1.st");
	}
}
