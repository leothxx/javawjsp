<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesSave.jsp -->
<%
	String mid = "leothx_x"; //원래는 앞에서 리케스트 겟 파라메타로 아이디를 받고, 밑에 쿠키에 저장.
	Cookie cookieMid = new Cookie("cMid",mid); //쿠키 생성. 쿠키는 기본생성자에 이름과 값을 주고 생성해야함. 매개변수가 있다. 앞은 쿠키의 변수명, 뒤에는 값이 들어있는 변수.
	//우리끼리의 약속 :  cMid는 쿠키에 있는 아이디, sMid는 세션에 있는 아이디 이런식으로 변수를 쓰자!!
	//쿠키는 만들어도 흔적만 . 만 생성되기에 바로 사용할 수가 없다. 그러기에 생명주기가 얼마다! 라고 지정해주는 명령을 사용해야함! 아래 참고
	cookieMid.setMaxAge(60*60*24); //cookieMid의 생명주기임. 쿠키의 만료 시간. 만료시간의 단위는 '초' java는 천분의 1초지만 여기선 그냥 1초임. ex) 1일(60*60*24)

	String pwd = "1234";
	Cookie cookiePwd = new Cookie("cPwd",pwd);
	cookiePwd.setMaxAge(60*60*24);
	
	String job = "프로그래머";
	Cookie cookieJob = new Cookie("cJob",job);
	cookiePwd.setMaxAge(60*60*24);
	

	// 쿠키를 클라이언트에 저장하기(즉, 사용자 컴퓨터에 저장된다.)
	response.addCookie(cookieMid); //첫번째 mid쿠키 저장 완료!
	response.addCookie(cookiePwd);
	response.addCookie(cookieJob);
%>
<script>
	alert("쿠키 저장 완료!!");
	location.href="t1_CookiesMain.jsp"; //메인으로 보내기.
</script>