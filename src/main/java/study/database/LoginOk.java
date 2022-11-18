package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		JusorokDAO dao = new JusorokDAO();
		JusorokVO vo = new JusorokVO();
		
		vo = dao.loginCheck(mid,pwd);
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(vo.getName()!=null) {
			//회원 인증 후 처리(1:자주사용하는 자료를 세션에 담는다. 2:방문포인트를 10점씩 부가한다.(단, 1일 방문 포인트는 50점까지만 허용함) 3:최종방문날짜를 현재 날짜시간으로 변경한다. )
			//1.세션처리
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLastDate", vo.getLastDate().substring(0,16));
			
			// 2.방문포인트 증가하기(10점씩, 1일 50점까지) 3.최종방문일자 업데이트.......
			int visitPoint = vo.getPoint() + 10;
			dao.setVisitUpdate(visitPoint, mid);
			
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 로그인 되었습니다!')");
			out.println("location.href='"+request.getContextPath()+"/database/MemberMain'");
			out.println("</script>");
			//response.sendRedirect(request.getContextPath()+"/database/MemberMain");
		}
		else {
			//회원 인증 실패시 처리
			out.println("<script>");
			out.println("alert('로그인 실패!!')");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/login.jsp'");
			//response.sendRedirect(); 메세지 출력 없이 바로 보낼거면 백단에서 sendRedirect로 바로 보내면되지만, 메세지 띄울꺼면
			//어차피 PrintWriter를 이용해야하기에 location을 씀.
			out.println("</script>");
		}
	}
}
