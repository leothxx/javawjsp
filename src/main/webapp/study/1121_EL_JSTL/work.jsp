<%@page import="java.util.ArrayList"%>
<%@page import="study.database.JusorokDAO"%>
<%@page import="study.database.JusorokVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl4.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>Function 라이브러리 20221121 과제</h2>
  <hr/>
<%
							 //0         1         2
               //01234567890123456789012
  String atom = "Welcome to My Homepage!";
	pageContext.setAttribute("atom", atom);
	pageContext.setAttribute("atom2", atom);
%>
  <p>
    5-3 atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치값을 출력하시오
    		단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/>
    <b>atom 변수에 기억되어 있는 문자 값 : <font color='red'>Welcome to My Homepage!</font></b>
    <form name="test1">
    	<input type="text" name="test1" id="test1"/>
    	<input type="submit" value="전송"/>
    </form>
    <c:set var="test1" value="${param.test1}"/>
    <c:set var="cnt" value="0"/>
 		<!-- 반복문!! --> 
    <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
    	<c:if test="${fn:substring(atom,i,i+1) == test1}">
    		<c:set var="cnt" value="${cnt + 1}"/>
    		<c:set var="sw" value="${i}"/>
    		<c:if test="${cnt == 1}">
    			<c:set var="result1" value="${sw}"/>
    		</c:if>
    		<c:if test="${cnt == 2}">
    			<c:set var="result2" value="${sw}"/>
    		</c:if>
   		</c:if>
    </c:forEach>
 		<!-- 출력!! --> 
 		<c:if test="${result2 != null}">
 			문자 ${test1}의 두번째 위치는 ${result2} 입니다.<br/>    		
 		</c:if>
 		<c:if test="${result1 != null && result2 == null}">
 			문자 ${test1}의 두번째는 값은 없으며, 첫번째 위치는 ${result1} 입니다.<br/>    		
 		</c:if>
    <!-- 다음문제 -->
   	<hr/><br/>
    6-2.atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치값을 출력하시오
    		단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/>
    <b>atom 변수에 기억되어 있는 문자 값 : <font color='red'>Welcome to My Homepage!</font></b><br/>
    <form name="test2">
    	<input type="text" name="test2" id="test2"/>
    	<input type="submit" value="전송"/>
    </form>
    <c:set var="test2" value="${param.test2}"/>
    <c:set var="first" value="${fn:substringBefore(atom,test2)}"/>	<!-- 4 -->	
    <c:set var="last" value="${fn:substringAfter(atom,test2)}"/> <!-- 18 -->
    <c:set var="answer" value="${fn:indexOf(last,test2)}"/> <!-- 5 -->
    <c:if test="${test2 != null}">
	    <c:if test="${answer == -1}">입력한 ${test2}의 첫번째 위치는 ${fn:length(first)}이며 두번째 값은 없습니다.</c:if>
	    <c:if test="${answer != -1}">입력한 ${test2}의 두번째 위치는 ${answer+fn:length(first)+1}입니다.</c:if>    
    </c:if>
   	<hr/><br/>
  </p>
</div>
<p><br/></p>
</body>
</html>