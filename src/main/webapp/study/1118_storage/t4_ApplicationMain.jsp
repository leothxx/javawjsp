<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t4_ApplicationMain.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
  	h2 {
  		margin: 0 auto;
  	}
  </style>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>어플리케이션(Application) 연습 메인 메뉴</h2>
    <hr/>
    <form name="myform" method="post" action="t4_ApplicationSave.jsp">
    	<table class="table">
    		<tr>
    			<th>아이디</th>
    			<td><input type="text" name="mid" id="mid" value="${sMid}" autofocus class="form-control"/></td>
    		</tr>
    		<tr>
    			<th>닉네임</th>
    			<td><input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control"/></td>
    		</tr>
    		<tr>
    			<th>나이</th>
    			<td><input type="text" name="age" id="age" value="${sAge}" class="form-control"/></td>
    		</tr>
    		<tr>
    			<th>성명</th>
    			<td><input type="text" name="name" id="name" value="${sName}" class="form-control"/></td>
    		</tr>
    	</table>
	    <div class="row mb-3">
	    	<div class="col"><input type="submit" value="어플리케이션저장(서버가동후 1회만 수행할 것)" class="btn btn-success form-control"/></div>
	    	<div class="col"><a href="t4_ApplicationCheck.jsp" class="btn btn-primary form-control">어플리케이션 확인</a></div>
	    </div>
	    <div class="row mb-3">     	
	    	<div class="col"><a href="t4_ApplicationDelNickName.jsp" class="btn btn-danger form-control">어플리케이션 닉네임 삭제</a></div>
	    </div>
	    <div class="row">     	
	    	<div class="col"><a href="t3_SessionGroup.jsp" class="btn btn-secondary form-control">세션 그룹 확인</a></div>
	    </div>
  	</form>
  </div>
  <p><br/></p>
</body>
</html>