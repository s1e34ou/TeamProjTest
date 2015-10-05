<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/id_deleteconfirm.css"
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
<script type="text/javascript">
$(function() {
	$("#mainbut").on("click",function(){
		$(location).attr("href", "<%=request.getContextPath()%>/main");
	});
});
</script>
</head>
<body>
	<div id="infodelete">
	<h1>회원탈퇴</h1>
		<div id="infodeletein">
		<div id="infodeletetalk">
			<h2>
				<center>회원 탈퇴가<br>완료 되었습니다.</center>
			</h2>
		</div>
			<div id="gomain">
				<input type="button" id="mainbut" value="main으로" class="btn btn-default"/>
			</div>
		</div>
	</div>
</body>
</html>