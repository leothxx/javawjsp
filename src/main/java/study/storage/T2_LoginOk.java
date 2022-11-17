package study.storage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/storage/T2_LoginOk")
public class T2_LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		if(mid.equals("admin") && pwd.equals("1234") || mid.equals("leothx_x") && pwd.equals("leo1234")) { //어드민하고 leo가 비밀번호가 맞을때만 들어온다.
			Cookie cookie = new Cookie("cMid",mid); //아이디를 쿠키 저장.
			cookie.setMaxAge(60*5); //쿠키의 만료시간은 5분.
			response.addCookie(cookie); //쿠키를 클라이언트에 저장.
			
			HttpSession session = request.getSession(); //세션은 HttpSession에 들어있음. 이건 꼭 외워야함!!! [인터페이스임]
			session.setAttribute("sMid", mid); //아이디를 세션 sMid에 저장.
			
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/1118_storage_server/t2_LoginMember.jsp';");
			out.println("</script>");		
		}
		else {
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 확인하세요!');");
			out.println("history.back();"); //회원이 아닐경우 돌아간다.
			out.println("</script>");
		}


	}
}
