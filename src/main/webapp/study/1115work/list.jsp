<%@page import="j1115work.WorkVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	WorkVO vo = (WorkVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>상품조회</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
 <div class="container">
 		<table>
 			<tr>
 				<td><div>구매자 ${vo.buyerName}님의 상품조회 리스트 입니다.</div></td>
 			</tr>
 			<tr>
 				
 			</tr>
 		</table>   
 </div>
</body>
</html>