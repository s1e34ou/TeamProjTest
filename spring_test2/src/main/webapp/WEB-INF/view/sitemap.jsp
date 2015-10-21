<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/sitemap.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

	<div id="sitemapbox">
	<h1>SiteMap</h1>
		<div id="sitemapin">
			<div id="box1" class="list-group">
				<a href="#" class="list-group-item active"> 축제 </a> 
				<a href="<%=request.getContextPath()%>/festival_regionboard" class="list-group-item"> 지역별 </a> 
				<a href="<%=request.getContextPath()%>/festival_seasonboard" class="list-group-item"> 월별 </a> 
			</div>
			<div id="box2" class="list-group">
				<a href="#" class="list-group-item active"> 이벤트 </a> 
				<a href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*" class="list-group-item"> 이벤트(할인) </a> 
			</div>
			<div id="box3" class="list-group">
				<a href="#" class="list-group-item active"> 커뮤니티 </a> 
				<a href="<%=request.getContextPath()%>/freeboard?page=1" class="list-group-item"> 자유게시판 </a> 
				<a href="<%=request.getContextPath()%>/albumboard?page=1" class="list-group-item"> 축제후기게시판 </a> 
			</div>
			<div id="box4" class="list-group">
				<a href="#" class="list-group-item active"> 랭킹 </a> 
				<a href="<%=request.getContextPath()%>/rankboard?page=1&select=EVENT.*" class="list-group-item"> 랭킹게시판(추천/조회) </a> 
			</div>
			<div id="box5" class="list-group">
				<a href="#" class="list-group-item active"> 고객마당 </a> 
				<a href="<%=request.getContextPath()%>/introduction" class="list-group-item"> 소개 </a> 
				<a href="<%=request.getContextPath()%>/notice?page=1" class="list-group-item"> 공지사항 </a> 
				<a href="<%=request.getContextPath()%>/qnaboard?page=1" class="list-group-item"> Q&A게시판 </a> 
			</div>
		</div>
	</div>
</body>
</html>