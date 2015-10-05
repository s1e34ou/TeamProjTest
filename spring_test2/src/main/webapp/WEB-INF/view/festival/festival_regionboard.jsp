<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	//var userurl = "http://localhost:9090/spring_test2/festival_regionboard";
	//var url="http://data.gb.go.kr/opendata/service/rest/standardFestival/getRecordList?serviceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D&sigunNo=9&numOfRows=1&_type=json";
	//var url="http://openapi.gwd.go.kr/openapi/service/rest/FstvlEventInfoProvdService/getFstvl?sigun=%ED%8F%89%EC%B0%BD%EA%B5%B0&ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3Ds";
	//강원도
	//var url = "http://data.daejeon.go.kr/openapi-data/service/rest/festival/festivalDaejeonService/festivalDaejeon?searchCondition=DATE&searchKeyword=2015&ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D"
	//var url="http://tour.chungnam.net/_prog/openapi/?func=tour&mode=getCnt";
	//var url="http://210.99.248.79/rest/FestivalInquiryService/getFestivalList?authApiKey=HGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D&startPage=1&pageSize=10"
	var url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var url2="&numOfRows=10";
	var url3="&pageNo=1";
	var url4="&eventStartDate=20151001";
	var url5="&eventEndDate=20151030";
	var url6="&MobileOS=ETC&MobileApp=AppTesting&arrange=P&_type=json";
	
	url = url+url2+url3+url4+url5+url6;
	//한국관광공사 api
	//var url ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=Vy4971YDIgMFmywWHmPkgSex6ENrqIJLG2VRGHEZ7geY%2BqiSR7qdr7vXoVo20mxV1xIeM49o3WYt4Fft6%2Fg9yg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json";
	$.ajax({
		url:url,
		type:"get",
		success:function(txt){
			
			var $target=$("#fromServer");
			
			var item= txt["response"]["body"]["items"]["item"];
			$.each(item,function(index,data){
				//$target.append("<li>"+"이름 : "+data["title"]+"내용 : " +data["content"]+"</li>");
				$target.append("<tr><td width=300px>"+data["title"]+"</td><td width=800px>"+data["eventstartdate"]+"~ "+data["eventenddate"]+"</td><td width=300px><img src=" +data["firstimage2"]+" width=100px height=100px></td><td>"+data["contentid"]+"</td></tr>");
				//한국관광공사 api
				//$target.append("<tr><td width=300px>"+data["title"]+"</td><td width=500px>"+ data["bgnde"]+"~"+data[endde]+"</td><td width=300px>"+data["sigun"]+"</td></tr>");
				//강원도
				//$target.append("<tr><td width=300px>"+data["name"]+"</td><td width=500px>"+ data["sday"]+"~"+data["eday"]+"</td><td width=300px>"+data["sigun"]+"</td></tr>");
				
			});
			var page=txt["response"]["pageNo"];
			$target.append(page);
			//$target.append("<li>"+JSON.stringify(txt)+"</li>");
		}
	});
});
</script>
</head>
<body>
<center>
<table id="fromServer" width=570 border="0" cellpadding="0" cellspacing="0">
     
    <tr align="center" valign="middle" bordercolor="#333333">
        <th style="font-family:Tahoma;font-size:8pt;" width="300px">
            <div align="center">제목</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="500px%">
            <div align="center">날짜</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="300px">
            <div align="center">썸네일</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="300px">
            <div align="center">id</div>
        </th>
    </tr>
    
    </table>

</body>
</html>