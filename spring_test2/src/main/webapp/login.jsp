<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div id="loginbox">
	<h1>로그인</h1>
		<div id="loginboxin">
		<div id="logintalk">
			<h3>
				<center>ID와 Password가 틀렸습니다.<br> 다시 확인해주세요.</center>
			</h3>
		</div>
			<div id="inlogin">
			<div id="logintext">
				<input type="text" name="id" placeholder="아이디" />
				<input type="text" name="pass" placeholder="비밀번호" />
			</div>
			<div id="loginbutton">
				<input type="button" id="login" value="로그인"/>
			</div>
			</div>
			<div id="defaultlogin">
				<input type="button" id="adduser" value="회원가입"/>
				<input type="button" id="idpwsearch" value="ID/PW찾기"/>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>