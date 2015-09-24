<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dto.Users"%>
<%@page import="dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

</head>
<body>
<div class="admin admin-add-problem">
	<c:url value="/freeboard_write" var="freeboard_write"></c:url>
    <sform:form method="post" action="${freeboard_write }" modelAttribute="board">
        <fieldset>
        	<sform:label path="usersUsersId">작성자</sform:label>
        	<sform:input path="usersUsersId"  readonly="true"/><br>
			<sform:label path="boardName">제목</sform:label>
			<sform:input path="boardName"/><br>
			<sform:input path="boardName"/><br>
            <sform:label path="boardContent">내용</sform:label>
            <sform:textarea path="boardContent" rows="10" cols="100"></sform:textarea><br>
            <sform:button>수정</sform:button>
            <a href="<%=request.getContextPath()%>/freeboard_view"><button type="button">취소</button></a>
        </fieldset>
    </sform:form>
</div>

<script>
	CKEDITOR.replace('boardContent');
	
</script>
</body>
</html>