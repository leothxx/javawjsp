package study.work1120;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/work1120/IdCheck")
public class IdCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JusorokDAO dao = new JusorokDAO();
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		
		JusorokVO vo = new JusorokVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		
		int sw = dao.idSearch(vo);
		
		if(sw == 1) {
			out.println("<script>");
			out.println("alert('이미 중복된 아이디가 존재합니다.')");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Work/signup.jsp'");
			out.println("</script>");
		}
		else {
			int signPass = dao.signUp(vo);
			if(signPass == 0) {
				out.println("<script>");
				out.println("alert('회원가입에 실패하였습니다.')");
				out.println("location.href='"+request.getContextPath()+"/study/1120_Work/signup.jsp'");
				out.println("</script>");
			}
			else if(signPass == 1) {
				out.println("<script>");
				out.println("alert('"+mid+"님 회원가입 성공! 로그인창으로 이동합니다.')");
				out.println("location.href='"+request.getContextPath()+"/study/1120_Work/login.jsp'");
				out.println("</script>");
			}
		}
	}
}
