<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionPwdNickName.jsp -->
<%
	session.removeAttribute("sNickName"); //닉네임 세션 지우기.
%>
<script>
	alert("${sName}님의 닉네임 세션이 삭제되었습니당.!!");
	location.href="t3_SessionMain.jsp"; //메인으로 보내기.
</script>