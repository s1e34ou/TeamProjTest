<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/introduction.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
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
	<div id="fastivalintro">
	<h1>Fastival Information</h1>
		<div id="fastivalintroin">
			<div id="fastivalintrotalk">
				<center><h1>Fastival</h1>
				<br>
				<h2>Fast + Festival의 합성어</h2>
				</center>
			</div>
			<div id="fastivalpicbox">
			<img src="<%=request.getContextPath()%>/images/fast_festival.png" id="fastivalpic">
			</div>
			<div id="gomain">
				<input type="button" id="mainbut" value="main으로" class="btn btn-default"/>
			</div>
		</div>
	</div>
</body>
</html>