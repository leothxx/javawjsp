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
  <h2>Function 라이브러리</h2>
  <p>사용법 : $ { fn:함수명(변수/값...)}</p>
  <hr/>
<%
							 //0         1         2
               //01234567890123456789012
  String atom = "Welcome to My Homepage!";
	pageContext.setAttribute("atom", atom);
	pageContext.setAttribute("atom2", atom);
%>
  <p>
    atom 변수의 값 : <%=atom%> / ${atom}<br/>
    1.atom변수 값의 길이 : <%=atom.length() %> / ${fn:length(atom)}<br/>
    2.대문자변환(toUpperCase()) : <%=atom.toUpperCase() %> / ${fn:toUpperCase(atom)}<br/>
    3.소문자변환(toLowerCase()) : <%=atom.toLowerCase() %> / ${fn:toLowerCase(atom)}<br/>
    4-1.문자열추출1(substring()) : <%=atom.substring(0,3) %> / ${fn:substring(atom,0,3)}<br/>
    4-2.문자열추출2(substring()) : <%=atom.substring(2) %> / <%-- ${fn:substring(atom,2)} --%>
                                                           ${fn:substring(atom,2,fn:length(atom))}<br/>
    4-3.문자열추출3(substring()) : <%=atom.substring(2) %> / ${fn:substring(atom,2,-1)}<br/>
    5.특정문자열의 위치값찾기(indexOf()) : <%=atom.indexOf("o") %> / ${fn:indexOf(atom, 'o')}<br/>
    5-2. atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력하시오?<br/>
    <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
    	<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
    		문자 'o'의 위치는 ${i} 입니다.<br/>
    	<c:set var="cnt" value="${cnt + 1}"/>
    	</c:if>
    </c:forEach>
    <p>문자 'o'의 전체 개수는? ${cnt} 입니다.</p>
    <hr/>
    <br/>
    5-3 atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치값을 출력하시오
    		단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/>
    <b>atom 변수에 기억되어 있는 문자 값 : <font color='red'>Welcome to My Homepage!</font></b>
    <form name="test1">
    	<input type="text" name="test1" id="test1"/>
    	<input type="submit" value="전송"/>
    </form>
    <c:set var="test1" value="${param.test1}"/>
    <c:set var="su1" value="0"/>
    
    <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
    	<c:if test="${fn:indexOf(atom,test1) != null}">
    		<c:set var="su1" value="${su1 + 1}"/>
    		<c:set var="atom2" value="${fn:indexOf(atom,test1)}"/>
    		<c:if test="${fn:indexOf(atom,test1) != null && su1 == 1}">
    		<c:set var="atom2" value="${fn:indexOf(atom,test1)}"/>
    			두번째로 기억되어 있는 위치값 = ${atom2}
    		</c:if>
    		<b>${su1} , ${atom2}</b><br/>
    	</c:if>
    </c:forEach>
    
    <hr/><br/>
    6.문자열추출(substringBefore() / substringAfter())<br/>
    	문자 'o' 앞의 문자열 출력 : ${fn:substringBefore(atom, 'o')}<br/>		
    	문자 'o' 뒤의 문자열 출력 : ${fn:substringAfter(atom, 'o')}<br/>
   	<hr/><br/>
    6-2.atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치값을 출력하시오
    		단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오. (위에꺼 사용)
   	<hr/><br/>
   	7.문자열 분리(split(변수, 분리할문자))<br/> <!-- 스플릿은 분리한 값이 나오기에, 여러개가 올 수 있어 배열에 담아야함. 고로 배열을 선언해야함. -->
   		atom 변수의 문자중 'o'문자를 기준으로 분리<br/>
   		<c:set var="atoms" value="${fn:split(atom,'o')}"></c:set>
   		<c:forEach var="atom" items="${atoms}" varStatus="st">
   			${st.count}.${atom}<br/>
   		</c:forEach>
   		atoms의 전체 길이 = ${fn:length(atoms)}<br/>
   		<hr/>
   		예) jusorok 테이블의 전체 건 수는?
   		<%
   			JusorokDAO dao = new JusorokDAO();
   			ArrayList<JusorokVO> vos = dao.getMemberList();
   			request.setAttribute("vos", vos);
   		%>
   		${fn:length(vos)}건 <br/>
   		<hr/><br/>
   		8.문자열 치환(replace())<br/>
   			문제: 'My'를 'Your'로 변경하시오.
   			<%=atom.replace("My", "Your") %> / ${fn:replace(atom2,"My","Your")}<br/>
   		<hr/>
   		9.특정문자 포함유무 ? contains()<br/>
   			atom2변수에 'o'를 포함하고 있는지 ?
   			${fn:contains(atom2,'o')}<br/>					
   			atom2변수에 'My'를 포함하고 있는지 ?
   			${fn:contains(atom2,'My')}<br/>					
   			atom2변수에 'Your'를 포함하고 있는지 ?
   			${fn:contains(atom2,'Your')}<br/>					
  </p>
</div>
<p><br/></p>
</body>
</html>