package study.j1111;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test10Ok") // 컨트롤러임. [신세대] 3~4년전만해도, 컨트롤러 없이 web.xml에서 전부 컨트롤러 처리를 하였음.
public class Test10Ok extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 처리
		request.setCharacterEncoding("utf-8"); //요청 utf8로해서 [생략불가]
		response.setCharacterEncoding("utf-8"); //출력할때도 utf8 [생략가능]
		response.setContentType("text/html; charset=utf-8"); // 전송방식이 html이고, 찍어주는애도 utf8로 하겠당. [생략불가]
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명 : "+name);
		System.out.println("나이 : "+age);
	}
}