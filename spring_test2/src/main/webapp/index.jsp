<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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

aside{
	margin: auto;
	margin-left:20px;
	border:solid 1px red;
	display: -webkit-box;
}
#logintext input{
-webkit-box-flex:1; 
	border:solid 1px blue;
	width: 150px;
	height: 35px;
}
#loginbutton button{
-webkit-box-flex:1; 
	border:solid 1px blue;
	width: 70px;
	height: 70px;
}


</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/css/basic.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<header>
	<button type="button" id="sitemap">사이트맵</button>
	<br>
	<br>
	<div class="row">
		<img src="<%=request.getContextPath()%>/images/fastival.jpg" id="fastivallogo">

		<div class="col-lg-6" id="search">
			<div class="input-group">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">Go!</button>
				</span> <input type="text" class="form-control" placeholder="Search for...">
			</div>
			<!-- /input-group -->
		</div>
	</div>
	<!-- /.col-lg-6 -->
	<div class="btn-group btn-group-justified" role="group"
		aria-label="...">
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default">축제</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default">이벤트</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default">커뮤니티</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default">랭킹</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default">고객마당</button>
		</div>
	</div>
	</header>
	
	<section id="parent">
		<div id="box1">
		<img src="<%=request.getContextPath()%>/images/planets.jpg" id="seasonpic">
		</div>
		<div id="box2">
		<aside>
			<div id="logintext">
			<input type="text" name="id" placeholder="아이디" />
			<input type="text" name="pass" placeholder="비밀번호" />
			</div>
			<div id="loginbutton">
			<button type="button" id="login">로그인</button>
			</div>
			<button type="button" id="useradd">회원가입</button>
			<button type="button" id="idpwsearch">ID/PW찾기</button>
			</div>
		</aside>
		</div>
	</section>
	<hr>
	<footer>
	<div class="copy_link">
		<div>
			<span class="skip" id="fastivalinfo"> 충남 아산시 배방읍 호서로 79번길 20
				호서대학교 제2공학관 510호 (우)336-795 tel : 010-oooo-oooo<br>
				copyright(c) 2015 fastival 주식회사. all rights reserved
			</span>
		</div>

		<div class="select_link" id="sitegogo">
			<select name="jumpMenu" id="jumpMenu">
				<option>관련 사이트</option>
				<option value="http://www.naver.com/">네이버</option>
				<option value="http://intranet.hsu.ac.kr/">학사시스템</option>
			</select> <input type="button" name="go_button" id="go_button"
				title="새 창으로 이동" class="site_go" value="바로가기" />
		</div>
	</div>

	</footer>
</body>
</html>