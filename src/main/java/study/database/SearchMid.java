package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/database/SearchMid")
public class SearchMid extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		PrintWriter out = response.getWriter();
		
		JusorokDAO dao = new JusorokDAO();
		
		JusorokVO vo = dao.getMemberSearch(mid); //여러건이면 vos에 담지만 한건이기에 vo에만 담으면 된당.!!!
		
		if(vo.getName()!=null) {
			request.setAttribute("vo", vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1120_Database/memberSearch.jsp");
			dispatcher.forward(request, response);			
		}
		else {
			out.println("<script>");
			out.println("alert('해당 아이디를 찾을 수 없습니다.')");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/member.jsp'");
			out.println("</script>");
		}
		
	}
}
