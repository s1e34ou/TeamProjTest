<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/joinsuccess.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
	
</head>
<body>
	<div id="joinsuccess">
	<h1>회원가입완료</h1>
		<div id="joinsuccessin">
		<div id="joinsuccesstalk">
			<h2>
				<center>OO님<br>회원가입 되셨습니다.</center>
			</h2>
		</div>
			<div id="gomain">
				<a href="<%=request.getContextPath()%>/main"><input type="button" id="mainbut" value="main으로"/></a>
			</div>
		</div>
	</div>
</body>
</html>