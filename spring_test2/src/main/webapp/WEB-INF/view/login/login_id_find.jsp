<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="dto.Users" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/login_id_find.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
	
</head>
<body>
<% 
	Object loginUserObj = session.getAttribute("selectUser");
	if(loginUserObj ==null) {
		String loginUser = ((Users) loginUserObj).getUsersId();
%>

	<div id="idpwsearch2">
	<h1>ID/PW찾기</h1>
		<div id="idpwsearch2in">
		<div id="idpwsearch2talk">
			<h2>
				<center>회원님의<br>ID(PW)는 <%=loginUser %> 입니다.</center>
			</h2>
		</div>
			<div id="gomain">
				<input type="button" id="mainbut" value="main으로"/>
			</div>
		</div>
	</div>
	<%
	} else{
		String loginUser = ((Users) loginUserObj).getUsersId();
	%>
	<div id="idpwsearch2">
	<h1>ID/PW찾기</h1>
		<div id="idpwsearch2in">
		<div id="idpwsearch2talk">
			<h2>
				<center>회원님의<br>ID(PW)는 <%=loginUser %> 입니다.</center>
			</h2>
		</div>
			<div id="gomain">
				<input type="button" id="mainbut" value="main으로"/>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>