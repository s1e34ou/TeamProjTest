<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	<%
			Object contid = request.getAttribute("contentid");
			String cont = (String)contid;
			%>
			
	var url  = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var url2 = "&contentId=<%=cont%>";	
	var url3 = "&contentTypeId=15";
	var url6 = "&MobileOS=ETC&MobileApp=AppTesting&arrange=P&_type=json";

		url = url + url2+ url3+ url6;
		var imagename;
		var originimgurl;
		$.ajax({
					url : url,
					type : "get",
					success : function(txt) {

						var item = txt["response"]["body"]["items"]["item"];
						$.each(item, function(index,data) {
							imagename = data["imagename"];
							originimgurl = data["originimgurl"];
						});
						$("#imagename").append(imagename);
						$("#originimgurl").append("<img src = "+originimgurl+">");
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
					<div id="imagename">이미지이름 : </div>	
					<div id="originimgurl">이미지 : </div>
				</div>
			</div>
		</body>
</html>