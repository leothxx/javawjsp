package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("file");
		String realPath = request.getServletContext().getRealPath("/data/pdstest/");
		// 파일 을 이동, 저장, 다운 등등 모든 파일에 관련된 것들은 파일객체를 생성해야 한당. * java io 에서 올려야함 *
		File file = new File(realPath + fName); //이 경로에 있는 이 파일을 가져오겠다는 의미.
		
		String res = "0";
		
		if(file.exists()) { //파일이 존재 하는지?
			file.delete(); //파일 지우기
			res = "1";
		}
		response.getWriter().write(res);
	}
}
