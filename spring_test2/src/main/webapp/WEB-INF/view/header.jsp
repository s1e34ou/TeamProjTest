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
	<div class="btn-group btn-group-justified" role="group"
		aria-label="...">
		<div class="btn-group" role="group">
			<a href="<%=request.getContextPath()%>/site"><button type="button" class="btn btn-default">축제</button></a>
		</div>
		<div class="btn-group" role="group">
			<a href="<%=request.getContextPath()%>/site"><button type="button" class="btn btn-default">이벤트</button></a>
		</div>
		<div class="btn-group" role="group">
			<a href="<%=request.getContextPath()%>/site"><button type="button" class="btn btn-default">커뮤니티</button></a>
		</div>
		<div class="btn-group" role="group">
			<a href="<%=request.getContextPath()%>/site"><button type="button" class="btn btn-default">랭킹</button></a>
		</div>
		<div class="btn-group" role="group">
			<a href="<%=request.getContextPath()%>/site"><button type="button" class="btn btn-default">고객마당</button></a>
		</div>
	</div>
	</header>