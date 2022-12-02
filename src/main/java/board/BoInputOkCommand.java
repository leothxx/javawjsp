package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoInputOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid"); //세션은 컨트롤러에서 null값 처리를 하였기에 따로 널값 처리를 하지 않아도 된다.
		String nickName = (String) session.getAttribute("sNickName");  //세션은 컨트롤러에서 null값 처리를 하였기에 따로 널값 처리를 하지 않아도 된다.
		String title = request.getParameter("title")==null? "" : request.getParameter("title");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null? "" : request.getParameter("hostIp");
		
		BoardVO vo = new BoardVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoinputOk(vo);
		if(res == 1) {
			request.setAttribute("msg", "boInputOk");
			request.setAttribute("url", request.getContextPath()+"/boList.bo");
		}
		else {
			request.setAttribute("msg", "boInputNo");
			request.setAttribute("url", request.getContextPath()+"/boInput.bo");
		}
		
	}
}
