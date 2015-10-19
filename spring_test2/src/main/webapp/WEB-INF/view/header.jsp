<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Users"%>
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
<%int abc = 0; %>
	<header>
	<%
			Object loginUserObj = session.getAttribute("loginUser");
			if (loginUserObj == null) {
		%> 
			<img src="<%=request.getContextPath()%>/images/LOGIN_off.jpg" id="logoff">
			<!-- 로그인을 하지 않았습니다. -->
		<%}else{ 
			String loginUser = ((Users) loginUserObj).getUsersName();
		%>
			<img src="<%=request.getContextPath()%>/images/LOGIN_on.jpg" id="logon">
			<%-- <%=loginUser%>님 반갑습니다. --%>
		<% }  %>
	<button type="button" id="sitemap" class="btn btn-default">사이트맵</button>
	<br>
	<br>
	<div class="row">
		<a href="<%=request.getContextPath()%>/main"><img src="<%=request.getContextPath()%>/images/fastival.jpg" id="fastivallogo"></a>

		<div class="col-lg-6" id="search">
			<div class="input-group">

				<form action="<%=request.getContextPath()%>/search"
					method="get">
					<input id="se" name="se" type="hidden" value="all">
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
				<li><a href="<%=request.getContextPath()%>/festival_regionboard">지역별 축제</a></li>
				<li><a href="<%=request.getContextPath()%>/festival_seasonboard">월별 축제</a></li>
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
				<li><a href="<%=request.getContextPath()%>/albumboard?page=1">축제후기게시판</a></li>
			</ul>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false" id="mbtn4">랭킹
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" id="headmenuul4">
				<li><a href="<%=request.getContextPath()%>/rankboard?page=1&select=*">랭킹게시판(추천/조회수)</a></li>
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
	 $(document).ready(function () {
		    $("#mbtn1").mouseover(function() {
		        $("#headmenuul1").show();
		    })
		    $("#mbtn1").mouseout(function() {
		        t = setTimeout(function() {
		            $("#headmenuul1").hide();
		        }, 100);
		    $("#headmenuul1").on('mouseenter', function() {
		        $("#headmenuul1").show();
		        clearTimeout(t);
		        }).on('mouseleave', function() {
		            $("#headmenuul1").hide();
	        });
	    });
	});
	 $(document).ready(function () {
		    $("#mbtn2").mouseover(function() {
		        $("#headmenuul2").show();
		    })
		    $("#mbtn2").mouseout(function() {
		        t = setTimeout(function() {
		            $("#headmenuul2").hide();
		        }, 100);
		    $("#headmenuul2").on('mouseenter', function() {
		        $("#headmenuul2").show();
		        clearTimeout(t);
		        }).on('mouseleave', function() {
		            $("#headmenuul2").hide();
	        });
	    });
	});
	 $(document).ready(function () {
		    $("#mbtn3").mouseover(function() {
		        $("#headmenuul3").show();
		    })
		    $("#mbtn3").mouseout(function() {
		        t = setTimeout(function() {
		            $("#headmenuul3").hide();
		        }, 100);
		    $("#headmenuul3").on('mouseenter', function() {
		        $("#headmenuul3").show();
		        clearTimeout(t);
		        }).on('mouseleave', function() {
		            $("#headmenuul3").hide();
	        });
	    });
	});
	 $(document).ready(function () {
		    $("#mbtn4").mouseover(function() {
		        $("#headmenuul4").show();
		    })
		    $("#mbtn4").mouseout(function() {
		        t = setTimeout(function() {
		            $("#headmenuul4").hide();
		        }, 100);
		    $("#headmenuul4").on('mouseenter', function() {
		        $("#headmenuul4").show();
		        clearTimeout(t);
		        }).on('mouseleave', function() {
		            $("#headmenuul4").hide();
	        });
	    });
	});
	 $(document).ready(function () {
		    $("#mbtn5").mouseover(function() {
		        $("#headmenuul5").show();
		    })
		    $("#mbtn5").mouseout(function() {
		        t = setTimeout(function() {
		            $("#headmenuul5").hide();
		        }, 100);
		    $("#headmenuul5").on('mouseenter', function() {
		        $("#headmenuul5").show();
		        clearTimeout(t);
		        }).on('mouseleave', function() {
		            $("#headmenuul5").hide();
	        });
	    });
	});
	
</script>
