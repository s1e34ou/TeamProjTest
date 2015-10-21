<%@page import="java.io.Console"%>
<%@page import="dto.Users"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Board"%>

<%@page import="java.awt.print.Printable"%>
<%@page import="dto.Users"%>
<%@page import="service.BoardServiceImpl"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.festid{
	color:black;
}
.fes{
padding-left:10px;
}
</style>
<link href="<%=request.getContextPath()%>/style/index.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function() {
	<%
	Date today = new Date();
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분");
		SimpleDateFormat ddd=new SimpleDateFormat("yyyyMMdd");
		String dddd=ddd.format(today);
%>
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
	$("#adduser").on("click",function(){
		$(location).attr("href", "<%=request.getContextPath()%>/join");
	});
	
	$("#idpwsearch").on("click",function(){
		$(location).attr("href", "<%=request.getContextPath()%>/login_findinput");
				});
	
	$("#changeuser").on("click",function(){
		$(location).attr("href", "<%=request.getContextPath()%>/infochange");
	});
	
	$("#logout").on("click",function(){
		$(location).attr("href", "<%=request.getContextPath()%>/logout");
		});
<%String msg = (String) request.getAttribute("ex");
			if (msg == "아이디 확인") {%>
	alert("아이디를 확인하세요");
<%} else if (msg == "비밀번호 확인") {%>
	alert("비밀번호를 확인하세요");
<%}%>

var url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
var url2="&numOfRows=4";
var url3="&pageNo=1";
var url4="&eventStartDate=<%=dddd%>";
var url5="&eventEndDate=<%=dddd%>";
var url7="&MobileOS=ETC&MobileApp=AppTesting&arrange=Q&_type=json";

url=url+url2+url3+url4+url5+url7;

