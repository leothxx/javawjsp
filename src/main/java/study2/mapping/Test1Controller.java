package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1")
public class Test1Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("여기는 /mapping/Test1컨트롤러 입니당.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/mapping/Test222"); //dos windows에서는 경로가 \ 이고, 리눅스는 / 임. \\ 두개를 사용하면 /로 알아서 바뀜. 세퍼러티라고함. (구분자)
			dispatcher.forward(request, response);
	}
}
