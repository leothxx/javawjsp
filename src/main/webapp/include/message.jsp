<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	let msg = "${msg}"; 
  	let url = "${url}";
  	if(msg == "guInputOk") msg = "방명록에 글이 등록되었습니다."
  	else if(msg == "guInputNo") msg = "방명록에 글이 등록되지 않았습니다."
  	else if(msg == "adminLoginOk") msg = "관리자님 어서오세요!"
  	else if(msg == "adminLoginNo") msg = "관리자가 아니시네요 ㅡㅡ 어떤놈이야"
  	else if(msg == "adminLogoutOk") msg = "관리자님 로그아웃 되셨습니다!"
  	else if(msg == "guDeleteOk") msg = "관리자님 방명록이 삭제되었습니다!"
  	else if(msg == "guDeleteNo") msg = "관리자님 방명록이 삭제되지 않았습니다ㅠ.ㅠ"
		alert(msg);
		if(url != "") location.href = url;
  </script>
</head>
<body>
</body>
</html>