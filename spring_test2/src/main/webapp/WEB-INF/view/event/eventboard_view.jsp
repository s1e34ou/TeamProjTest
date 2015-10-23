<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.*"%>
<%@page import="dto.Users"%>
<%@page import="dto.Likes" %>
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
			}
			
			Object replylistObj = request.getAttribute("replylist");
			List<Map<String, Object>> replylist=null;
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(replylistObj!=null){
				replylist = (List<Map<String, Object>>)replylistObj;
			}
			
			
			%>
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
		location.reload(true);
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
		location.reload(true);
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
			location.reload(true);
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
			location.reload(true);
		});
		<%
	}
%>
	
	
var resize=<%=replylist.size()%>
$("#replybut").on("click",function(e){
	if($("#replycont").val()==""){
		alert("내용을 입력하세요");
		e.preventDefault();
	}else{
	var url="<%=request.getContextPath()%>/replywrite";
	var data={replycon:$("#replycont").val(),userid:"<%=loginUser%>",boardno:<%=board.getBoardNo()%>};
	$.ajax({
		url:url,
		type:"post",
		data:data,
		
		success:function(txt){
			$("#replycont").val("");
			var add=txt.length-resize;
			//targety.append("<li>"+JSON.stringify(txt)+"</li>");
			//console.log(JSON.stringify(txt));
			for(var j=resize;j<txt.length;j++){
				var tod = txt[j]["REPLY_DATE"];
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
				var fd=date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec;
			    $("#reply").before("<div style='margin:3px; width: 550px;'><div class='replyid' >"+txt[j]["USERS_USERS_ID"]+"</div>")
				    $("#reply").before("<div id='bbb'><div class='replydate'>("+fd+")</div><div id=replydel class=replydate><a href=<%=request.getContextPath()%>/replydelete?boardno=<%=board.getBoardNo() %>&replyno="+txt[j]["REPLY_NO"]+">댓글삭제</a></div></div>");
			    $("#reply").before("<div class='replycontent'>"+txt[j]["REPLY_CONTENT"]+"</div></div><hr>");
				
				//$("#reply").prepend(txt[j][]);
			}
			resize+=add;
		//	location.reload(true);
		},
	
		"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"
	
	});
	}
}); 

});
</script>
</head>

<body>
	<div id="board">
		<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*">이벤트게시판</a></h1>
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
			<div id="boardfoot">
				<div id="likeunlike">
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
				</div>
				
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
					</div>
				</div>
			</div>
		</div>
		<div id="replyboard">
			<h2>댓글</h2>
			<div id="replyboardin">
				<div id="replyinin">
			 <%
			
			 if(replylistObj!=null){%>
<%				 
        for(int i=0;i<replylist.size();i++){
    %>
    
    <div style="margin:3px; width: 550px;">
    <div class="replyid"><%=replylist.get(i).get("users_users_id") %> </div>
    <div id="bbb">
    	<div class="replydate" >(<%=sdf.format(replylist.get(i).get("reply_date")) %>)</div> 
    	<%if(loginUser!=null&&loginUser.equals(replylist.get(i).get("users_users_id"))){ %>
    	<div id="replydel" class="replydate"><a href="<%=request.getContextPath()%>/replydelete?boardno=<%=board.getBoardNo() %>&replyno=<%=replylist.get(i).get("reply_no") %>" %>댓글삭제</a></div>
    	<%} %>
    </div>
    <div class="replycontent"> <%=replylist.get(i).get("reply_content")%></div>
    </div>
  
    <hr>
    <%}%><% }%>
    <%if(loginUser !=null){ %>
			<div id="reply" style="text-align:center; display:inline-flex;">
			<div style="margin:5px;">
						<textarea rows="4" cols="117" id="replycont" name="replycont"></textarea>
						</div>
						<div style="margin:5px;">
						<button style="height:83px;" type="button" id="replybut" class="btn btn-default">댓글쓰기</button>
						</div>
						</div>
						
						<%} %>
			</div>
			</div>
			
		</div>
		<div id="listgobtn">
			<ul class="pager">
				<li class="previous"><a href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*"> <span aria-hidden="true">&larr;</span>
						list
				</a></li>
			</ul>
		</div></body>
</html>