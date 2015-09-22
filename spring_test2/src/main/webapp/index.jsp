<%@page import="dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/head_footer.css"
			rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/index.css"
			rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/main.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>
