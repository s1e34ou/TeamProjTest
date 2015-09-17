<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/main.css"
			rel="stylesheet" type="text/css">
<style>
#sitemapbox {
	width: 1000px;
	height: 350px;
	margin: auto;
}
#sitemapin{
	width: 1000px;
	height: 250px;
	margin: auto;
	display: -webkit-box;
}
#sitemapin div:nth-of-type(1){
	border: solid 1px black;
	width: 180px;
	height: 200px;
	margin-right:20px;
}
#sitemapin div:nth-of-type(2){
	border: solid 1px black;
	width: 180px;
	height: 200px;
	margin-right:20px;
}
#sitemapin div:nth-of-type(3){
	border: solid 1px black;
	width: 180px;
	height: 200px;
	margin-right:20px;
}
#sitemapin div:nth-of-type(4){
	border: solid 1px black;
	width: 180px;
	height: 200px;
	margin-right:20px;
}
#sitemapin div:nth-of-type(5){
	border: solid 1px black;
	width: 180px;
	height: 200px;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div id="sitemapbox">
	<h1>SiteMap</h1>
		<div id="sitemapin">
			<div id="box1">
				<center>
				<h2>축제</h2>
				- 지역별<br>
				- 계절별<br>
				</center>
			</div>
			<div id="box2">
				<center>
				<h2>이벤트</h2>
				- 이벤트<br>
				</center>
			</div>
			<div id="box3">
				<center>
				<h2>커뮤니티</h2>
				- 자유게시판<br>
				- 축제후기<br>
				</center>
			</div>
			<div id="box4">
				<center>
				<h2>랭킹</h2>
				- 랭킹게시판<br>
				(추천/조회수)<br>
				</center>
			</div>
			<div id="box5">
				<center>
				<h2>고객마당</h2>
				- 소개<br>
				- 공지사항<br>
				- Q&A게시판<br>
				</center>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>