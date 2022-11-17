<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	if(mid.equals("")) {
		mid = mid2;
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_LoginMember.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
  	img {
  		width: 300px;
  		height: 200px;
  	}
  </style>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>회원 전용방</h2>
    <p><font color="blue">${mid}</font>님 로그인 중이십니다.</p>
    <hr/>
    <p>
	    <img src="${pageContext.request.contextPath}/images/gif/19.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/20.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/21.gif"/>
    </p>
    <br/>
    <p>
	    <img src="${pageContext.request.contextPath}/images/gif/17.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/15.gif"/>
	    <img src="${pageContext.request.contextPath}/images/gif/18.gif"/>
    </p>
    <hr/>
    <div class="row">
	    <div class="col"><a href="${pageContext.request.contextPath}/study/1118_storage/t2_LogOut.jsp?mid2='<%=mid2 %>'" class="btn btn-success form-control">로그아웃</a></div>
	    <div class="col"><a href="${pageContext.request.contextPath}/study/1118_storage/t2_LoginDelete.jsp" class="btn btn-success form-control">쿠키 아이디 삭제</a></div>
    </div>
  </div>
  <p><br/></p>
</body>
</html>