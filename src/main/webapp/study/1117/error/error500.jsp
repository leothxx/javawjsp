<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>error500.jsp</title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h3>페이지 점검 중</h3>
    <p>작업에 불편을 끼쳐드려 죄송합니다.</p>
    <p>빠른 시일내에 복구하도록 하겠습니다.</p>
    <p><a href="http://192.168.50.67:9090/javawjsp/" target="_blank">돌아가기</a></p>
    <p><img src="${pageContext.request.contextPath}/images/점검중1.jpg"/></p>
  </div>
  <p><br/></p>
</body>
</html>