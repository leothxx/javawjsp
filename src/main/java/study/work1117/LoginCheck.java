package study.work1117;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/work1117/loginCheck")
public class LoginCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String save = request.getParameter("save")==null ? "false" : request.getParameter("save");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		Cookie cookie = new Cookie("cMid", mid);
		cookie.setPath("/");
		cookie.setMaxAge(60*5);
		response.addCookie(cookie);
		
		if(save.equals("false")) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		if(mid.equals("admin") && pwd.equals("1234") || mid.equals("leothx") && pwd.equals("leo1234")) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sPwd", pwd);
			
			int visiCnt = 0;
			
			ServletContext application = request.getServletContext();
			
			if(application.getAttribute("aVisitCnt") == null) {
				application.setAttribute("aVisitCnt", 1);		
			}
			else {
				visiCnt = (int) application.getAttribute("aVisitCnt") + 1;
				application.setAttribute("aVisitCnt", visiCnt);
			}
			
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인에 성공하셨습니다!')");
			out.println("location.href='"+request.getContextPath()+"/study/1117work/member.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('아이디 및 패스가 올바르지 않습니다.!')");
			out.println("location.href='"+request.getContextPath()+"/study/1117work/login.jsp'");
			out.println("</script>");
		}
		
		
		
	}
}
