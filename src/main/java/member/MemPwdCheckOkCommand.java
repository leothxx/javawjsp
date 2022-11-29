package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemPwdCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd); //받은 새 비밀번호를 암호화함.
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getLoginCheck(mid);
		
		if(!vo.getPwd().equals(pwd)) {	//입력 받은 기존 비밀번호와 db에 있는 기존의 비밀번호가 일치하지 않다면 ?
			request.setAttribute("msg", "passwordNo");
			request.setAttribute("url", request.getContextPath()+"/memPwdCheck.mem");
		}
		else {
			request.setAttribute("msg", "passwordYes");
			request.setAttribute("url", request.getContextPath()+"/memUpdate.mem");
		}
		
		
		
	}
}
