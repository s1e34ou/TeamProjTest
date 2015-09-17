<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#loginbox {
	width: 1000px;
	height: 500px;
	margin: auto;
	padding: 15px;
}
#loginboxin{
	border: solid 1px black;
}
#logintalk{
	margin: auto;
	margin-top:50px;
	padding: 15px;
}
#inlogin{
	width: 300px;
	height: 100px;
	margin: auto;
	display: -webkit-box;
}
#logintext{
	width:180px;
	height:100px;
}
#loginbutton{
	margin-left:10px;
	width:100px;
	height:100px;
}
#logintext input{
	margin-left:25px;
	width:150px;
	height:35px;
}
#loginbutton input{
	width:70px;
	height:80px;
}
#defaultlogin{
	width: 300px;
	height: 120px;
	margin: auto;
	display: -webkit-box;
}
#adduser{
	margin-left:25px;
	width: 115px;
}
#idpwsearch{
	width: 115px;
}
</style>
<link href="<%=request.getContextPath()%>/style/main.css"
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