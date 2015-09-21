<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/login.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<div id="loginbox">
	<h1>로그인</h1>
		<c:url value=login var="login"></c:url>
		<sform:form method="post" action="${login }" class="form-horizontal" modelAttribute="users">
		<div id="loginboxin">
		<div id="logintalk">
			<h3>
				<center>ID와 Password가 틀렸습니다.<br> 다시 확인해주세요.</center>
			</h3>
		</div>
			<div id="inlogin">
			<div id="logintext">
     			<sform:input path="usersId" class="form-control" placeholder="ID"/>
    			<sform:input path="usersPassword" class="form-control" type="password" placeholder="Password" />
			</div>
			<div id="loginbutton">
				<sform:button class="btn btn-default">로그인</sform:button>
			</div>
			</div>
			<div id="defaultlogin">
				<a href="<%=request.getContextPath() %>/join"><input type="button" id="adduser" value="회원가입"/></a>
				<a href="<%=request.getContextPath() %>/login_findinput"><input type="button" id="idpwsearch" value="ID/PW찾기"/></a>
			</div>
		</div>
		</sform:form>
	</div>
</body>
</html>