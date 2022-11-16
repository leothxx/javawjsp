<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>회원정보</h2>
<%--     <form name="myform" method="post" action="${pageContext.request.contextPath}/j1117/Test1Ok"> --%>
    <form name="myform" method="post" action="testF2Ok.jsp">
    	<p>
    		성명 : <input type="text" name="name" value="서하늘" autofocus class="form-control"/>
    	</p>
    	<p>
    		성별 : <input type="radio" name="gender" value="남자" checked/>남자
    				  <input type="radio" name="gender" value="여자"/>여자
    	</p>
    	<p>
    		나이 : <input type="number" name="age" value="24"/>
    	</p>
    	<p>
    		직업 : <input type="text" name="job" value="백엔드 개발자" class="form-control"/>
    	</p>
    	<p>
    		주소 : <input type="text" name="address" value="Mans Toilet 3F, 1600 Amphitheatre Parkway
Mountain View, CA 94043
USA" class="form-control"/>
    	</p>
    	<p>
    		<input type="submit" value="전송" class="btn btn-warning"/>
    	</p>
    </form>
  </div>
  <p><br/></p>
</body>
</html>