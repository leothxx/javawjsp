<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl5.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>format 라이브러리</h2>
    <p>형식문자열을 지정할때 사용(쉼표, 화폐단위, 백분율... 등)</p>
    <p>문법 : < fmt : 명령어 value="$ {값}" pattern="표현패턴" type="화폐단위"> </p>
   	<h5>formatNumber 형식을 지정한 출력</h5>
   	1-1.천단위마다 콤마표시 : <fmt:formatNumber value="1234567"/><br/>
   	<%
   		int won = 7654321;
   		pageContext.setAttribute("won", won);
   	%>
   	1-2.사용예 : <fmt:formatNumber value="${won}"/><br/>
   	1-3.사용예 1234.567 : <fmt:formatNumber value="1234.567" pattern="#,##0.0"/><br/> <!-- 패턴으로 끊으면 자동으로 반올림함. 콤마뒤 소숫점 1번째자리까지만 -->
   	2.화폐단위 : <fmt:formatNumber value="${won}" type="currency"/><br/> <!-- currency는 국가별 설정으로 컴퓨터 국가에 따라 지정되서 자동으로 나옴. -->
   	2-1.화폐단위(영문) : <fmt:formatNumber value="${won}" type="currency" currencyCode="USD"/><br/> <!-- 달러로 화폐를 출력 -->
   	<c:set var="su1" value="0.9543"/>
   	3.백분율 : <fmt:formatNumber value="${su1}" type="percent"/><br/> <!-- 백분율이란 일반 숫자에 100을 곱한 후 %로 표기한 것임.! -->
   	<br/>
   	<h5>formatDate 형식을 지정한 출력</h5>
   	<p>자바형식의 날짜(객체)를 jstl변수에 저장 : <c:set var="now" value="<%=new java.util.Date() %>"/> </p> <!-- 꼭 알아둬야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
   	<p>
   		오늘 날짜 : ${now}<br/>
   		<fmt:formatDate value="${now}"/><br/> <!-- 년월일. 으로 나옴. ex) 2022. 11. 21. -->
   		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/><br/>
   		<fmt:formatDate value="${now}" pattern="hh : mm : ss"/><br/>
   		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss"/><br/>
   		<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br/>
   	</p>
   	<hr/>
   	<h3>국가별설정(로케일)</h3>
   	<p>
   		톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br/>
   		톰캣 서버의 기본 로케일 (미국식 변경) : <fmt:setLocale value="en_US"/>
   		<fmt:formatNumber value="${won}" type="currency"/><br/>
   		톰캣 서버의 기본 로케일 (일본식 변경) : <fmt:setLocale value="jp_JP"/>
   		<fmt:formatNumber value="${won}" type="currency"/><br/>
   	</p>
   	<h4>기타</h4>
   	<p>지정된 곳으로 이동 : location.href() </p>
   	<%-- <c:redirect url="jstl1.jsp"/> --%> 
   	<p>절대경로 : 그림1 <img src="${ctp}/images/gif/6.gif" width="200px"/></p><br/> 
   	<p>
   		URL 문 : 그림2 <c:url var="img" value="../../images/gif/19.gif"/><br/>
   								<img src="${img}" width="200px"/>0
   	</p> 
  </div>
  <p><br/></p>
</body>
</html>