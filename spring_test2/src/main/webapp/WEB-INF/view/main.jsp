<%@page import="dto.Users"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/index.css"
	rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	$("#loginbutton").on("click",function(e){
		if($("#usersId").val()==""){
			alert("아이디를 입력해 주세요");
			e.preventDefault();
			
		}
		if($("#usersId").val()!=""&&$("#usersPassword").val()==""){
			alert("비밀번호를 입력해 주세요");
			e.preventDefault();
		}
	});
});
</script>
</head>
<body>

	<section id="parent">
	<div id="box1">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="<%=request.getContextPath()%>/images/fall1.jpg" id="seasonpic1">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/images/fall2.jpg" id="seasonpic2">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/images/fall3.jpg" id="seasonpic3">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/images/fall4.jpg" id="seasonpic4">
					<div class="carousel-caption">...</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div id="loginbox">
		<%
			Object loginUserObj = session.getAttribute("loginUser");
			if (loginUserObj == null) {
		%>
		
			<c:url value="/login" var="login"></c:url>
			<form action="${login }" method="POST">
			<div id="box2">
				<div id="logintext">
					<input type="text" name="usersId" id="usersId" />
					<input type="password" name="usersPassword" id="usersPassword"/>
				</div>
				<div id="loginbutton">
					<input type="submit" id="loginbtn" value="로그인" />
				</div>
			</div>
			</form>
		
		<div id="box3">
			<a href="<%=request.getContextPath()%>/join"><input type="button"
				id="adduser" value="회원가입" /></a> 
			<a href="<%=request.getContextPath()%>/login_findinput"><input type="button" id="idpwsearch"
				value="ID/PW찾기" /></a>	
		</div>
		<%
			} else {
				String loginUser = ((Users) loginUserObj).getUsersName();
		%>
		<div id="loginonbox">
		<div id="welcome">
		<center><%=loginUser%>님 반갑습니다.</center>
		</div>
		<div id="timetoday">
		<%
			Date today = new Date();
			SimpleDateFormat sdf;
			sdf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분");
		%>
		<center><%=sdf.format(today)%></center>
		</div>
		</div>
		<div id="infologbox">
		<a href="<%=request.getContextPath()%>/infochange">
		<input type="button" id="changeuser" value="정보수정" /></a> 
		<a href="<%=request.getContextPath() %>/logout">
			<input type="button" id="logout" value="로그아웃" />
		</a>
		</div>
		<%
			}
		%>
	</div>
	</section>
	<div id="boardbox">
		<div id="box4"></div>
		<div id="box5"></div>
		<div id="box6"></div>
	</div>
	<div id="defaultbox">
		<div id="picboard">
			<div id="picture1">
				<a href="#" class="thumbnail"> <img
					src="<%=request.getContextPath()%>/images/planets.jpg" id="picb1">
				</a>
				<div class="caption" id="picbtext1">
					<center><h3>제목제목제목2</h3>
					<p>내용내용내용내용내용내용내용내용내용내용내용내용</p></center>
				</div>
			</div>
				<div id="picture2">
				<a href="#" class="thumbnail"> 
					<img src="<%=request.getContextPath()%>/images/planets.jpg" id="picb2">
				</a>
				<div class="caption" id="picbtext2">
					<center><h3>제목제목제목2</h3>
					<p>내용내용내용내용내용내용내용내용내용내용내용내용</p></center>
				</div>
			</div>
			<div id="picture3">
				<a href="#" class="thumbnail"> 
					<img src="<%=request.getContextPath()%>/images/planets.jpg" id="picb3">
				</a>
				<div class="caption" id="picbtext3">
					<center><h3>제목제목제목3</h3>
					<p>내용내용내용내용내용내용내용내용내용내용내용내용</p></center>
				</div>
			</div>
			<div id="picture4">
				<a href="#" class="thumbnail"> 
					<img src="<%=request.getContextPath()%>/images/planets.jpg" id="picb4">
				</a>
				<div class="caption" id="picbtext4">
					<center><h3>제목제목제목4</h3>
					<p>내용내용내용내용내용내용내용내용내용내용내용내용</p></center>
				</div>	
			</div>
		</div>
		<div id="bannerbox">
			<div id="banner1"></div>
			<div id="banner2"></div>
		</div>
	</div>
	<hr>

</body>
</html>