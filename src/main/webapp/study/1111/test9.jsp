<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>값 전송하기(get방식)</h2>
		<!-- <form name="myform" method="get" action="../../naver/login"> -->
		<form name="myform" method="post" action="../../Test9Ok">
    	name : <input type="text" name="name" value="Seo ha neul" class="form-control"/>
    	age : <input type="number" name="age" value="24" class="form-control"/>
    	<input type="submit" value="전송" class="btn btn-success"/>
    </form>
  </div>
  <p><br/></p>
</body>\
</html>