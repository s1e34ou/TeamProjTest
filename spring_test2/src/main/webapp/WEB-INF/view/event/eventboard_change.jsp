<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dto.Users"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/eventboard_change.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<%
Object cb = request.getAttribute("board");
Board board = (Board) cb;

%>
<script type="text/javascript">
$(function() {
	$("#wri").on("click",function(e){
		if($("#boardName").val()==""){
			alert("제목을 입력하세요");
			e.preventDefault();
		}
	});
});
</script>
</head>
<body>
<div id="boardchange">
	<h1>이벤트게시판</h1>
		<div id="boardin">
<div class="admin admin-add-problem">
	<c:url value="/eventboard_change" var="eventboard_change"></c:url>
    <sform:form method="post" action="${eventboard_change }" modelAttribute="board">
        <fieldset>
        	<div id="blisthead">
        		<div id="userid">
				<sform:label path="usersUsersId">작성자</sform:label>
	        	<sform:input path="usersUsersId"  readonly="true"/>
	        	</div>
	        	<div id="bcode">
	        	<sform:label path="boardCode">종류</sform:label>
	        	<sform:select path="boardCode">
	        		<sform:option label="식품" value="EVENT_food"/>
	        		<sform:option label="미용" value="EVENT_beauty"/>
	        		<sform:option label="문화" value="EVENT_culture"/>
	        	</sform:select>
	        	</div>
	        	<div id="bno">
	        	<sform:label path="boardNo">글번호</sform:label>
	        	<sform:input path="boardNo" readonly="true"/>
	        	</div>
        	</div>
        	<div id="bname">
        	<sform:label path="boardName">제목</sform:label>
			<sform:input path="boardName"/>
			</div>
			<hr>
            <sform:label path="boardContent">내용</sform:label>
            <sform:textarea path="boardContent" rows="10" cols="100"></sform:textarea><br>
            <div id="blistfoot">
            <sform:button id="wri">수정</sform:button>
            <a href="<%=request.getContextPath()%>/eventboard_view?boardNo=<%=board.getBoardNo()%>"><button type="button">취소</button></a>
            </div>
        </fieldset>
    </sform:form>
</div>
</div>
</div>
<script>
	CKEDITOR.replace('boardContent');
	
</script>
</body>
</html>