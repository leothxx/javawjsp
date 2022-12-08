<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>calendar1.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
  	#td1, #td8, #td15, #td22, #td29, #td36 {color:red}
  	#td7, #td14, #td21, #td28, #td35 {color:blue}
  	.today {
  		background-color : pink;
  		color : #fff;
  		font-weight: bolder;
  	}
  </style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
  <p><br/></p>
  <div class="container">
    <div class="text-center">
    	<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy-1}&mm=${mm}'" class="btn btn-secondary btn-sm" title="이전년도">◁◁</button>
    	<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm-1}'" class="btn btn-secondary btn-sm" title="이전월">◀</button>
    	<font size="5">${yy}년 ${mm+1}월</font>
    	<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm+1}'" class="btn btn-secondary btn-sm" title="다음월">▶</button>
    	<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy+1}&mm=${mm}'" class="btn btn-secondary btn-sm" title="다음년도">▷▷</button>
    	&nbsp; &nbsp;
    	<button type="button" onclick="location.href='${ctp}/calendar1.st'" class="btn btn-secondary btn-sm" title="오늘날짜"><i class="fa fa-home"></i></button>
    </div>
    <br/>
    <div class="text-center">
    	<table class="table table-bordered" style="height: 20vh;">
    		<tr class="text-center" style="background-color: #eee">
    			<th style="width:13%; color: red; vertical-align:middel">일</th>
    			<th style="width:13%; vertical-align:middel">월</th>
    			<th style="width:13%; vertical-align:middel">화</th>
    			<th style="width:13%; vertical-align:middel">수</th>
    			<th style="width:13%; vertical-align:middel">목</th>
    			<th style="width:13%; vertical-align:middel">금</th>
    			<th style="width:13%; color: blue; vertical-align:middel">토</th>
    		</tr>
    		<tr>
    			<!-- 시작일 이전을 공백처리 한다. (오늘이 목요일이면 startWeek가 5이기에, 1~4칸을 공백처리한다. -->
    			<c:set var="gap" value="1"/>
    			<c:forEach begin="1" end="${startWeek-1}">
    				<td>&nbsp;</td>
	    			<c:set var="gap" value="${gap+1}"/>
    			</c:forEach>
    			
    			<!-- 해당 월에 대한 날짜를 마지막 일자까지 반복 출력한다. 단, gap이 7이되면 줄바꿈한다. -->
    			<c:forEach begin="1" end="${lastDay}" varStatus="st">
    				<c:set var="todaySw" value="${toYear == yy && toMonth == mm && toDay == st.count ? 1 : 0}"/>
    				<td id="td${gap}" ${todaySw == 1 ? 'class=today' : ''}>
    					${st.count}
    				</td>
    				<c:if test="${gap % 7 == 0}"></tr><tr></c:if>
    				<c:set var="gap" value="${gap+1}"/>
    			</c:forEach>
    		</tr>
    	</table>
    </div>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>