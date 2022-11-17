<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionGroup.jsp -->
<%
	Enumeration names = session.getAttributeNames(); //열거형으로 받아야함.
	
	while(names.hasMoreElements()){ //names에 자료가 있으면 true 없으면 false
		String name = (String) names.nextElement();
		out.println("세션명 : "+name+"<br/>");
	}

%>
<p>
	<a href="t3_SessionMain.jsp" class="btn btn-info">돌아가기</a>
</p>