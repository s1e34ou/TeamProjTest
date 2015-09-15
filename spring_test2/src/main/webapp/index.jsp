<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/style/main.css"
	rel="stylesheet" type="text/css">
<style type="text/css">

header {
	margin: auto;
	width: 1200px;
	padding: 10px;
}
section {
	margin: auto;
	width: 1200px;
}
footer {
	margin: auto;
	width: 1200px;
}

div {
	flex: none;
}

#fastivallogo {
	float: left;
}

#search {
	padding: 20px;
	float: right;
	width: 500px;
}

#sitemap {
	float: right;
}

#fastivalinfo {
	float: left;
}

#sitegogo {
	padding: 20px;
	float: right;
}

#jumpMenu {
	width: 200px;
}

#seasonpic{
	-webkit-box-flex:3;
	height: 150px;
	width: 900px;
}

#parent{
	margin: auto;
	width: 1200px;
	display: -webkit-box;
}
#parent div:nth-of-type(1){
	-webkit-box-flex:1; 
	margin-top:15px;
}
#parent div:nth-of-type(2){
	-webkit-box-flex:5;
	margin-top:15px;
	margin-left:15px;
	margin-right:15px;
}
#box2 div{
	margin-left:20px;
}
#box2 div{
	border:solid 1px blue; 
}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<section id="parent">
		<div id="box1">
		<img src="<%=request.getContextPath()%>/images/planets.jpg" id="seasonpic">
		</div>
		<div id="box2">
		<aside>
			<div>
			<input type="text" name="id" placeholder="아이디" />
			<input type="text" name="pass" placeholder="비밀번호" />
			<button type="button" id="login">로그인</button>
			</div>
		</aside>
		</div>
	</section>
	<hr>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>

