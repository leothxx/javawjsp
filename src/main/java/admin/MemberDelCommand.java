package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberDelCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		AdminDAO dao = new AdminDAO();
		int ans = dao.membelDel(idx);
		
		if(ans == 1) {
			request.setAttribute("msg", "memberDelOkay");
		}
		else {
			request.setAttribute("msg", "memberDelNo");
		}
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad");
	}

}
