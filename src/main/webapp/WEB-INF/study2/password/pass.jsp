<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pass.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
  	'use strict';
		let idx;
  	function fCheck(idx) {
  		let pwd = myform.pwd.value;
  		if(pwd.trim() == "") {
  			alert("비밀번호를 입력하세용");
  			myform.pwd.focus();
  		}
  		else {
  			if(idx == 1) {
  				myform.idx.value="1"; //폼에 idx값 넘겨서 포스트방식으로 넘기기
  				myform.action = "${ctp}/passOk1.st";
  			}
  			else if(idx == 2) {
  				myform.idx.value="2";
  				myform.action = "${ctp}/passOk1.st";
  			}
  			else {
  				myform.action = "${ctp}/passOk2.st";
  			}
  			myform.submit();
  		}
  	}
  </script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
  <p><br/></p>
  <div class="container">
    <h2>비밀번호 암호화 연습</h2>
    <p>(비밀번호를 10자 이내로 입력하세요.)</p>
    <br/>
    <form name="myform" method="post">
    	<table class="table table-bordered">
    		<tr>
    			<td>
    				<p>아이디 : <input type="text" name="mid" id="mid" value="leo1234" class="form-control"/></p>
    				<p>비밀번호 : <input type="password" name="pwd" id="pwd" maxlength="9" autofocus class="form-control"/></p>
    				<p><input type="button" value="확인(숫자비밀번호)" onclick="fCheck(1)" class="form-control btn btn-secondary"/></p>
    				<p><input type="button" value="확인(홍합비밀번호)" onclick="fCheck(2)" class="form-control btn btn-secondary"/></p>
    				<p><input type="button" value="확인(SHA256)" onclick="fCheck(3)" class="form-control btn btn-secondary"/></p>
    			</td>
    		</tr>
    	</table>
    	<input type="hidden" name="idx"/> <!-- 히든으로 idx를 넘김. 넘길 값은 위에서 지정하겠음. -->
    </form>
    <!-- <div id="demo"></div>
    <div id="demo2"></div> -->
    <p>비밀번호를 전송 후 콘솔창을 확인하세요.</p>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>