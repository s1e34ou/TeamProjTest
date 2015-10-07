<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/board.css"
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
	<%
			Object contid = request.getAttribute("contentid");
			String cont = (String)contid;
			%>
	var image  = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D&imageYN=Y";
	var content = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var url;  
	var url2 = "&contentId=<%=cont%>";	
	var url3 = "&contentTypeId=15";
	var url6 = "&MobileOS=ETC&MobileApp=AppTesting&arrange=P&_type=json";
		
		image = image + url2+ url3+ url6;
		content= content + url2+ url3+ url6;
		var originimgurl;
		var smallimageurl;
		$.ajax({
			url : image,
			type : "get",
			success : function(txt) {

				var item = txt["response"]["body"]["items"]["item"];
				$.each(item, function(index,data) {
					originimgurl = data["originimgurl"];
					smallimageurl = data["smallimageurl"];
					if(originimgurl!=null||originimgurl!=undefined){
						$("#originimgurl").append("<img src="+originimgurl+">");		
					}else{
						
						$("#smallimageurl").append("<img src="+smallimageurl+">");	
					}
				});
				
				
				//$("#infotext").append("<li>"+JSON.stringify(txt)+"</li>");
			}
		});
		
		var infoname;
		var infotext;
		$.ajax({
					url : content,
					type : "get",
					success : function(txt) {

						var item = txt["response"]["body"]["items"]["item"];
						$.each(item, function(index,data) {
							infoname = data["infoname"];
							infotext = data["infotext"];
						});
						$("#infoname").append(infoname);
						$("#infotext").append(infotext);
						
						//$target.append("<li>"+JSON.stringify(txt)+"</li>");
					}
				});
	});
</script>
</head>
<body>
	<center>
		<body>
			<div id="board">
				<h1>축제게시판</h1>
				<div id="boardin">
					<div id="originimgurl"></div>
					<div id="smallimageurl"></div>		
					<div id="infoname">제목 : </div>	
					<div id="infotext">내용 : </div>	
				</div>
			</div>
		</body>
</html>