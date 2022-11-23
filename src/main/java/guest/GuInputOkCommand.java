package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		//성명에는 태그 사용 금지 처리!!
		name.replace("<", "$lt");
		name.replace(">", "$gt");
		
		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();
		String emailCheck = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";  
		
		vo.setName(name);
		if(email.matches(emailCheck) == true) vo.setEmail(email);	
		else vo.setEmail("이메일이 없거나 형식이 올바르지 않습니다.");
		vo.setHomePage(homePage);
		vo.setHostIp(hostIp);
		vo.setContent(content);
		
		int res = dao.setGuInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "guInputOk"); //직접 문자를 줘도 관계없당.
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
		else {
			request.setAttribute("msg", "guInputNo");
			request.setAttribute("url", request.getContextPath()+"/guInput.gu");
		}
	}

}
