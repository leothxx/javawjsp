<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>scMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
  	'use strict';
  	$(document).ready(function(){
  		$("#scheduleInputHidden").hide();
  	});
  	// 일정 등록폼을 가상에 출력하기
  	function scheduleInputView() {
  		let scheduleInput = '<hr/><div id="scheduleInputForm">';
  		scheduleInput += '<form name="myform">';
  		scheduleInput += '<table class="table bordered">';
  		scheduleInput += '<tr><th>일정분류</th><td>';
  		scheduleInput += '<select name="part" class="form-control">';
  		scheduleInput += '<option value="모임">모임</option>';
  		scheduleInput += '<option value="업무">업무</option>';
  		scheduleInput += '<option value="학습">학습</option>';
  		scheduleInput += '<option value="여행">여행</option>';
  		scheduleInput += '<option value="기타">기타</option>';
  		scheduleInput += '</select>';
  		scheduleInput += '</td></tr>';
  		scheduleInput += '<tr><th>내용</th><td>';
  		scheduleInput += '<textarea name="content" rows="4" class="form-control"></textarea>';
  		scheduleInput += '</td></tr>';
  		scheduleInput += '<tr><td colspan="2" class="text-center">';
  		scheduleInput += '<input type="button" value="일정등록" onclick="scheduleInputOk()" class="btn btn-light form-control"/>';
  		scheduleInput += '</td></tr>';
  		scheduleInput += '</table>';
  		scheduleInput += '</form></div>';
  		
  		$("#scheduleInputView").hide();
  		$("#scheduleInputHidden").show();
  		$("#demo").html(scheduleInput);
  	}
  	
  	// 일정 등록창 닫기
  	function scheduleInputHidden() {
  		$("#scheduleInputView").show();
  		$("#scheduleInputHidden").hide();
  		$("#scheduleInputForm").slideUp(500);
  	}
  	
  	// 일정 등록하기
  	function scheduleInputOk() {
  		let part = myform.part.value;
  		let content = myform.content.value;
  		if(content == "") {
  			alert("내용을 입력하세요!");
  			myform.content.focus();
  			return false;
  		}
  		let query = {
  				mid : '${sMid}',
  				ymd : '${ymd}',
  				part : part,
  				content : content
  		}
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/scheduleInputOk.sc",
  			data : query,
  			success : function(res) {
  				if(res == 1) {
  					alert("일정 등록이 완료되었습니다.");
  					location.reload();
  				}
  				else {
  					alert("일정 등록 실패!");
  				}
  			},
  			error : function() {
  				alert("전송오류 !");
  			}
  		});
  	}
  </script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
  <p><br/></p>
  <div class="container">
  	<h4>${ymd} 일정입니다.</h4>
  	<p>오늘의 일정은 총 ${scheduleCnt}건 있습니다.</p>
  	<hr/>
  	<div>
  		<input type="button" value="일정등록" onclick="scheduleInputView()" id="scheduleInputView" class="btn btn-primary"/>
  		<input type="button" value="등록창닫기" onclick="scheduleInputHidden()" id="scheduleInputHidden" class="btn btn-danger"/>
  		<input type="button" value="돌아가기" onclick="location.href='${ctp}/schedule.sc?yy=${fn:split(ymd,'-')[0]}&mm=${fn:split(ymd, '-')[1]-1}';" id="scheduleInputView" class="btn btn-info"/>
  	</div>
  	<div id="demo"></div>
  	1
    동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
    무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.<br/>
    
    2
    남산 위에 저 소나무 철갑을 두른 듯 바람서리 불변함은 우리 기상일세
    무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.<br/>
    
    3
    가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심 일세
    무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.<br/>
    
    4
    이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세
    무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세.<br/>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>