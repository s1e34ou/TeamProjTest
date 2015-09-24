<%@page import="dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#board {
	width: 1000px;
	height: 1350px;
	margin: auto;
}
#boardin {
	border: solid 1px black;
	width: 1000px;
	height: 770px;
	margin: auto;	
}
#boardhead{
	height: 60px;
}
#boardtitle{
	margin-left: 10px;
}
#boardinfo{
	display: -webkit-box;
	float: right;
	margin-right: 10px;
}
#boardwriter{
	margin-right: 20px;
}
#boarddate{
	margin-right: 20px;
}
#boardindex{
	margin-right: 20px;
}
#boardmid{
	height: 600px;
	width: 1000px;
}
#boardcontent{
	height: 570px;
	width: 850px;
	margin: auto;
}
#boardfoot{
	height: 40px;
}
#moddelbtn{
	display: -webkit-box;
	float:right;
	margin-right: 15px;
}
#prevnextbtn{
	height: 70px;
}
#replyboard{
	height: 400px;
}
#replyboardin{
	border: solid 1px gray;
	height: 350px;
}
#listgobtn{
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
<%Object cb = request.getAttribute("currentboard");
Board board = (Board)cb;
String loginUser=null;
Object loginUserObj = session.getAttribute("loginUser");
if(loginUserObj!=null){
 loginUser = ((Users) loginUserObj).getUsersId();
}
 %>
$(function() {
	$("#deleteboard").on("click",function(){
		if(confirm("삭제하시겠습니까")){
			$(location).attr("href", "<%=request.getContextPath()%>/freeboard_delete");	
		}else{
			e.preventDefault();
		}
	});
});
</script>
</head>

<body>
	<div id="board">
		<h1>자유게시판</h1>
		<div id="boardin">
		<div id="boardhead">
			<div id="boardtitle"><h4>제목 : <%=board.getBoardName() %></h4></div>
			<div id="boardinfo">
				<div id="boardwriter">작성자 : <%=board.getUsersUsersId()%></div>
				<div id="boarddate">작성일 : <%=board.getBoardDate()%></div>
				<div id="boardindex">글번호 : <%=board.getBoardNo()%></div>
			</div>
		</div>
		<hr>
		<div id="boardmid">
			<div id="boardcontent"><%=board.getBoardContent() %></div>
		</div>
		<div id="boardfoot">
			<div id="boardmodidelbtn">
					<div class="btn-group" role="group" id="moddelbtn">
					<%if(loginUser!=null&&loginUser.equals(board.getUsersUsersId())){ %>
						<div><button type="button" class="btn btn-default">수정</button></div>
						<div>
						<form method="post" action="<%=request.getContextPath()%>/freeboard_delete">
					
							<input  id = "boardNo" name="boardNo" value="<%=board.getBoardNo()%>" type="hidden">
							<input type="button" id="deleteboard" class="btn btn-default" value="삭제"/>
						</form></div>
						<%} %>
						<div><button type="button" class="btn btn-default">댓글쓰기</button></div>
					</div>
				</div>
		</div>
		</div>
		<div id="prevnextbtn">
				<ul class="pager">
					<li><a href="#">Previous</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
		<div id="replyboard">
			<h2>댓글</h2>
			<div id="replyboardin">
		</div>
		<div id="listgobtn">
			<ul class="pager">
					<li class="previous">
					<a href="#">
					<span aria-hidden="true">&larr;</span>
					list</a></li>
			</ul>
		</div>
	</div>
</body>
</html>