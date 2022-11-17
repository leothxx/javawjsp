<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t5_LogOut.jsp -->
<%
	String mid = (String) session.getAttribute("sMid"); //끊기전에 아이디를 메세지 띄워야하기에 mid변수에 값을 넣음.
	session.invalidate(); //로그아웃시엔 해달 세션을 전부 다 끊어줘야함. 메모리가 누적되면 서버에 부하가 올 수 있기에
%>
<script>
	alert("<%=mid %>님 로그아웃이 완료되었습니다.!!");
	location.href="t5_Login.jsp"; //메인으로 보내기.
</script>