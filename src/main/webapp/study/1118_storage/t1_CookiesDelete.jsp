<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies(); //쿠키 가져오기.
	
	//아래는 다 지우는 것임. + 삭제는 쿠키에 저장된 값이 있을때만 실행하라고 유효성 검사를 무조건 주는게 좋다. 그렇지 않으면 쿠키에 저장된 값이 null이면 에러가 발생함.
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			cookies[i].setMaxAge(0); //쿠키 생명주기 시간을 없앤다. 즉, 쿠키가 생명주기 시작을 줌과 동시에 그 생명주기 시간만큼 생존하는데, 0을 줌으로써 바로 쿠키를 제거함.
			response.addCookie(cookies[i]); //쿠키 만료시간이 0인 쿠키를 다시 클라이언트에게 주입하면 만료시간이 0이라는 것을 컴퓨터가 알고 알아서 제거함.
		}		
	}
%>
<script>
	alert("쿠키 삭제 완료!!");
	location.href="t1_CookiesMain.jsp"; //메인으로 보내기.
</script>