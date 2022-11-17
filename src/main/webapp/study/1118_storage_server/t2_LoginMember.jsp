<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_LoginMember.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
  	img {
  		width: 300px;
  		height: 200px;
  	}
  </style>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>회원 전용방</h2>
    <p><font color="blue">${sMid}</font>님 로그인 중이십니다.</p>
    <hr/>
    <p>
	    <img src="${pageContext.request.contextPath}/images/gif/19.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/20.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/21.gif"/>
    </p>
    <br/>
    <p>
	    <img src="${pageContext.request.contextPath}/images/gif/17.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/15.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/18.gif"/>
    </p>
    <hr/>
    <div class="row">
	    <div class="col"><a href="${pageContext.request.contextPath}/study/storage/T2_LogOut" class="btn btn-success form-control">로그아웃</a></div>
	    <div class="col"><a href="${pageContext.request.contextPath}/study/1118_storage/t2_LoginDelete.jsp" class="btn btn-success form-control">쿠키 아이디 삭제</a></div>
    </div>
  </div>
  <p><br/></p>
</body>
</html>