$.ajax({
	url:url,
	type:"get",
	success:function(txt){
		
		var $box4=$("#box4");
		var item= txt["response"]["body"]["items"]["item"];
		$.each(item,function(index,data){
			$box4.append("<a id='festid' href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+"><div class='fes'><table align='center' id='box4t'><tr><td rowspan=3><img src=" +data["firstimage2"]+" width=60px height=60px></td><td width=500px>"+data["title"]+"</td></tr><tr><td>"+data["eventstartdate"]+"~ "+data["eventenddate"]+"</td></tr><tr><td>"+data["addr1"]+"</td></tr></table></div></a>");
			//한국관광공사 api
		});
	}
	
	});

var ranklist="<%=request.getContextPath()%>/rankjson";
var rselected = $('[name=rankradio]:checked').val();

$.ajax({
	
	url:ranklist,
	type:"post",
	data:{selected:rselected,type:"*"},
	success:function(txt){
		var $box6_2=$("#box6_2");
		$box6_2.empty();
		var code;
		for(var i=0;i<4;i++){
			var tod=txt[i]["boardDate"];
			var date=new Date(tod);
			var month=date.getMonth()+1;
			var day=date.getDate();
			var hour=date.getHours();
			var min=date.getMinutes();
			var sec=date.getSeconds();
			
			if(month<10){
				month="0"+(date.getMonth()+1);
			}
			if(day<10){
				day="0"+date.getDate();
			}
			if(hour<10){
				hour="0"+hour;
			}
			if(min<10){
				min="0"+min;
			}
			if(sec<10){
				sec="0"+sec;
			}
			
				code="음식"
				$box6_2.append("<a href=<%=request.getContextPath()%>/rankboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box6t' height=60 width=350 border=1 >"+
						 "<tr  align=center valign=middle >"+
						     "<td width=60  rowspan=3>"+
							"<img width=60 height=60 src=<%=request.getContextPath()%>/images/food.png>"+
							"</td>"+
							"<td> "+txt[i]["boardName"]+" </td></tr>"+
							"<tr  align=center valign=middle>"+
							"<td> "+txt[i]["boardCode"]+"</td></tr>"+
							"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
							
			}//한국관광공사 api
	}
	
	});
$('input[name=rankradio]').on("click",function(){
rselected = $('[name=rankradio]:checked').val();
$.ajax({

url:ranklist,
type:"post",
data:{selected:rselected,type:"*"},
success:function(txt){
	var $box6_2=$("#box6_2");
	$box6_2.empty();
	var code;
	for(var i=0;i<4;i++){
		var tod=txt[i]["boardDate"];
		var date=new Date(tod);
		var month=date.getMonth()+1;
		var day=date.getDate();
		var hour=date.getHours();
		var min=date.getMinutes();
		var sec=date.getSeconds();
		
		if(month<10){
			month="0"+(date.getMonth()+1);
		}
		if(day<10){
			day="0"+date.getDate();
		}
		if(hour<10){
			hour="0"+hour;
		}
		if(min<10){
			min="0"+min;
		}
		if(sec<10){
			sec="0"+sec;
		}
		code="음식"
			$box6_2.append("<a href=<%=request.getContextPath()%>/rankboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box6t' height=60 width=350 border=1 >"+
					 "<tr  align=center valign=middle >"+
					     "<td width=60  rowspan=3>"+
						"<img width=60 height=60 src=<%=request.getContextPath()%>/images/food.png>"+
						"</td>"+
						"<td>"+txt[i]["boardName"]+" </td></tr>"+
						"<tr  align=center valign=middle>"+
						"<td>"+txt[i]["boardCode"]+"</td></tr>"+
						"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
		}//한국관광공사 api
}

});
});

 var eventlist="<%=request.getContextPath()%>/mainevent";
 var eselected = $('[name=eventradio]:checked').val();

 $.ajax({
		
		url:eventlist,
		type:"post",
		data:{selected:eselected},
		success:function(txt){
			var $box5_2=$("#box5_2");
			
			$box5_2.empty();
			var code;
			for(var i=0;i<4;i++){
				var tod=txt[i]["boardDate"];
				var date=new Date(tod);
				var month=date.getMonth()+1;
				var day=date.getDate();
				var hour=date.getHours();
				var min=date.getMinutes();
				var sec=date.getSeconds();
				
				if(month<10){
					month="0"+(date.getMonth()+1);
				}
				if(day<10){
					day="0"+date.getDate();
				}
				if(hour<10){
					hour="0"+hour;
				}
				if(min<10){
					min="0"+min;
				}
				if(sec<10){
					sec="0"+sec;
				}
				
				
				if(txt[i]["boardCode"]=="EVENT_food"){
					code="음식"
					$box5_2.append("<a href=<%=request.getContextPath()%>/eventboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box5t' height=60 width=350 border=1 >"+
							 "<tr  align=center valign=middle >"+
							     "<td width=60  rowspan=3>"+
								"<img width=60 height=60 src=<%=request.getContextPath()%>/images/food.png>"+
								"</td>"+
								"<td> "+txt[i]["boardName"]+" </td></tr>"+
								"<tr  align=center valign=middle>"+
								"<td>"+code+"</td></tr>"+
								"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
								
				}else if(txt[i]["boardCode"]=="EVENT_beauty"){
					code="미용"
						$box5_2.append("<a href=<%=request.getContextPath()%>/eventboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box5t' height=60 width=350 border=1 >"+
								 "<tr  align=center valign=middle >"+
								     "<td width=60  rowspan=3>"+
									"<img width=60 height=60 src=<%=request.getContextPath()%>/images/beau.png>"+
									"</td>"+
									"<td>"+txt[i]["boardName"]+" </td></tr>"+
									"<tr  align=center valign=middle>"+
									"<td> "+code+"</td></tr>"+
									"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
						
				}else{
					code="문화"
						$box5_2.append("<a href=<%=request.getContextPath()%>/eventboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box5t' height=60 width=350 border=1 >"+
								 "<tr  align=center valign=middle >"+
								     "<td width=60  rowspan=3>"+
									"<img width=60 height=60 src=<%=request.getContextPath()%>/images/cult.png>"+
									"</td>"+
									"<td> "+txt[i]["boardName"]+" </td></tr>"+
									"<tr  align=center valign=middle>"+
									"<td>"+code+"</td></tr>"+
									"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
						
				}
				}//한국관광공사 api
		}
		
		});
 $('input[name=eventradio]').on("click",function(){
	eselected = $('[name=eventradio]:checked').val();
$.ajax({
	
	url:eventlist,
	type:"post",
	data:{selected:eselected},
	success:function(txt){
		var $box5_2=$("#box5_2");
		$box5_2.empty();
		var code;
		for(var i=0;i<4;i++){
			var tod=txt[i]["boardDate"];
			var date=new Date(tod);
			var month=date.getMonth()+1;
			var day=date.getDate();
			var hour=date.getHours();
			var min=date.getMinutes();
			var sec=date.getSeconds();
			
			if(month<10){
				month="0"+(date.getMonth()+1);
			}
			if(day<10){
				day="0"+date.getDate();
			}
			if(hour<10){
				hour="0"+hour;
			}
			if(min<10){
				min="0"+min;
			}
			if(sec<10){
				sec="0"+sec;
			}
			
			
			if(txt[i]["boardCode"]=="EVENT_food"){
				code="음식"
				$box5_2.append("<a href=<%=request.getContextPath()%>/eventboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box5t' height=60 width=350 border=1 >"+
						 "<tr  align=center valign=middle >"+
						     "<td width=60  rowspan=3>"+
							"<img width=60 height=60 src=<%=request.getContextPath()%>/images/food.png>"+
							"</td>"+
							"<td> "+txt[i]["boardName"]+" </td></tr>"+
							"<tr  align=center valign=middle>"+
							"<td>"+code+"</td></tr>"+
							"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
							
			}else if(txt[i]["boardCode"]=="EVENT_beauty"){
				code="미용"
					$box5_2.append("<a href=<%=request.getContextPath()%>/eventboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box5t' height=60 width=350 border=1 >"+
							 "<tr  align=center valign=middle >"+
							     "<td width=60  rowspan=3>"+
								"<img width=60 height=60 src=<%=request.getContextPath()%>/images/beau.png>"+
								"</td>"+
								"<td> "+txt[i]["boardName"]+" </td></tr>"+
								"<tr  align=center valign=middle>"+
								"<td> "+code+"</td></tr>"+
								"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
					
			}else{
				code="문화"
					$box5_2.append("<a href=<%=request.getContextPath()%>/eventboard_view?boardNo="+txt[i]["boardNo"]+"><div class=fes><table id='box5t' height=60 width=350 border=1 >"+
							 "<tr  align=center valign=middle >"+
							     "<td width=60  rowspan=3>"+
								"<img width=60 height=60 src=<%=request.getContextPath()%>/images/cult.png>"+
								"</td>"+
								"<td> "+txt[i]["boardName"]+" </td></tr>"+
								"<tr  align=center valign=middle>"+
								"<td>"+code+"</td></tr>"+
								"<tr align=center valign=middle><td>"+ date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+"</td></tr></table></div>");
					
			}
			}//한국관광공사 api
	}
	
	});
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
					<input type="text" name="usersId" id="usersId" /> <input
						type="password" name="usersPassword" id="usersPassword" />
				</div>
				<div id="loginbutton">
					<input class="btn btn-default" type="submit" id="loginbutton" value="로그인" />
				</div>
			</div>
		</form>

		<div id="box3">
			<input class="btn btn-default" type="button" id="adduser" value="회원가입" />
			 <input class="btn btn-default" type="button" id="idpwsearch" value="ID/PW찾기" />
		</div>
		<%
			} else {

				String loginUser = ((Users) loginUserObj).getUsersName();
		%>
		<div id="loginonbox">
			<div id="welcome">
				<center><%=loginUser%>님 반갑습니다.
				</center>
			</div>
			<div id="timetoday">
				
				<center><%=sdf.format(today)%></center>
			</div>
		</div>
		<div id="infologbox">
			<input class="btn btn-default" type="button" id="changeuser" value="정보수정" /> <input
			 class="btn btn-default"	type="button" id="logout" value="로그아웃" />

		</div>
		<%
			}
		%>
	</div>
	</section>
	<div id="boardbox">
		<div id="box4"></div>
		<div id="box5">
		<div>
	<input type="radio" id="eall" name="eventradio" value="all" checked><label for="eall">전체</label>
		<input type="radio" id="efood" name="eventradio" value="food" ><label for="efood">음식</label>
		<input type="radio" id="ebeau" name="eventradio" value="beauty"><label for="ebeau">미용</label>
		<input type="radio" id="ecult" name="eventradio" value="culture"><label for="ecult">문화</label>
		</div>
		<div id=box5_2></div>
			
					</div>
		<div id="box6">
		<div><input type="radio" id="rhit" name="rankradio" value="hit" checked><label for="rhit">조회수</label>
		<input type="radio" id="rrec" name="rankradio" value="rec" ><label for="rrec">추천수</label></div>
		<div id="box6_2"></div>
		</div>
	</div>
	<div id="defaultbox">
		<div id="picboard">
			<div id="picture1">
				<a href="<%=request.getContextPath() %>/search?page=1&select=롯" class="thumbnail"> <img
					src="<%=request.getContextPath()%>/images/planets.jpg" id="picb1">
				</a>
				<div class="caption" id="picbtext1">
					<center>
						<h3>제목제목제목1</h3>
						<p>내용내용내용내용내용내용내용내용내용내용내용내용</p>
					</center>
				</div>
			</div>
			<div id="picture2">
				<a href="<%=request.getContextPath() %>/albumboard_view?photoNo=195" class="thumbnail"> <img
					src="<%=request.getContextPath()%>/images/planets.jpg" id="picb2">
				</a>
				<div class="caption" id="picbtext2">
					<center>
						<h3>제목제목제목2</h3>
						<p>내용내용내용내용내용내용내용내용내용내용내용내용</p>
					</center>
				</div>
			</div>
			<div id="picture3">
				<a href="#" class="thumbnail"> <img
					src="<%=request.getContextPath()%>/images/planets.jpg" id="picb3">
				</a>
				<div class="caption" id="picbtext3">
					<center>
						<h3>제목제목제목3</h3>
						<p>내용내용내용내용내용내용내용내용내용내용내용내용</p>
					</center>
				</div>
			</div>
			<div id="picture4">
				<a href="#" class="thumbnail"> <img
					src="<%=request.getContextPath()%>/images/planets.jpg" id="picb4">
				</a>
				<div class="caption" id="picbtext4">
					<center>
						<h3>제목제목제목4</h3>
						<p>내용내용내용내용내용내용내용내용내용내용내용내용</p>
					</center>
				</div>
			</div>
		</div>
		<div id="bannerbox">
			<div id="banner1">
				<a href="http://www.culture.go.kr/wday/">
				<img src="<%=request.getContextPath()%>/images/culture.jpg" id="ban1">
				</a>
			</div>
			<div id="banner2">
				<a href="http://korean.visitkorea.or.kr/kor/inut/addOn/main/publish/index.jsp"> 
				<img src="<%=request.getContextPath()%>/images/sigkor.jpg" id="ban2">
				</a>
			</div>
			<div id="banner3">
				<a href="http://www.letskorail.com/"> 
				<img src="<%=request.getContextPath()%>/images/korail.jpg" id="ban3">
				</a>
			</div>
		</div>
	</div>
	<hr>

</body>
</html>