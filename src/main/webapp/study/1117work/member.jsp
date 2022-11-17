<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>member.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
  	.container {
  		margin: 0 auto;
  	}
  </style>
</head>
<body>
  <p><br/></p>
  <div class="container">
  	<table>
  		<tr>
  			<th>${sMid}님 어서오세요.</th>
  		</tr>
  		<tr>
  			<td><p><img src="../../images/gif/19.gif"/></p></td>
  		</tr>
  		<tr>
  			<td>today : ${aVisitCnt}</td>
  		</tr>
  		<% if(mid.equals("admin")) { %>
  		<tr>
  			<td><p><a href="${pageContext.request.contextPath}/work1117/AdminReset" class="btn btn-danger">today 초기화</a></p></td>
  		</tr>
  		 <%}%>
  	</table>
    <p><a href="${pageContext.request.contextPath}/work1117/LogOut" class="btn btn-warning"/>로그아웃</a></p>
  </div>
  <p><br/></p>
</body>
</html>