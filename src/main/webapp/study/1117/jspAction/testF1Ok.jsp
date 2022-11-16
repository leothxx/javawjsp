<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 접두어는 코어라이브러리는 c로 약속되어있음. 관례너낌 -->
<% request.setCharacterEncoding("utf-8"); %>
<!-- 앞에서 전송된 값들을 변수에 담아보자... -->
<c:set var="name" value="${param.name}"/> <!-- param을 붙히면 앞에 매개변수에서 들어오는 값을 가져온다. -->
<c:set var="gender" value="${param.gender}"/>
<c:set var="age" value="${param.age}"/>
<c:set var="job" value="${param.job}"/>
<c:set var="address" value="${param.address}"/>

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
    			<td>${name}</td> <!-- jstl이 정의한 변수도 el로 사용이 가능함. 우아아앙 신기. -->
    		</tr>
    		<tr>
    			<th>성별</th>
    			<td>${gender}</td>
    		</tr>
    		<tr>
    			<th>나이</th>
    			<td>${age + 1}</td>
    		</tr>
    		<tr>
    			<th>직업</th>
    			<td>${job}</td>
    		</tr>
    		<tr>
    			<th>주소</th>
    			<td>${address}</td>
    		</tr>
    	</table>
    </p>
    <hr/>
  </div>
  <p><br/></p>
</body>
</html>