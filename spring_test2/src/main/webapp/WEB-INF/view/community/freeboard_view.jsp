<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><center>
<%Object cb = request.getAttribute("currentboard");
Board board = (Board)cb;
 %>
 <h1>글</h1>
	<label>글번호</label>:
	<%=board.getBoardNo()%>
	<br>
	<label>ID</label>:
	<%=board.getUsersUsersId()%>
	<br>
	<label>작성일</label>:
	<%=board.getBoardDate()%>
	<br>
	<label>내용</label>
	<p>
		<%=board.getBoardContent()%>
	<p>
</body>
</html>