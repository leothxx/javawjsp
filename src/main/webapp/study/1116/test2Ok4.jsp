<%@page import="study.j1116.Test2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	Test2VO vo = (Test2VO) request.getAttribute("vo"); //앞에서 담았던 변수 명을 그대로 입력하여 자료값을 가져온다.
	System.out.println("jsp에서 vo : " +vo);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2Ok4.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>이곳은 test2Ok4.jsp 입니동</h2>
    <p>jsp에서의 vo : <%=vo %></p>
    <p>성명 : <%=vo.getName()%></p>
    <p>학번 : <%=vo.getHakbun()%></p>
    <p>국어 : <%=vo.getKor()%></p>
    <p>영어 : <%=vo.getEng()%></p>
    <p>수학 : <%=vo.getMat()%></p>
    <p>사회 : <%=vo.getSoc()%></p>
    <p>과학 : <%=vo.getSci()%></p>
    <p>총점 : <%=vo.getTot()%></p>
    <p>평균 : <%=vo.getAvg()%></p>
    <p>학점 : <%=vo.getGrade()%></p>
 		 <p><a href="<%=request.getContextPath() %>/study/1116/test2.jsp" class="btn btn-success">돌아가기</a></p>
  </div>
  <p><br/></p>
</body>
</html>