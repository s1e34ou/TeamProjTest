<%@page import="dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.Board"%>
<%@page import="dto.Likes" %>
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
			$(location).attr("href", "<%=request.getContextPath()%>/eventboard_delete?boardNo=<%=board.getBoardNo()%>");	
							} else{
								e.preventDefault();
							}
							
						});
	<%
	Object ob =  request.getAttribute("likes");
	int like;
	if(ob!=null){
	Likes likes = (Likes)ob;
	like= likes.getLikes();
	%>
	$("#like").on("click",function(){
		$.ajax({
			type:'get',
			url:"<%=request.getContextPath()%>/likechange",
			data:{usersId:"<%=loginUser%>",boardNo:<%=board.getBoardNo()%>,likes:2},
			success:function(){
				$("#like").removeAttr("disabled","disabled:disabled")
				$("#unlike").attr("disabled","disabled:disabled")
				
			}
		});
		location.reload(true)
	});
	
	$("#unlike").on("click",function(){
		$.ajax({
			type:'get',
			url:"<%=request.getContextPath()%>/likechange",
			data:{usersId:"<%=loginUser%>",boardNo:<%=board.getBoardNo()%>,likes:1},
			success:function(){
				$("#like").attr("disabled","disabled:disabled")
				$("#unlike").removeAttr("disabled","disabled:disabled")
				
			}
		});
		location.reload(true)
	});
	
<%
	}else{
		like=0;
		%>
		
		$("#like").on("click",function(){
			$.ajax({
				type:'get',
				url:"<%=request.getContextPath()%>/like",
				data:{usersId:"<%=loginUser%>",boardNo:<%=board.getBoardNo()%>,likes:2},
				success:function(){
					$("#like").attr("disabled","disabled:disabled")
				}
			});
		});
		
		$("#unlike").on("click",function(){
			$.ajax({
				type:'get',
				url:"<%=request.getContextPath()%>/like",
				data:{usersId:"<%=loginUser%>",boardNo:<%=board.getBoardNo()%>,likes:1},
				success:function(){
					$("#unlike").attr("disabled","disabled:disabled")
				}
			});
		});
		<%
	}
%>
	});
</script>
</head>

<body>
	<div id="board">
		<h1>이벤트게시판</h1>
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
					<div>
						종류 : 
						<%
            			String code=board.getBoardCode();
            			String q;
            				if(code.equals("EVENT_food")){
            			code="음식";
            			}else if(code.equals("EVENT_beauty")){
            			code="미용";
            			}else{
            			code="문화";
            		}
            		out.println(code);
          			  %>
					</div>
				</div>
			</div>
			<hr>
			<div id="boardmid">
				<div id="boardcontent"><%=board.getBoardContent()%></div>
			</div>
			<%
				if(like==2){
			%>
			<%=request.getAttribute("likecount") %>
			<button type="submit" class="btn btn-success" disabled="disabled" id="like" name="like">좋아요</button>
			<button type="button" class="btn btn-danger" id="unlike" name="unlike">싫어요</button>
			<%=request.getAttribute("unlikecount") %>
			<%}else if(like==1){ %>
			<%=request.getAttribute("likecount") %>
			<button type="submit" class="btn btn-success"  id="like" name="like">좋아요</button>
			<button type="button" class="btn btn-danger" disabled="disabled" id="unlike" name="unlike">싫어요</button>
			<%=request.getAttribute("unlikecount") %>
			<%}else { %>
			<%=request.getAttribute("likecount") %>
			<button type="submit" class="btn btn-success"  id="like" name="like">좋아요</button>
			<button type="button" class="btn btn-danger" id="unlike" name="unlike">싫어요</button>
			<%=request.getAttribute("unlikecount") %>
			<%} %>
			
			<div id="boardfoot">
				<div id="boardmodidelbtn">
					<div class="btn-group" role="group" id="moddelbtn">
						<%
							if (loginUser != null && loginUser.equals(board.getUsersUsersId())) {
						%>
						<div>
							<a
								href="<%=request.getContextPath()%>/eventboard_change?boardNo=<%=board.getBoardNo()%>"><button
									type="button" class="btn btn-default">수정</button></a>
						</div>
						<div>
							<form method="post"
								action="<%=request.getContextPath()%>/eventboard_delete">

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
				<li class="previous"><a href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*"> <span aria-hidden="true">&larr;</span>
						list
				</a></li>
			</ul>
		</div></body>
</html>