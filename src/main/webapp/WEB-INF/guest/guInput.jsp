<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
  <p><br/></p>
  <div class="container">
    <form name="myform" method="post" action="${ctp}/guInputOk.gu" class="was-validated">
    	<h2>방 명 록 작 성</h2>
    	<br/>
    	<div class="form-group">
	      <label for="name">성명:</label>
	      <input type="text" class="form-control" name="name" id="name" placeholder="Enter username" required/>
	      <div class="valid-feedback">okay</div>
	      <div class="invalid-feedback">이름을 입력하세요</div>
    	</div>
    	<div class="form-group">
	      <label for="email">이메일:</label>
	      <input type="text" class="form-control" name="email" id="email" placeholder="Enter userEmail"/>
    	</div>
    	<div class="form-group">
	      <label for="homePage">홈페이지:</label>
	      <input type="text" class="form-control" name="homePage" id="homePage" value="http://" placeholder="Enter userHomepage"/>
    	</div>
    	<div class="form-group">
	      <label for="content">방명록:</label>
	      <textarea rows="5" class="form-control" name="content" id="content" required></textarea>
	      <div class="valid-feedback">okay</div>
	      <div class="invalid-feedback">방명록을 입력하세요</div>
    	</div>
    	<div class="form-group">
	    	<button type="submit" class="btn btn-primary">등록</button> <!-- 유효성검사 수정해야함. -->
	    	<button type="reset" class="btn btn-danger">다시입력</button>
	    	<button type="button" onclick="location.href='${ctp}/guList.gu';" class="btn btn-warning">돌아가기</button>
    	</div>
    	<input type="hidden" name="hostIp" id="hostIp" value="<%=request.getRemoteAddr() %>"/>
    </form>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>