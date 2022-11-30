package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemInforCommand;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/adMain")) {
			viewPage += "/adMain.jsp";
		}
		else if(com.equals("/adLeft")) {
			viewPage += "/adLeft.jsp";
		}
		else if(com.equals("/adContent")) {
			command = new AdContentCommand();
			command.execute(request, response);
			viewPage += "/adContent.jsp";
		}
		else if(com.equals("/adMemList")) {
			command = new AdMemberListCommand();
			command.execute(request, response);
			viewPage += "/member/adMemList.jsp";
		}
		else if(com.equals("/adMemInfor")) {
			command = new MemInforCommand(); //똑같은 내용이기에 다중상속하여 meminforcommand를 ad에서도 이용함.
			command.execute(request, response);
			viewPage += "/member/adMemInfor.jsp";
		}
		else if(com.equals("/adMemberSearch")) {
			command = new AdMemberSearchCommand();
			command.execute(request, response);
			viewPage += "/member/adMemList.jsp";
		}
		else if(com.equals("/adMemberLevel")) {
			command = new AdMemberLevelCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/memberDel")) {
			command = new MemberDelCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
