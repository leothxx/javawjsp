package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemInforCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid"); //값을 보고 클릭했기에 어차피 넘어오기 때문에 null값 체크를 하지 않았음. 해도 된다.
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getLoginCheck(mid); //가져오는 자료가 한건이기에 vo로 받음.
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		else if(vo.getLevel() == 4) strLevel = "운영자";
		request.setAttribute("strLevel", strLevel);
		request.setAttribute("vo", vo);
	}

}
