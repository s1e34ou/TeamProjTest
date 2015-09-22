<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


	<header>
	<a href="<%=request.getContextPath()%>/site"><button type="button" id="sitemap">사이트맵</button></a>
	<br>
	<br>
	<div class="row">
		<a href="<%=request.getContextPath()%>/main"><img src="<%=request.getContextPath()%>/images/fastival.jpg" id="fastivallogo"></a>

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
	<div class="btn-group btn-group-justified" role="group">
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">축제
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul1">
				<li><a href="#">지역별 축제</a></li>
				<li><a href="#">계절별 축제</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">이벤트
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul2">
				<li><a href="#">이벤트(할인정보)</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">커뮤니티
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul3">
				<li><a href="#">자유게시판</a></li>
				<li><a href="#">축제후기게시판</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">랭킹
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul4">
				<li><a href="#">랭킹게시판(추천/조회수)</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">고객마당
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul5">
				<li><a href="#">소개</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">Q&A</a></li>
			</ul>
		</div>
	</div>
</header>
<script src="http://code.jquery.com/jquery-latest.js"></script>
