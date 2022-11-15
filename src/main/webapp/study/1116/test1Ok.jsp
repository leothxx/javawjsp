<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test1Ok.jsp -->
<%@ include file="../../include/bs4.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
	String name = request.getParameter("name")==null? "" : request.getParameter("name");
%>
<p></br></p>
<div class="container">
	<p>아이디 : <%=mid %></p>
	<p>비밀번호 : <%=pwd %></p>
	<p>이름 : <%=name %></p>
	<p><a href="test1.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<% if(mid.equals("admin") && pwd.equals("1234")) { %>
		<jsp:forward page="test1Res.jsp">
			<jsp:param value="안녕" name="flag"/>
		</jsp:forward> <!-- 포워드는 멈추지않고 바로 보내버림. (우선) admin과 1234가 맞으면 위에 출력이고 뭐고 먼저 Res로 보내버림. -->
<% } else { %>
		<jsp:forward page="test1.jsp"></jsp:forward>
<% } %>
