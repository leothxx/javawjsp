<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>login.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
		* {
  		margin: 0 auto;
		}
		.container {
			width: 500px;
		}  	
  </style>
</head>
<body>
  <p><br/></p>
  <div class="container bg-secondary">
    <form name="myform" method="post" action="${pageContext.request.contextPath}/database/LoginOk">
    	<table>
    		<tr>
    			<td colspan="2" class="text-center bg-secondary text-white"><font size="5">로 그 인</font></td>
    		</tr>
    		<tr>
    			<th class="text-center bg-secondary text-white">아이디</th>
    			<td><input type="text" name="mid" id="mid" autofocus required class="form-control bg-secondary text-white"/></td>
    		</tr>
    		<tr>
    			<th class="text-center bg-secondary text-white">비밀번호</th>
    			<td><input type="password" name="pwd" id="pwd" required class="form-control bg-secondary text-white"/></td>
    		</tr>
    		<tr>
    			<td colspan="2" class="text-center bg-secondary">
    				<input type="submit" value="로그인" class="btn btn-primary"/>
    				<input type="reset" value="다시입력" class="btn btn-warning"/>
    				<input type="button" value="회원가입" onclick="location.href='join.jsp';" class="btn btn-info"/>
    			</td>
    		</tr>
    	</table>
    </form>
  </div>
  <p><br/></p>
</body>
</html>