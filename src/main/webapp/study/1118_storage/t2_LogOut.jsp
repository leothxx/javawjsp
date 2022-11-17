<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LogOut.jsp -->
<%
	String mid2 = request.getParameter("mid2")==null ? "" : request.getParameter("mid2");
	Cookie[] cookies = request.getCookies();
	String mid = "";
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cMid")) { //cMid에 들어있는 
				mid = cookies[i].getValue(); //값(아이디)을 가져옴.
				pageContext.setAttribute("mid", mid); //el은 저장소에 저장해야지만 사용이 가능하기에, 저장소에 저장함.
				break; //찾았으면 반복문 탈출.
			}
		}		
	}
%>
<%
%>
<script>
	alert("<%=mid2 %>님 로그아웃 되었습니다.!!");
	location.href="t2_Login.jsp"; //메인으로 보내기.
</script>