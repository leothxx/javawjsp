package study.work1117;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/work1117/LogOut")
public class LogOut extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		out.println("<script>");
		out.println("alert('"+mid+"님 로그아웃 되셨습니당')");
		out.println("location.href='"+request.getContextPath()+"/study/1117work/login.jsp'");
		out.println("</script>");
	}
}
