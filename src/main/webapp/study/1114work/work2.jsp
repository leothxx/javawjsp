<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
  	'use strict';
  	let addDiv;
  	let cnt = 0;
  	let data="";
  	$(function(){
	  	$('.productPlus').click(function(){
	  		cnt++;
	  		$('#divOutput').append('<div id="productInfo'+cnt+'"><div class="productInfo"><p>상품명</p> <input type="text" name="productName" id="product'+cnt+'Name"/> <p>가격</p> <input type="number" name="productPlace" id="product'+cnt+'Place"/> <p>수량</p> <input type="number" name="productSu" id="product'+cnt+'Su"/> <input type="button" name="delete'+cnt+'" id="delete'+cnt+'" value="삭제" onclick="textdelete('+cnt+')" class="btn btn-danger delete"/></div></div>');
	  	});
  	});
  	//삭제버튼
  	function textdelete(cnt) {
  		let productInfo = "productInfo"+cnt;
  		let dd = document.getElementById(productInfo);
  		dd.parentNode.removeChild(dd);
  	}
  </script>
  <style>
  	body {
  		width: 100%;
  		margin: 0px;
  		text-ailgn: center;
  	}
  	.category {
  		width: 180px;
  		height: 30px;
  	}
  	#name {
  		width: 180px;
  		height: 30px;
  	}
  	.container {
  		width: 100%;
  		display: flex;
  		flex-flow: row-nowrap;
  	}
  	.container > form {
  		width: 100%;
  		display: flex;
  		flex-flow: row wrap;
  	}
  	form div {
  		width: 100%;
  		display: flex;
  		flex-flow: row wrap;
  		align-items: center;
  		justify-content: center;
  	}
  	
  	h2 {
  		text-align: center;
  	}
  	.width1 {
  		width: 70px;
  	}
  	.width2 {
  		width: 180px;
  	}
  	.btn {
  		width: 250px;
  	}
  	.productInfo {
	  	display: flex;
	  	flex-flow: row nowrap;
	  	align-items: center;
  		justify-content: center;
  		width: 100%;
  		margin: 3px;
  	}
  	.productInfo input {
  		width: 70px;
  		margin: 0px 3px 0px;
  	}
  	p {
  		text-align: center;
  		margin-top: 2px;
  	}
  </style>
</head>
<body>
  <p><br/></p>
  <h2>과제 : 상품가격 계산하기</h2><br/>
  <div class="container">
    <form name="myform" method="post" action="<%=request.getContextPath() %>/j1114_Work2">
    	<div>
    		<div class="width1 mb-3">구매자</div>
    		<div class="width2 mb-3"><input type="text" name="name" id="name"/></div>
    	</div>
    	<div>
	    	<div class="width1 mb-3">상품분류</div>
	   		<div class="width2 mb-3">
	    		<select name="category" class="category">
		    		<option value="가전제품">가전제품</option>
		    		<option value="전자제품">전자제품</option>
		    		<option value="가구">가구</option>
		    		<option value="주방용품">주방용품</option>
	    		</select>
	   		</div>
   		</div>
   		<div>
   			<input type="button" value="상품 추가하기" id="productPlus" class="btn btn-success productPlus"/>
   		</div>
   		<div id="divOutput">
   		</div>
   		<div>
   			<input type="submit" value="상품 등록하기" id="products" class="btn btn-primary mt-3"/>
   		</div>
    </form>
  </div>
  <p><br/></p>
</body>
</html>