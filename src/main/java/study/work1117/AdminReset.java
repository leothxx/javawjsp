package study.work1117;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/work1117/AdminReset")
public class AdminReset extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		application.setAttribute("aVisitCnt", 0);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('관리자님! 방문자수 초기화가 완료되었습니다!')");
		out.println("location.href='"+request.getContextPath()+"/study/1117work/member.jsp'");
		out.println("</script>");	
	}
}
