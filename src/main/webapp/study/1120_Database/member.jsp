<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>member.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function searchMid() {
  		let mid = prompt("찾고자 하는 아이디를 입력하세요?");
  		
  		location.href="${pageContext.request.contextPath}/database/SearchMid?mid="+mid;
  	}
  </script>
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
    <p><font color="blue">${sName}</font>님 로그인 중이십니다.</p>
    <hr/>
    <p>
    	현재 포인트 잔액 : <font color="red"><b>${point}</b></font><br/>
    	최근 방문일 : <font color="blue"><b>${sLastDate}</b></font>
    </p>
    <hr/>
    <p>
	    <img src="${pageContext.request.contextPath}/images/gif/19.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/20.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/21.gif"/>
    </p>
    <br/>
    <p>
	    <img src="${pageContext.request.contextPath}/images/gif/6.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/9.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/13.gif"/>
    </p>
    <hr/>
    <div><a href="javascript:searchMid()" class="btn btn-warning form-control m-3">개별 회원 조회</a></div>
    <div><a href="${pageContext.request.contextPath}/database/MemberList" class="btn btn-warning form-control m-3">회원 전체 조회</a></div>
    <hr/>
    <div class="row">
	    <div class="col"><a href="${pageContext.request.contextPath}/database/LogOut" class="btn btn-success form-control">로그아웃</a></div>
    </div>
  </div>
  <p><br/></p>
</body>
</html>