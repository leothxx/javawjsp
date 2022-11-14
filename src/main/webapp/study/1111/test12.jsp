<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
		'use strict';
		
		function fCheck() {
			let name = myform.name.value;
			
			if(name == "") {
				alert("이름을 입력하세요");
				myform.name.focus();
			}
			else {
				myform.submit();
			}
		}
  </script>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>값 전송하기(get방식)</h2>
		<!-- <form name="myform" method="get" action="../../naver/login"> -->
		<!-- <form name="myform" method="post" action="../../t12"> -->
<!-- 		<form name="myform" method="post" action="/javawjsp/t12"> -->
		<!-- <form name="myform" method="post" action="test12ok.jsp"> -->
		<form name="myform" method="post" action="<%=request.getContextPath()%>/test12ok">
		<%-- <form name="myform" method="post" action="/<%=request.getContextPath()%>/t12"> <!-- 서버에 있는 context 이름을 이용하겠다. --> --%>
    	성명 : <input type="text" name="name" value="Seo ha neul" class="form-control"/>
    	나이 : <input type="number" name="age" value="24" class="form-control"/>
    	<div>
    	성별 : <input type="radio" name="gender" value="남자" checked/>남자
    			  <input type="radio" name="gender" value="여자"/>여자
    	</div>
    	<div>
    		취미 : 
    		     <input type="checkbox" name="hobby" value="축구"/>축구
    		     <input type="checkbox" name="hobby" value="여행"/>여행
    		     <input type="checkbox" name="hobby" value="패션"/>패션
    		     <input type="checkbox" name="hobby" value="싸이클"/>싸이클
    		     <input type="checkbox" name="hobby" value="사진"/>사진
    	</div>
    	<input type="button" onclick="fCheck()" value="전송" class="btn btn-success"/>
    </form>
    <hr/>
    <p>
    	<img src="../../images/첼시.jpg" width="200px"/>
    </p>
  </div>
  <p><br/></p>
</body>
</html>