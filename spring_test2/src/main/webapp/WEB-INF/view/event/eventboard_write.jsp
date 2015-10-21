<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dto.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/eventboard_write.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
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
<div id="boardwrite">
	<h1>이벤트게시판</h1>
		<div id="boardin">
<div class="admin admin-add-problem">
	<c:url value="/eventboard_write" var="eventboard_write"></c:url>
    <sform:form method="post" action="${eventboard_write }" modelAttribute="board">
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
	        	
        	</div>
        	<div id="bname">
        	<sform:label path="boardName">제목</sform:label>
			<sform:input path="boardName"/>
			</div>
			<hr>
            <sform:label path="boardContent">내용</sform:label>
            <sform:textarea path="boardContent" rows="10" cols="100"></sform:textarea><br>
            <div id="blistfoot">
            <sform:button id="wri">글쓰기</sform:button>
            <a href="<%=request.getContextPath()%>/freeboard?page=1"><button type="button">취소</button></a>
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