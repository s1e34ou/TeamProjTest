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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

</head>
<body>
<%
	Object loginUserObj = session.getAttribute("loginUser");
	String UserId = ((Users) loginUserObj).getUsersId();
%>
<div class="admin admin-add-problem">
	<c:url value="/festival_regionboard_write" var="festival_regionboard_write"></c:url>
    <sform:form method="post" action="${festival_regionboard_write }" modelAttribute="board">
        <fieldset>
        	<sform:label path="usersUsersId">작성자</sform:label>
        	<sform:input path="usersUsersId" value="<%=UserId %>"/><br>
			<sform:label path="boardName">제목</sform:label>
			<sform:input path="boardName" /><br>
            <sform:label path="boardContent">내용</sform:label>
            <sform:textarea path="boardContent"/><br>
            <sform:button>글쓰기</sform:button>
        </fieldset>
    </sform:form>
</div>

<script>
	CKEDITOR.replace('boardContent');
	
</script>
</body>
</html>