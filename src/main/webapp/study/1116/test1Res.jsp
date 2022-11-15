<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
	String name = request.getParameter("name")==null? "" : request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1Res.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>이곳은 관리자 인증 후 도착한 곳 입니당.</h2>
    <p>아이디 :<%=mid %> </p>
    <p>성명 :<%=name %> </p>
    <p><a href="test1.jsp" class="btn btn-warning">돌아가기</a></p>
  </div>
  <p><br/></p>
</body>
</html>
<jsp:forward page="test1ResOk.jsp"></jsp:forward>