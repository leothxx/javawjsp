<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionSave.jsp -->
<%
	String mid = (request.getParameter("mid")==null || request.getParameter("mid")=="") ? "leothx_x" : request.getParameter("mid");
	String nickName = (request.getParameter("nickName")==null || request.getParameter("nickName")=="") ? "레오" : request.getParameter("nickName");
	int age = (request.getParameter("age")==null || request.getParameter("age")=="") ? 24 : Integer.parseInt(request.getParameter("age"));
	String name = (request.getParameter("name")==null || request.getParameter("name")=="") ? "서하늘" : request.getParameter("name");

	session.setAttribute("sMid", mid); //세션에 저장
	session.setAttribute("sNickName", nickName); //세션에 저장
	session.setAttribute("sAge", age); //세션에 저장
	session.setAttribute("sName", name); //세션에 저장
%>
<script>
	alert("${sName}님 세션이 저장되셨습니다.!!");
	location.href="t3_SessionMain.jsp"; //메인으로 보내기.
</script>