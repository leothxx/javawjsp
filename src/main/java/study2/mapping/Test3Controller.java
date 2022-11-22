package study2.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class Test3Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		StringBuffer url = request.getRequestURL(); //너 어디서 보낸건지 정체를 밝혀!!
		System.out.println("url = "+url);
		System.out.println("==============================================================");
		String uri = request.getRequestURI(); //너 어디서 보낸건지 정체를 밝혀!!
		System.out.println("uri = "+uri);
		
		//String com = uri.substring(uri.lastIndexOf("/"));
		//String com = uri.substring(uri.lastIndexOf("/"),uri.length()-3); // /가 있는 위치부터 .이있는 위치 앞까지 가져와라.
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf(".")); // /가 있는 위치부터 .이있는 위치 앞까지 가져와라.
		System.out.println(com);
		String viewPage="/WEB-INF/study2/mapping";
		if(com.equals("/Test3_1")) {
			viewPage += "/test3_1.jsp";
		}
		else if(com.equals("/Test3_2")) {
			viewPage += "/test3_2.jsp";
		}
		else if(com.equals("/Test3_3")) {
			viewPage += "/test3_3.jsp";
		}
		else if(com.equals("/Test4")) {
			viewPage += "/test4.jsp";
		}
		else if(com.equals("/Test4OK")) {
			int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
			int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
			String opt = request.getParameter("opt")==null ? "" : request.getParameter("opt");
			
			Test4Calc t4 = new Test4Calc();
			int answer = t4.getCalc(su1, su2, opt);
			request.setAttribute("su1", su1);
			request.setAttribute("su2", su2);
			request.setAttribute("opt", opt); //하나로 넘기려면 vo나 dto쓰면 된당.
			request.setAttribute("answer", answer);
			viewPage += "/test4Ok.jsp";
		}
		else {
			viewPage += "/test3.jsp";
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test3.jsp");
			//dispatcher.forward(request, response);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	
	}
}
