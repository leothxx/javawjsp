<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>form.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
  <p><br/></p>
  <div class="container">
  	<h2>자료 전송 연습</h2>
    <!-- <form name="myform" method="post" action="el1.jsp"> -->
    <form name="myform" method="post" action="${pageContext.request.contextPath}/study/el_jstl_El2">
	    <div>
	    	성명 : <input type="text" name="name" value="홍길동" class="form-control"/>
    	</div>
	    <div>취미 : 
	    	<input type="checkbox" name="hobby" value="축구" checked/>축구
	    	<input type="checkbox" name="hobby" value="육상"/>육상
	    	<input type="checkbox" name="hobby" value="수영"/>수영
	    	<input type="checkbox" name="hobby" value="싸이클"/>싸이클
	    	<input type="checkbox" name="hobby" value="여행"/>여행
	    	<input type="checkbox" name="hobby" value="사진"/>사진
	    	<input type="checkbox" name="hobby" value="패션"/>패션
	    </div>
    	<div>
    		<input type="submit" value="전송" class="btn btn-success form-control"/>
    	</div> 
    </form>
  </div>
  <p><br/></p>
</body>
</html>