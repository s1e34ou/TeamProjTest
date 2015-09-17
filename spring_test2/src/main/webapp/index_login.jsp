<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/index.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<section id="parent">
	<div id="box1">
		<img src="<%=request.getContextPath()%>/images/planets.jpg"
			id="seasonpic">
	</div>
	<div id="loginbox">
		<div id="box2">
			<div id="logintext">
				<input type="text" name="id" placeholder="아이디" /><br>
				<input type="text" name="pass" placeholder="비밀번호" />
			</div>
			<div id="loginbutton">
				<input type="button" id="login" value="로그인"/>
			</div>
		</div>
		<div id="box3">
			<a href="<%=request.getContextPath() %>/join"><input type="button" id="adduser" value="회원가입"/></a>
			
			
			<input type="button" id="idpwsearch" value="ID/PW찾기"/>
		</div>
	</section>
	</div>
	<div id="boardbox">
			<div id="box4"></div>
			<div id="box5"></div>
			<div id="box6"></div>
	</div>
	<div id="defaultbox">
		<div id="picboard">
			<div id="picture1">
			</div>
			<div id="picture2">
			</div>
			<div id="picture3">
			</div>
			<div id="picture4">
			</div>
			<div id="picture5">
			</div>
		</div>
		<div id="bannerbox">
			<div id="banner1">
			</div>
			<div id="banner2">
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
	
</body>
</html>

