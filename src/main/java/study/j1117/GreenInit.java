package study.j1117;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Web.xml에서의 초기값 지정하지 않고, 어노테이션에서 url패턴 지정 및 초기값 주는 방법.
@WebServlet(urlPatterns="/Green", initParams = {@WebInitParam(name="mid",value="admin"), @WebInitParam(name="pwd",value="1234"), @WebInitParam(name="className",value="웹개발3팀")}) //url패턴이라고 알려주는 명령. *하나면 그냥써도도지만 하나이상이면 중괄호 {}로 둘러싸야함. 
public class GreenInit extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//web.xml에 설정해둔 초기값 변수(값)를 가져오기.
		String mid = getInitParameter("mid");
		String pwd = getInitParameter("pwd");
		String className = getInitParameter("className");
		
		System.out.println("아이디: "+mid);
		System.out.println("비밀번호: "+pwd);
		System.out.println("부서명: "+className);
		
		request.setAttribute("mid", mid);
		request.setAttribute("pwd", pwd);
		request.setAttribute("className", className);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1117/init/green.jsp");
		dispatcher.forward(request, response);
	}
}
