<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>상품조회</title>
  <%@ include file="../../include/bs4.jsp" %>
  <style>
  	table {
  		margin: 0 auto;
  	}
  </style>
</head>
<body>
 <div class="container text-center">
 		<table>
 			<tr>
 				<td>구매자 ${vo.buyerName}님의 상품조회 리스트 입니다.</td>
 			</tr>
 			<tr>
 				<td>카테고리는 ${vo.category} 입니다.</td>
 			</tr>
 			<tr>
 				<td>구매상품 ${vo.productName}을 구매하셨으며,</td>
 			</tr>
 			<tr>
 				<td>수량은 ${vo.productSu}개 구매하셨고,</td>
 			</tr>
 			<tr>
 				<td>가격은 ${vo.productPrice}로, 총 구매가격은 ${vo.productTot} 입니다.</td>
 			</tr>
 			<tr>
 				<td>모든 제품을 통틀어 최종 가격은 ${vo.priceTot}입니다.</td>
 			</tr>
 		</table>   
 </div>
</body>
</html>