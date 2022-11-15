<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null ? "": request.getParameter("sw");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="../../include/bs4.jsp" %>
  <style>
  	body {
  		width: 100%;
  		margin: 0px auto;
  		padding: 0px;
  		text-align: center;
  	}
  	#header {
  		background-color: skyblue;
  		text-align: center;
  		height: 80px;
  	}
  	#footer {
  		background-color: #ccc;
  		text-align: center;
  		height: 75px;
  	}
  	#content {
  		background-color: #fff;
  		text-align: center;
  	}
  	.a {
  		width: 300px;
  		height: 20px;
  		font-size: 1.5em;
  	}
  	.a a {
  		color: white;
  	}
  	.a a:hover {
  		color: #000;
  		text-decoration: none;
  	}
  	.n {
  		display: flex;
  		flex-flow: row nowrap;
  		align-items: center;
  		justify-content: center;
  	}
  	.container {
  		width:100%;
  		margin: 0px auto;
  		padding: 0px;
  	}
  </style>
</head>
<body>
  <div class="container text-center">
    <div id="header">
    	</br>
    	<%@ include file="menu.jsp" %>
    </div>
    <div id="content">
    <br/>
	    <%if(sw.equals("input")) {%>
	    	<%@ include file="input.jsp" %>
	    <%}else if(sw.equals("list")) {%>
	    	<%@ include file="list.jsp" %>
	    <%} else {%>
	    <h2>상품 판매 관리 메인 화면 입니다.</h2>
	    <hr/>
	    <p><img src="../../images/gif/19.gif" width="400px"/></p>
	    <%} %>
	    <br/>
    </div>
    <!-- 푸터영역(Capyright나 주소, 소속, 작성자 등을 기술한다.) -->
    <div id="footer">
      <%@ include file="footer.jsp" %>
    </div>
  </div>
</body>
</html>