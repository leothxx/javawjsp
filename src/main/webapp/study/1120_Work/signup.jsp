<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>signup.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function signCheck() {
			let name = document.getElementById("name").value;
			let mid = document.getElementById("mid").value;
			let pwd = document.getElementById("pwd").value;
			let pwdCheck = document.getElementById("pwdCheck").value;
			
			const nameSik = /[a-zA-Z-가-힣]/gm;
			const midSik = /^[a-zA-Z0-9_]{4,12}$/gm;
			
			if(name.trim() == "") {
				alert("이름을 입력하세요.");
				return;
			}
			if(mid.trim() == "") {
				alert("아이디를 입력하세요.");
				return;
			}
			if(pwd.trim() == "") {
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(pwdCheck.trim() == "") {
				alert("비밀번호 확인란을 입력하세요.");
				return;
			}
			if(!nameSik.test(name)) {
				alert("성명은 영문이나 한글만 설정 가능합니다.");
				return;
			}
			if(!midSik.test(mid)) {
				alert("아이디는 영문과 숫자, _ 만 입력 가능하며 최소 4~12자 이내로 설정 가능합니다.");
				return;
			}
			if(pwd != pwdCheck || pwd.length > 20 || pwd.length < 4){
				alert("비밀번호 확인란에 있는 비밀번호가 일치하지 않거나, 비밀번호의 길이는 최대 20자이내여야 합니다.");
				return;				
			}
			document.getElementById("myform").submit();
		}
	</script>
	<style>
		* {
			width: 500px;
			margin: 0 auto;
			text-align: center;
		}
		th {
			font-size: 0.8em;
		}
		tr {
			height:50px;
		}
		.box {
			width: 350px;
		}
		.check {
			width: 140px;
			margin-left: -180px; 
		}
		.idbox {
			width: 200px;
		}
		#signup {
			width: 200px;
		}
		.back {
			width: 100px;
		}
	</style>  
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회 원 가 입</h2>
		<br/>
		<form name="myform" id="myform" method="post" action="${pageContext.request.contextPath}/work1120/IdCheck">
			<table class="tb">
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" id="name" autofocus required placeholder="이름을 입력하세요 [영문 및 한글]" class="form-control box"/></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td class="text-left"><input type="text" name="mid" id="mid" autofocus required placeholder="아이디를 입력하세요 [영문, _, 숫자]" class="form-control box"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pwd" required placeholder="비밀번호를 입력하세요. [4~20자이내]" class="form-control box"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
				  <td><input type="password" name="pwdCheck" id="pwdCheck" required placeholder="비밀번호를 다시 입력하세요. [4~20자이내]" class="form-control box"/></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value="돌아가기" onclick="location.href='login.jsp'" class="btn btn-info back"/>
					<input type="button" value="회 원 가 입" id="signup" onclick="signCheck()" class="btn btn-secondary form-control"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<p><br/></p>
</body>
</html>