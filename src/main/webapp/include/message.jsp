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
  	let val = "${val}";
  	if(msg == "guInputOk") msg = "방명록에 글이 등록되었습니다."
  	else if(msg == "guInputNo") msg = "방명록에 글이 등록되지 않았습니다."
  	else if(msg == "adminLoginOk") msg = "관리자님 어서오세요!"
  	else if(msg == "adminLoginNo") msg = "관리자가 아니시네요 ㅡㅡ 어떤놈이야"
  	else if(msg == "adminLogoutOk") msg = "관리자님 로그아웃 되셨습니다!"
  	else if(msg == "guDeleteOk") msg = "관리자님 방명록이 삭제되었습니다!"
  	else if(msg == "guDeleteNo") msg = "관리자님 방명록이 삭제되지 않았습니다ㅠ.ㅠ"
  	else if(msg == "loginOk") msg = val+"님 로그인 성공!!";
  	else if(msg == "loginNo") msg = "로그인 실패 ^-^";
  	else if(msg == "memLogoutOk") msg = val+"님이 로그아웃 되셨습니다.";
  	else if(msg == "idCheckNo") msg = "중복된 아이디입니다.";
  	else if(msg == "nickCheckNo") msg = "중복된 닉네임입니다.";
  	else if(msg == "memJoinOk") msg = "회원 가입 완료!";
  	else if(msg == "memJoinNo") msg = "회원 가입에 실패하였습니다. ㅜㅜ";
  	else if(msg == "passwordNo") msg = "기존 비밀번호가 일치하지 않습니다.";
  	else if(msg == "passwordOk") msg = "비밀번호가 변경되었습니다.";
  	else if(msg == "passwordOkNo") msg = "비밀번호 변경에 실패하였습니다..";
  	else if(msg == "passwordYes") msg = "회원정보변경 페이지로 이동합니다.";
  	else if(msg == "memUpdateOk") msg = "회원정보가 변경되었습니다.";
  	else if(msg == "memUpdateNo") msg = "회원정보 변경실패!";
  	
		alert(msg);
		if(url != "") location.href = url;
  </script>
</head>
<body>
</body>
</html>