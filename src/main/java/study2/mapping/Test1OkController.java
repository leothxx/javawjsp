package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test222")
public class Test1OkController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기는 /mapping/Test1Ok컨트롤러 입니당.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp"); //dos windows에서는 경로가 \ 이고, 리눅스는 / 임. \\ 두개를 사용하면 /로 알아서 바뀜. 세퍼러티라고함. (구분자)
		dispatcher.forward(request, response);
	}
}
