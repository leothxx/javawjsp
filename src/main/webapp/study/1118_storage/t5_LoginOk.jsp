<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t5_LoginOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	if(mid.equals("admin") && pwd.equals("1234") || mid.equals("leothx_x") && pwd.equals("leo1234")) { //어드민하고 leo가 비밀번호가 맞을때만 들어온다.
		session.setAttribute("sMid", mid);	
		
		int visiCnt = 0;
		
		if(application.getAttribute("aVisitCnt") == null) {
			application.setAttribute("aVisitCnt", 1);		
		}
		else {
			visiCnt = (int) application.getAttribute("aVisitCnt") + 1;
			application.setAttribute("aVisitCnt", visiCnt);					
		}
		
		
		out.println("<script>");
		out.println("alert('"+mid+"님 로그인 되셨습니다.');");
		out.println("location.href='t5_LoginMember.jsp';");
		out.println("</script>");		
	}
	else {
		out.println("<script>");
		out.println("alert('아이디와 비밀번호를 확인하세요!');");
		out.println("history.back();"); //회원이 아닐경우 돌아간다.
		out.println("</script>");
	}


%>