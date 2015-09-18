<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<%
		String contentpage = null;
		if (request.getParameter("contentpage") != null) {
			contentpage = request.getParameter("contentpage");
		} else if (request.getAttribute("contentpage") != null) {
			contentpage = request.getAttribute("contentpage").toString();
		} else if (session.getAttribute("contentpage") != null) {
			contentpage = session.getAttribute("contentpage").toString();
		}
		if (contentpage == null) {
			contentpage = "/WEB-INF/view/main.jsp";
		}
	%>
	<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<jsp:include page="<%=contentpage%>"></jsp:include>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>