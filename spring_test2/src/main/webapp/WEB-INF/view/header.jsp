<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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