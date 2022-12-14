package study.work1120;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/work1120/LogOut")
public class LogOut extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JusorokDAO dao = new JusorokDAO();
		
		dao.logOut();
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("sName");
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+name+"님 로그아웃 되었습니다.')");
		out.println("location.href='"+request.getContextPath()+"/study/1120_Work/login.jsp'");
		out.println("</script>");
	}
}
