<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid="";
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("cMid")){
			mid = cookies[i].getValue();
			pageContext.setAttribute("gMid", mid);
			break;			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>login.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	$(function(){
  		$('.login').click(function(){
  			let mid = myform.mid.value;
  			let pwd = myform.pwd.value;
  			const midCheck = /[a-zA-Z0-9]/gm;
  			if(!midCheck.test(mid)){
  				alert("아이디는 영어와 숫자만 입력 가능합니다.");
  				return;
  			}
  			else {
  				myform.submit();
  			}
  		});
  	});
  </script>
  <style>
  	.container {
  		width: 400px;
  		height: 200px;
  		margin: 0 auto;
  	}
  	h2 {
  		color: #aaa;
  		text-align: center;
  	}
  	table {
  		width: 100%;
  	}
  	.btn {
  		height: 100px;
  	}
  	th {
  		color: #555;
  	}
  	.save {
  		accent-color: #bbb;
  	}
  	.text2 {
  		color: #888;
  	}
  	.api:hover {
  		cursor: pointer;
  	}
  	.signup {
  		height: 40px;
  		border: 1px solid gray;
  		text-align: center;
  	}
  	.signup:hover {
  		cursor: pointer;
  		color: black;
  		text-decoration: none;
  	}
  </style>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <form name="myform" method="post" action="${pageContext.request.contextPath}/work1120/LoginOk">
    	<table>
    		<h2>로 그 인</h2>
    		<tr>
    			<th>아이디</th>
    			<td><input type="text" name="mid" id="mid" value="${gMid}" autofocus placeholder="아이디를 입력하세요." class="form-control"/></td>
    			<td rowspan="3"><input type="button" value="로그인" class="btn btn-secondary ml-2 login"/>
    		</tr>
    		<tr>
    			<td colspan="2" class="text-right text2">아이디저장 <input type="checkbox" name="save" id="save" value="true" checked class="save"/></td></tr>
    		<tr>
    			<th>비밀번호</th>
    			<td class="mb-3"><input type="password" name="pwd" id="pwd" placeholder="패스워드를 입력하세요." class="form-control"/></td>
    		</tr>
    		<tr>
    			<td colspan="3"><a href="signup.jsp" class="form-control signup mt-2"><b>회 원 가 입</b></a></td>
    		</tr>
    		<tr>
    			<td colspan="3"><img src="../../images/loginapi.jpg" class="api"/></td>
    		</tr>
    	</table>
    </form>
  </div>
  <p><br/></p>
</body>
</html>