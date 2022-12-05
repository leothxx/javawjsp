<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>upLoad3.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
  	'use strict';
  	let cnt = 1;
  	function fileBoxAppend() {
  		cnt++;
  		let fileBox = "";
  		fileBox += '<div id="fBox'+cnt+'">';
  		fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control-file border mb-2" style="float:left; width:88%;"/>';
  		fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger btn-sm form-control mb-2" style="float:right; width:10%;"/>';
  		fileBox += '</div>';
  		$("#fileBoxAppend").append(fileBox);
  	}
  	
  	function deleteBox(cnt) {
  		$("#fBox"+cnt).remove();
  	}
  	
  	function fCheck() {
  		let fName1 = $("#file1").val();
  		
  		let ext = fName1.substring(fName1.lastIndexOf(".")+1); // 확장자 발췌
  		let uExt1 = ext.toUpperCase();
  		
  		let maxSize = 1024 * 1024 * 10; // 업로드 가능한 최대파일의 용량은 10MByte로 한다.
  		
  		if(fName1.trim() == "") {
  			alert("업로드할 파일을 선택하세요");
  			return;
  		}
  		let fileSize1 = document.getElementById("file1").files[0].size; // 파일 사이즈를 가져오는 javascript 명령! (항상 여러개가 온다고 가정함. 첫번째로 들어오는 파일은 0번)
  		if(uExt1 != "JPG" && uExt1 != "PNG" && uExt1 != "GIF" && uExt1 != "ZIP" && uExt1 != "PPT" && uExt1 != "PPTX" && uExt1 != "HWP") {
  			alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT/PPTX' 입니다");
  		}
  		else if(fileSize1 > maxSize) {
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
    <h2>파일 업로드 테스트 3(멀티파일처리)</h2>
    <p>파일명 중복 방지를 위한 cos 라이브러리를 이용한 파일 업로드</p>
    <hr/>
    <form name="myform" method="post" action="${ctp}/upLoad2Ok.st" enctype="multipart/form-data">
    	<div>
    		<input type="button" value="파일추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2"/>
	    	<input type="file" name="fName1" id="file1" class="form-control-file border mb-2"/>
    	</div>
    	<div id="fileBoxAppend"></div>
    	<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control"/>
    	<input type="hidden" name="upLoadFlag" value="3"/>
    </form>
    <hr/><br/>
    
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>