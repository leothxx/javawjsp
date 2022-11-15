<%@page import="j1116.Test2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Test2VO vo = (Test2VO) request.getAttribute("vo"); //앞에서 담았던 변수 명을 그대로 입력하여 자료값을 가져온다.
	//위쪽은 자바가 들어가는 %가 있는 서버단, 아래는 프론트언어 사용하는 뷰단으로 나눠놨던게 mvc 1패턴임.
%> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2Ok4_2.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>이곳은 test2Ok4_2.jsp 입니동</h2>
    <p>성명 : ${vo.name}</p>
    <p>학번 : ${vo.schoolNumber}</p>
    <p>국어 : ${vo.kor}</p>
    <p>영어 : ${vo.eng}</p>
    <p>수학 : ${vo.mat}</p>
    <p>사회 : ${vo.soc}</p>
    <p>과학 : ${vo.sci}</p>
    <p>총점 : ${vo.tot}</p>
    <p>평균 : ${vo.avg}</p>
    <p>학점 : ${vo.grade}</p>
 		<p><a href="<%=request.getContextPath() %>/study/1116/test2.jsp" class="btn btn-success">돌아가기</a></p>
  </div>
  <p><br/></p>
</body>
</html>