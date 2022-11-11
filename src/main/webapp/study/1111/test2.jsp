<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  지시자(directive)  -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
  <p><br/></p>
  <div class="container">
  	<!-- HTML 주석 -->
  	<%-- JSP 주석입니다. --%>
    <h2>이곳은 1111폴더의 test2.jsp 입니닷</h2>
    <% //스크립틀릿(자바 코드를 사용하는 곳)
      // 자바 한줄 주석 입니다.
      /*
      	자바 여러줄 주석 입니다.
      */
      System.out.println("이곳은 jsp파일 입니다.");
    
  		// 500번 에러는 컴파일에러임. 즉 소스가 잘못됐을때 나온다.
    	out.println("<font color='red'>이곳은 <b>jsp</b>의 out메소드입니당.</font>");
    %>
    <hr/>
    <%="안녕하세용가리 이고슨 <b>표현식</b> 내부입니다람쥐 ~ <br/>" %> <%-- 내용을 표시할때는 <%=을 사용하면됨. (표현식) 웹임. --%>
  </div>
  <p><br/></p>
</body>
</html>