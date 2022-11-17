<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies(); //쿠키 가져오기.
	String mid = "";
	String mid2 = "";
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				mid2 = cookies[i].getValue();
				pageContext.setAttribute("mid",mid);
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				break;
			}
		}		
	}
%>
<script>
	alert("${mid}님의 아이디 쿠키 삭제 완료!!");
	location.href="t2_LoginMember.jsp?mid2='<%=mid2 %>'"; //메인으로 보내기.
</script>