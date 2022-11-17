<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>menu.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
  <div class="container text-center">
  	<nav class="n">
	    <div class="a"><a href="${pageContext.request.contextPath}/j1115_Work?sw=main&productName=${vo.productName}&productPrice=${vo.productPrice}&productSu=${vo.productSu}&priceTot=${vo.priceTot}&productTot=${vo.productTot}&buyerName=${vo.buyerName}&category=${vo.category}">홈으로</a></div>
	    <div class="a"><a href="${pageContext.request.contextPath}/j1115_Work?sw=input&productName=${vo.productName}&productPrice=${vo.productPrice}&productSu=${vo.productSu}&priceTot=${vo.priceTot}&productTot=${vo.productTot}&buyerName=${vo.buyerName}&category=${vo.category}">판매상품등록</a></div>
	    <div class="a"><a href="${pageContext.request.contextPath}/j1115_Work?sw=list&productName=${vo.productName}&productPrice=${vo.productPrice}&productSu=${vo.productSu}&priceTot=${vo.priceTot}&productTot=${vo.productTot}&buyerName=${vo.buyerName}&category=${vo.category}">상품조회</a></div>
  	</nav>
  </div>
</body>
</html>