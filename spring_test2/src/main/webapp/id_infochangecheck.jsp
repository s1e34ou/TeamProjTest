<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/id_infochangecheck.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div id="infochange">
	<h1>정보수정</h1>
		<div id="infochangein">
		<div id="infochangetalk">
			<h2>
				<center>회원정보 수정이<br>완료 되었습니다.</center>
			</h2>
		</div>
			<div id="gomain">
				<input type="button" id="mainbut" value="main으로"/>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>