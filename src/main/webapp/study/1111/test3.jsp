<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test3.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
  <p><br/></p>
  <div class="container">
		<%
			int i = 0; // 전부 java임.
			int tot = 0;
			
			while(i<10){
				i++;
				tot += i;
				out.println("1 ~ "+i+"까지의 합은 "+tot+" 입니다.<br/>"); //html화면에 출력. out메소드 이용.
			}
		
		%>
  </div>
  <p><br/></p>
</body>
</html>