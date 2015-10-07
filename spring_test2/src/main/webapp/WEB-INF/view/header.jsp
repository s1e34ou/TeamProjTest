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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	$("#sitemap").on("click",function(){
		$(location).attr("href", "<%=request.getContextPath()%>/site");
	});
});
</script>

	<header>
	<button type="button" id="sitemap" class="btn btn-default">사이트맵</button>
	<br>
	<br>
	<div class="row">
		<a href="<%=request.getContextPath()%>/main"><img src="<%=request.getContextPath()%>/images/fastival.jpg" id="fastivallogo"></a>

		<div class="col-lg-6" id="search">
			<div class="input-group">

				<form action="<%=request.getContextPath()%>/search"
					method="get">
					<input id="page" name="page" type="hidden" value="1"> 
					<div id="searchgr">
					<input id="stext" name="select" type="text" class="form-control" placeholder="Search for..."> 
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">Go!</button>
					</span>
					</div>
				</form>
			</div>
			<!-- /input-group -->
		</div>
	</div>
	<!-- /.col-lg-6 -->
	<div class="btn-group btn-group-justified" role="group">
		
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="mbtn1">축제
				<span class="caret"></span></button>
			<ul class="dropdown-menu" role="menu" id="headmenuul1">
				<li><a href="#">지역별 축제</a></li>
				<li><a href="#">계절별 축제</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false"id="mbtn2">이벤트
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul2">
				<li><a href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*">이벤트(할인정보)</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="mbtn3">커뮤니티
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul3">
				<li><a href="<%=request.getContextPath()%>/freeboard?page=1">자유게시판</a></li>
				<li><a href="#">축제후기게시판</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="mbtn4">랭킹
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul4">
				<li><a href="<%=request.getContextPath()%>/rankboard?page=1&select=EVENT.*">랭킹게시판(추천/조회수)</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group" id="menu5">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="mbtn5">고객마당
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul5">
				<li><a href="<%=request.getContextPath()%>/introduction">소개</a></li>
				<li><a href="<%=request.getContextPath()%>/notice?page=1">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/qnaboard?page=1">Q&A게시판</a></li>
			</ul>
		</div>
	</div>
</header>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	 $(function() {
		$("#mbtn1").mouseover(function() {
			$("#headmenuul1").slideDown('slow');
		});
		$("#headmenuul1").mouseleave(function() {
			$("#headmenuul1").slideUp('slow');
		});
	});
 	$(function() {
		$("#mbtn2").mouseover(function() {
			$("#headmenuul2").slideDown('slow');
		});
		$("#headmenuul2").mouseleave(function() {
			$("#headmenuul2").slideUp('slow');
		});
	});
 	$(function() {
		$("#mbtn3").mouseover(function() {
			$("#headmenuul3").slideDown('slow');
		});
		$("#headmenuul3").mouseleave(function() {
			$("#headmenuul3").slideUp('slow');
		});
	});
 	$(function() {
		$("#mbtn4").mouseover(function() {
			$("#headmenuul4").slideDown('slow');
		});
		$("#headmenuul4").mouseleave(function() {
			$("#headmenuul4").slideUp('slow');
		});
	});
 	$(function() {
		$("#mbtn5").mouseover(function() {
			$("#headmenuul5").slideDown('slow');
		});
		$("#headmenuul5").mouseleave(function() {
			$("#headmenuul5").slideUp('slow');
		});
	});
</script>
