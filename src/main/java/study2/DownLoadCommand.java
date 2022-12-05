package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdstest/"); //경로 설정.
		
		// File file = new File("atom.txt"); //하나의 파일을 가져올때
		String[] files = new File(realPath).list(); //여러개 파일을 가져올때
		
		for(String file : files) {
			System.out.println("file : "+file);
		}
		request.setAttribute("files", files);
	}
}
