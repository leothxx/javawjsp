<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>upLoad1.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
  	'use strict';
  	function fCheck() {
  		let fName = $("#file").val();
  		let ext = fName.substring(fName.lastIndexOf(".")+1); // 확장자 발췌
  		let uExt = ext.toUpperCase();
  		let maxSize = 1024 * 1024 * 10; // 업로드 가능한 최대파일의 용량은 10MByte로 한다.
  		
  		if(fName.trim() == "") {
  			alert("업로드할 파일을 선택하세요");
  			return;
  		}
  		let fileSize = document.getElementById("file").files[0].size; // 파일 사이즈를 가져오는 javascript 명령! (항상 여러개가 온다고 가정함. 첫번째로 들어오는 파일은 0번)
  		if(uExt != "JPG" && uExt != "PNG" && uExt != "GIF" && uExt != "ZIP" && uExt != "PPT" && uExt != "PPTX" && uExt != "HWP") {
  			alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT/PPTX' 입니다");
  		}
  		else if(fileSize > maxSize) {
  			alert("업로드할 파일의 최대용량은 10MByte 입니다.");			
  		}
  		else {
	  		//alert("파일 전송중...");
	  		myform.submit();
  		}
  	}
  </script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
  <p><br/></p>
  <div class="container">
    <h2>파일 업로드 테스트 1(싱글파일처리)</h2>
    <p>파일명 중복 방지를 위한 cos 라이브러리를 이용한 파일 업로드</p>
    <hr/>
    <form name="myform" method="post" action="${ctp}/upLoad1Ok.st" enctype="multipart/form-data">
    	<div>
	    	파일명 
	    	<input type="file" name="fName" id="file" class="form-control-file border mb-2"/>
	    	<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control"/>
    	</div>
    </form>
    <hr/><br/>
    
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>