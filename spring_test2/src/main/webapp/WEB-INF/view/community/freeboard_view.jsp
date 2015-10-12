<%@page import="dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/board_view.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
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
			Board board = (Board) cb;
			String loginUser = null;
			Object loginUserObj = session.getAttribute("loginUser");
			if (loginUserObj != null) {
				loginUser = ((Users) loginUserObj).getUsersId();
			}%>
$(function() {
	$("#deleteboard").on("click",function(){
		if(confirm("삭제하시겠습니까")){
			$(location).attr("href", "<%=request.getContextPath()%>/freeboard_delete?boardNo=<%=board.getBoardNo()%>");	
							} else{
								e.preventDefault();
							}
							
		});
	
	$("#like").on("click",function(){
		$.ajax({
			type:'get',
			url:"<%=request.getContextPath()%>/like",
			data:{usersId:"a"},
			success:function(){
				$("#like").css("color","black");
				console.log("test");
			}
		});
	});
	
	$("#usersId").on("keyup",function(){
		
		$target=$("#dup");
		
		$.ajax({
			type:'get',
			url:"<%=request.getContextPath()%>/duplication",
			data:{usersId:$("#usersId").val()},
			success:function(responseTxt){
				dupl=responseTxt;
				if(responseTxt=="아이디중복"){
					$target.css("color","red");
				}else{
					$target.css("color","green");
				}
				$target.html(responseTxt);
			},
			
			error:function(xhr, status, error){
				console.log("error: "+error);
			}
			
		});
	});	
});
</script>
</head>

<body>
	<div id="board">
		<h1>자유게시판</h1>
		<div id="boardin">
			<div id="boardhead">
				<div id="boardtitle">
					<h4>
						제목 :
						<%=board.getBoardName()%></h4>
				</div>
				<div id="boardinfo">
					<div id="boardwriter">
						작성자 :
						<%=board.getUsersUsersId()%></div>
					<div id="boarddate">
						작성일 :
						<%=board.getBoardDate()%></div>
					<div id="boardindex">
						글번호 :
						<%=board.getBoardNo()%></div>
					<div id="boardhits">
						조회수 :
						<%=board.getBoardHits()%></div>
				</div>
			</div>
			<hr>
			<div id="boardmid">
				<div id="boardcontent"><%=board.getBoardContent()%></div>
			</div>
			<button type="submit" class="btn btn-success" id="like" name="like">좋아요</button>
			<button type="button" class="btn btn-danger">싫어요</button>
			<div id="boardfoot">
				<div id="boardmodidelbtn">
					<div class="btn-group" role="group" id="moddelbtn">
						<%
							if (loginUser != null && loginUser.equals(board.getUsersUsersId())) {
						%>
						<div>
							<a
								href="<%=request.getContextPath()%>/freeboard_change?boardNo=<%=board.getBoardNo()%>"><button
									type="button" class="btn btn-default">수정</button></a>
						</div>
						<div>
							<form method="post"
								action="<%=request.getContextPath()%>/freeboard_delete">

								<input type="button" id="deleteboard" class="btn btn-default" value="삭제">
							</form>
						</div>
						<%
							}
						%>
						<div>
							<button type="button" class="btn btn-default">댓글쓰기</button>
						</div>
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
			<div id="replyboardin"></div>
		</div>
		<div id="listgobtn">
			<ul class="pager">
				<li class="previous"><a href="<%=request.getContextPath()%>/freeboard?page=1"> <span aria-hidden="true">&larr;</span>
						list
				</a></li>
			</ul>
		</div></body>
</html>