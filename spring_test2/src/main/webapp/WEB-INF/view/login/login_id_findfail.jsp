<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/login_id_findfail.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body>
	<div id="idpwsearch3">
	<h1>ID/PW찾기</h1>
		<div id="idpwsearch3in">
		<div id="idpwsearch3talk">
			<h2>
				<center>해당 정보에 대한<br>ID(PW)가 존재하지 않습니다.</center>
			</h2>
		</div>
			<div id="gomain">
				<a href="<%=request.getContextPath() %>/main"><input type="button" id="mainbut" value="main으로"/></a>
			</div>
		</div>
	</div>
</body>
</html>