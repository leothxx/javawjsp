<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl1.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>JSTL(Java Standard Tag Library)</h2>
    <table class="table">
    	<tr>
    		<th>라이브러리명</th>
    		<th>주소(URL)</th>
    		<th>접두어</th>
    		<th>기본문법</th>
    	</tr>
    	<tr>
    		<td>Core</td>
    		<td>Http://java.sun.com/jsp/jstl/core</td>
    		<td>c</td>
    		<td>< c : 태그... ></td>
    	</tr>
    	<tr>
    		<td>Function</td>
    		<td>Http://java.sun.com/jsp/jstl/function</td>
    		<td>fn</td>
    		<td>$ < fn : 태그... ></td>
    	</tr>
    	<tr>
    		<td>Formatting</td>
    		<td>Http://java.sun.com/jsp/jstl/fmt</td>
    		<td>fmt</td>
    		<td>< fmt : 태그... ></td>
    	</tr>
    	<tr>
    		<td>SQL</td>
    		<td>Http://java.sun.com/jsp/jstl/sql</td>
    		<td>sql</td>
    		<td>< sql : 태그... ></td>
    	</tr>
    </table>
    <hr/>
    <br/><hr/>
    <h4>Core라이브러리 : 변수제어(선언/할당/출력/제거), 제어문(조건,반복문)안에서의 변수로 활용</h4>
    <p>변수 선언 : < c : set var="변수명" value="값" /></p>
    <p>변수 출력 : < c : out value="변수명/값" /></p>
    <p>변수 제거 : < c : remove var="변수명" /></p>
    <p>사용예:<br/>
    	su1변수 선언 후 초기값을 100으로 할당 : <c:set var="su1" value="100"/><br/> <!-- 값 저장 후 el로 출력한다는 개념정도만 이해해도 okay -->
    	su1변수의 값을 출력 : <c:out value="${su1}"/> == ${su1}<br/> <!-- ==의 우측처럼 el로 출력하는 것이 훨씬 간단함. -->
    </p>
    <hr/>
    <h3>JSTL 제어문(core 라이브러리에서의 활용)</h3>
    <h3>if문(조건문 : 참일때만 수행할 내용이 있음. 즉, else문장이 없다.)</h3>
    <p> 문법 : < c : if test="$ { 조건식 }" > 참일때만 수행할 내용 < / c: if></p>
    (일반 비교연산 수행시는 '문자'로 비교처리 한다. 따라서 숫자로 비교하려면 숫자로 변형해서 비교한다.)<br/>
    <c:set var="su2" value="200"/>
    <c:set var="su3" value="200"/>
    1-1. su1 == su2 : <c:if test="${su1 eq su2}">su1과 su2는 같습니당.</c:if><br/> <!-- c:if에서 비교할때 무조건 el표기법을 사용해야 함. -->
    1-2. su1 != su2 : <c:if test="${su1 ne su2}">su1과 su2는 같지 않습니당.</c:if><br/><br/>
    2-1. su1 >= su2 : <c:if test="${su1 >= su2}">su1이 su2보다 크거나 같습니당.</c:if><br/>
    2-2. su1 < su2 : <c:if test="${su1 < su2}">su1이 su2보다 작습니당.</c:if><br/><br/>
    3-1. su2 == su3 : <c:if test="${su2 == su3}">su2와 su3는 같다.</c:if><br/> <!-- 같은 200이지만 문자로 비교함. -->
    3-2. su2 != su3 : <c:if test="${su2 != su3}">su2와 su3는 다르다.</c:if><br/><br/>
    <%-- 
    4-1. su2 == su3 : <c:if test="${su2+0 == su3+0}">su2와 su3는 같다.</c:if><br/> <!-- 문자를 숫자비교하고싶다면, trim으로 공백을 없앤 후 연산을 시켜 비교를하면 숫자로 비교를 하게 된다. -->
    4-2. su2 != su3 : <c:if test="${su2+0 != su3+0}">su2와 su3는 다르다.</c:if><br/><br/>
    --%>
    <hr/>
    <p>점수를 입력 후 학점 버튼을 클릭하면 해당 학점을 출력하세요.</p>
    <form name="myform">
    	<div>
    		성별
    		<input type="radio" name="gender" value="1" checked/>남자
    		<input type="radio" name="gender" value="2"/>여자
    	</div>
    	<div>
	    	점수 <input type="text" name="score" id="score" class="form-control mb-2"/>
	    	<input type="submit" value="학점" class="btn btn-warning"/>
    	</div>
    	<c:set var="score" value="${param.score}"/>
    	<c:set var="gender" value="${param.gender}"/>
    	<c:if test="${score >= 90}"><c:set var="grade" value="A"/></c:if>
    	<c:if test="${score < 90 && score >= 80}"><c:set var="grade" value="B"/></c:if>
    	<c:if test="${score < 80 && score >= 70}"><c:set var="grade" value="C"/></c:if> <!-- else if가 없기에 작고를 &&로 줬지만, 순서를 거꾸로 바꾸는 방법도 있다. -->
    	<c:if test="${score < 70 && score >= 60}"><c:set var="grade" value="D"/></c:if>
    	<c:if test="${score < 60}"><c:set var="grade" value="F"/></c:if>
    	<c:if test="${gender == 1}"><c:set var="sex" value="남자"/></c:if>
    	<c:if test="${gender == 2}"><c:set var="sex" value="여자"/></c:if>
    	<div>
    	입력한 점수 : ${param.score}<br/>
    	계산된 학점 : ${grade}<br/>
    	성별 : ${sex}<br/>
    	</div>
    </form>
    <br/>
    <hr/>
    <h2>다중조건비교(choose ~ when)</h2>
    <pre>
    	문법 : < c : choose >
    					< c : when test="조건식">수행할내용< / c: when>
    					< c : when test="조건식2">수행할내용2< / c: when>
    					~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    					< c : otherwise>수행할내용2< / c: otherwise>
    			 < /c : choose >
    </pre>
    <c:choose>
    	<c:when test="${score >= 90}"><c:set var="grade2" value="A"/></c:when>
    	<c:when test="${score >= 80}"><c:set var="grade2" value="B"/></c:when>
    	<c:when test="${score >= 70}"><c:set var="grade2" value="C"/></c:when>
    	<c:when test="${score >= 60}"><c:set var="grade2" value="D"/></c:when>
    	<c:otherwise><c:set var="grade2" value="F"/></c:otherwise>
    </c:choose>    
    <h4>점수를 입력 후 학점 버튼을 클릭하면 해당 학점을 출력 : ${grade2}</h4>
  </div>
  <p><br/></p>
</body>
</html>