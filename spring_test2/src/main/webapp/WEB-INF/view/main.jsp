<%@page import="dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/index.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<section id="parent">
	<div id="box1">
		<img src="<%=request.getContextPath()%>/images/planets.jpg"
			id="seasonpic">
	</div>
	<div id="loginbox">
		<%
			Object loginUserObj = session.getAttribute("loginUser");
			if (loginUserObj == null) {
		%>
		
			<c:url value="/login" var="login"></c:url>
			<form action="${login }" method="POST">
			<div id="box2">
				<div id="logintext">
					<input type="text" name="usersId" />
					<input type="password" name="usersPassword" />
				</div>
				<div id="loginbutton">
					<input type="submit" value="로그인" />
				</div>
				</div>
			</form>
		
		<div id="box3">
			<a href="<%=request.getContextPath()%>/join"><input type="button"
				id="adduser" value="회원가입" /></a> 
			<a href="<%=request.getContextPath()%>/login_findinput"><input type="button" id="idpwsearch"
				value="ID/PW찾기" /></a>	
		</div>
		<%
			} else {
				String loginUser = ((Users) loginUserObj).getUsersName();
		%>
		<%=loginUser%>님 반갑습니다.
		<a href="<%=request.getContextPath()%>/infochange"><input type="button"
				id="changeuser" value="정보수정" /></a> <a href="<%=request.getContextPath() %>/logout"><input type="button" id="logout"
				value="로그아웃" /></a>
		<%
			}
		%>
	</div>
	</section>
	<div id="boardbox">
		<div id="box4"></div>
		<div id="box5"></div>
		<div id="box6"></div>
	</div>
	<div id="defaultbox">
		<div id="picboard">
			<div id="picture1"></div>
			<div id="picture2"></div>
			<div id="picture3"></div>
			<div id="picture4"></div>
			<div id="picture5"></div>
		</div>
		<div id="bannerbox">
			<div id="banner1"></div>
			<div id="banner2"></div>
		</div>
	</div>
	<hr>

</body>
</html>