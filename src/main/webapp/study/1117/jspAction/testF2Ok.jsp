<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 접두어는 코어라이브러리는 c로 약속되어있음. 관례너낌 -->
<% request.setCharacterEncoding("utf-8"); %>
<!-- 앞에서 전송된 값들을 변수에 담아보자... -->
<%-- <c:set var="name" value="${param.name}"/> <!-- param을 붙히면 앞에 매개변수에서 들어오는 값을 가져온다. -->
<c:set var="gender" value="${param.gender}"/>
<c:set var="age" value="${param.age}"/>
<c:set var="job" value="${param.job}"/>
<c:set var="address" value="${param.address}"/> --%>

<!-- 자바 클래스를(VO)를 사용하여 넘어온 값들을 저장하고자 한다. -->
<!-- 자바 클래스는 jsp액션태그(jsp:useBean)를 사용한다. -->
<jsp:useBean id="vo" class="study.j1117.Test1VO"/> <!-- 좌측 명령어가 java로 친다면 ? Test1VO vo = new Test1VO(); 와 같은것임. -->

<!-- 생성된 클래스에 값을 넣을때 : jsp:setProperty 태그 사용 --> <!-- 프론트 방식 -->
<!-- 생성된 클래스에 값을 꺼낼때 : jsp:getProperty 태그 사용 --> <!-- 프론트 방식 -->
<jsp:setProperty property="name" name="vo"/> <!-- 이게 vo에 담는 과정이라고 생각하면 됨. -->
<jsp:setProperty property="gender" name="vo"/>
<jsp:setProperty property="age" name="vo"/>
<jsp:setProperty property="job" name="vo"/>
<jsp:setProperty property="address" name="vo"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>testF1Ok.jsp</title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>전송된 자료 결과 보기</h2>
    <p>
    	<table class="table table-bordered">
    		<tr>
    			<th>성명</th>
    			<td>${name} / <jsp:getProperty property="name" name="vo"/></td> <!-- jstl이 정의한 변수도 el로 사용이 가능함. 우아아앙 신기. -->
    		</tr>
    		<tr>
    			<th>성별</th>
    			<td>${gender} / <jsp:getProperty property="gender" name="vo"/></td>
    		</tr>
    		<tr>
    			<th>나이</th>
    			<td>${age + 1} / <jsp:getProperty property="age" name="vo"/></td>
    		</tr>
    		<tr>
    			<th>직업</th>
    			<td>${job} / <jsp:getProperty property="job" name="vo"/></td>
    		</tr>
    		<tr>
    			<th>주소</th>
    			<td>${address} / <jsp:getProperty property="address" name="vo"/></td>
    		</tr>
    	</table>
    </p>
    <hr/>
  </div>
  <p><br/></p>
</body>
</html>