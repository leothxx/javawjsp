package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.calc")
public class CalcController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MappingInterface command = null;
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/study2/mapping2";
		if(com.equals("/Calc")) viewPage += "/calc.jsp";
		else if(com.equals("/CalcOk")) {
			command = new CalcOkCommand();
			command.execute(request, response); //온 모든 값이 포함 된 request와 response를 넘긴당
			viewPage += "/calcOk.jsp";
		}
		else if(com.equals("/JuList")) {
			command = new JuListCommand();
			command.execute(request, response); //온 모든 값이 포함 된 request와 response를 넘긴당
			viewPage += "/julist.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
