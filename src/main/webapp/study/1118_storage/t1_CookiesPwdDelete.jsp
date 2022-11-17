<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesPwdDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cPwd")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}		
		}
	}
%>
<script>
	alert("비밀번호 쿠키 삭제 완료!!");
	location.href="t1_CookiesMain.jsp"; //메인으로 보내기.
</script>