<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LoginOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	if(mid.equals("admin") && pwd.equals("1234") || mid.equals("leothx_x") && pwd.equals("leo1234")) { //어드민하고 leo가 비밀번호가 맞을때만 들어온다.
		Cookie cookie = new Cookie("cMid",mid); //아이디를 쿠키 저장.
		cookie.setMaxAge(60*5); //쿠키의 만료시간은 5분.
		response.addCookie(cookie); //쿠키를 클라이언트에 저장.
		
		String mid3 = mid;
		
		out.println("<script>");
		out.println("alert('"+mid+"님 로그인 되셨습니다.');");
		out.println("location.href='t2_LoginMember.jsp';");
		out.println("</script>");		
	}
	else {
		out.println("<script>");
		out.println("alert('아이디와 비밀번호를 확인하세요!');");
		out.println("history.back();"); //회원이 아닐경우 돌아간다.
		out.println("</script>");
	}


%>