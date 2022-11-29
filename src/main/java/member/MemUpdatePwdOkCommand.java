package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemUpdatePwdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid"); //세션에 있는 로그인 된 아이디를 가져온다.
		
		String oldPwd = request.getParameter("oldPwd")==null? "" : request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd")==null? "" : request.getParameter("newPwd");
		
		SecurityUtil security = new SecurityUtil();
		oldPwd = security.encryptSHA256(oldPwd); //받은 기존 비밀번호를 암호화함.
		newPwd = security.encryptSHA256(newPwd); //받은 새 비밀번호를 암호화함.
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getLoginCheck(mid);
		
		if(!vo.getPwd().equals(oldPwd)) {	//입력 받은 기존 비밀번호와 db에 있는 기존의 비밀번호가 일치하면 ?
			request.setAttribute("msg", "passwordNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdatePwd.mem");
			return;
		}
		int res = dao.setMemUpdatePwdOk(mid,newPwd);
		if(res == 1) {
			request.setAttribute("msg", "passwordOk");
			request.setAttribute("url", request.getContextPath()+"/memMain.mem");
		}
		else {
			request.setAttribute("msg", "passwordOkNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdatePwd.mem");
		}
	}

}
