<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#carousel-example-generic{
	width:500px;
}

#box1{
	display:inline-flex;
}
</style>
<link href="<%=request.getContextPath()%>/style/festivalboard_view.css"
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
	
<script type="text/javascript" 
    src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=9965e9a6e40988eea1a1300dc3b93b71"></script>
<script type="text/javascript">

$(function() {
	<%
			Object contid = request.getAttribute("contentid");
			String cont = (String)contid;
			%>
			
			
		
	var image  = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D&imageYN=Y";
	var content = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var detail="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D&defaultYN=Y&overviewYN=Y&mapinfoYN=Y";
	var detailintro="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D&introYN=Y";
	
	var url2 = "&contentId=<%=cont%>";	
	var url3 = "&contentTypeId=15";
	var url6 = "&MobileOS=ETC&MobileApp=AppTesting&arrange=P&_type=json";
		
		image = image + url2+ url3+ url6;
		content= content + url2+ url3+ url6;
		detail= detail+ url2+  url6;
		detailintro=detailintro+url2+ url3+ url6;
		 var originimgurl=new Array();
		var smallimageurl=new Array(); 
		
		var homepage;
		var tel;
		var telname;
		var title;
		var overview;
		
		var detailcon=new Array();
		var agelimit;
		var bookingplace;
		var discountinfofestival;
		var eventplace;
		var placeinfo;
		var playtime;
		var program;
		var spendtimefestival;
		var sponsor1;
		var sponsor1tel;
		var sponsor2;
		var sponsor2tel;
		var subevent;
		var usetimefestival;
		var mapx;
		var mapy;
		
	
		
		$.ajax({
			url : detail,
			type : "get",
			success : function(txt) {

				var item = txt["response"]["body"]["items"]["item"];
					homepage = item["homepage"];
					tel = item["tel"];
					telname = item["telname"];
					title = item["title"];
					overview = item["overview"];
					mapx = item["mapx"];
					mapy= item["mapy"];
				
				if(homepage!=undefined){					
				$("#homepage").append("<h4>홈페이지 </h4>"+homepage);
				}
				if(tel!=undefined){
				$("#tel").append("<h4>문의</h4>"+tel);
				}
				$("#boardin").prepend("<h2>"+title+"</h2>");
				if(overview!=undefined){
				$("#overview").append("<h3>행사소개</h3>"+overview+"<br>");
				}
				//$("#title").append("<li>"+JSON.stringify(txt)+"</li>");
			}
			
			
		});

		
		$.ajax({
			url : image,
			type : "get",
			success : function(txt) {

				var item = txt["response"]["body"]["items"]["item"];
				 
				
				if((txt["response"]["body"]["items"])!=""){ 
				$.each(item, function(index,data) {
					originimgurl[index] = data["originimgurl"];
					smallimageurl[index] = data["smallimageurl"];
					 
					if(originimgurl!=null||originimgurl!=undefined){
						if(index==0){
						$(".carousel-indicators").append("<li data-target='#carousel-example-generic' data-slide-to="+index+" class='active'></li>")
						$(".carousel-inner").append("<div class='item active'><img src="+originimgurl[index]+"></div>");
						}
						else{
							$(".carousel-indicators").append("<li data-target='#carousel-example-generic' data-slide-to="+index+"></li>")
							$(".carousel-inner").append("<div class='item'><img src="+originimgurl[index]+"></div>");
						}
					}else{
						
						$("#smallimageurl").append("<img src="+smallimageurl[index]+">");	
					}
				});
				}else{
					$("#boardhead").empty();
					$("#boardhead").append("<div ><img src=<%=request.getContextPath()%>/images/fastival.jpg></div>");
				}
			}					
								
				
			
		
		});
		$.ajax({
			url : detailintro,
			type : "get",
			success : function(txt) {

				var item = txt["response"]["body"]["items"]["item"];
				agelimit = item["agelimit"];
				bookingplace = item["bookingplace"];
				discountinfofestival = item["discountinfofestival"];
				eventplace = item["eventplace"];
				placeinfo = item["placeinfo"];
				playtime = item["playtime"];
				program = item["program"];
				spendtimefestival = item["spendtimefestival"];
				sponsor1 = item["sponsor1"];
				sponsor1tel = item["sponsor1tel"];
				sponsor2 = item["sponsor2"];
				sponsor2tel = item["sponsor2tel"];
				subevent= item["subevent"];
				usetimefestival= item["usetimefestival"];
				
				if(agelimit!=""&&agelimit!=null&&agelimit!=undefined){
					$("#agelimit").append("<h4>관람 가능 연령</h4><h5>"+agelimit+"</h5><br>");		
				}
				
				if(bookingplace!=""&&bookingplace!=null&&bookingplace!=undefined){
					$("#bookingplace").append("<h4>예매처</h4><h5> "+bookingplace+"</h5><br>");		
				}
				
				if(discountinfofestival!=""&&discountinfofestival!=null&&discountinfofestival!=undefined){
					$("#discountinfofestival").append("<h4>할인정보</h4><h5> "+discountinfofestival+"</h5><br>");		
				}
				
				if(eventplace!=""&&eventplace!=null&&eventplace!=undefined){
					$("#eventplace").append("<h4>행사 장소</h4><h5> "+eventplace+"</h5><br><div id=map style='width:500px; height:500px;'></div>");
					if(mapx!=null){
					 var oSeoulCityPoint = new nhn.api.map.LatLng(mapy, mapx);
		                var defaultLevel = 11;
		                var oMap = new nhn.api.map.Map(document.getElementById('map'), { 
		                                                point : oSeoulCityPoint,
		                                                zoom : defaultLevel,
		                                                enableWheelZoom : true,
		                                                enableDragPan : true,
		                                                enableDblClickZoom : false,
		                                                mapMode : 0,
		                                                activateTrafficMap : false,
		                                                activateBicycleMap : false,
		                                                minMaxLevel : [ 1, 14 ],
		                                                size : new nhn.api.map.Size(500, 500)           });
		                var oSlider = new nhn.api.map.ZoomControl();
		                oMap.addControl(oSlider);
		                oSlider.setPosition({
		                        top : 10,
		                        left : 10
		                });

		                var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
		                oMap.addControl(oMapTypeBtn);
		                oMapTypeBtn.setPosition({
		                        bottom : 10,
		                        right : 80
		                });
		                
		                var oThemeMapBtn = new nhn.api.map.ThemeMapBtn();
		                oThemeMapBtn.setPosition({
		                        bottom : 10,
		                        right : 10
		                });
		                oMap.addControl(oThemeMapBtn);

		                var oBicycleGuide = new nhn.api.map.BicycleGuide(); // - 자전거 범례 선언
		                oBicycleGuide.setPosition({
		                        top : 10,
		                        right : 10
		                }); // - 자전거 범례 위치 지정
		                oMap.addControl(oBicycleGuide);// - 자전거 범례를 지도에 추가.

		                var oTrafficGuide = new nhn.api.map.TrafficGuide(); // - 교통 범례 선언
		                oTrafficGuide.setPosition({
		                        bottom : 30,
		                        left : 10
		                });  // - 교통 범례 위치 지정.
		                oMap.addControl(oTrafficGuide); // - 교통 범례를 지도에 추가.

		                var trafficButton = new nhn.api.map.TrafficMapBtn(); // - 실시간 교통지도 버튼 선언
		                trafficButton.setPosition({
		                        bottom:10, 
		                        right:150
		                }); // - 실시간 교통지도 버튼 위치 지정
		                oMap.addControl(trafficButton);

		                var oSize = new nhn.api.map.Size(28, 37);
		                var oOffset = new nhn.api.map.Size(14, 37);
		                var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

		                var oInfoWnd = new nhn.api.map.InfoWindow();
		                oInfoWnd.setVisible(false);
		                oMap.addOverlay(oInfoWnd);

		                oInfoWnd.setPosition({
		                        top : 20,
		                        left :20
		                });

		                var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
		                oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.

		                oInfoWnd.attach('changeVisible', function(oCustomEvent) {
		                        if (oCustomEvent.visible) {
		                                oLabel.setVisible(false);
		                        }
		                });
		                
		                var oPolyline = new nhn.api.map.Polyline([], {
		                        strokeColor : '#f00', // - 선의 색깔
		                        strokeWidth : 5, // - 선의 두께
		                        strokeOpacity : 0.5 // - 선의 투명도
		                }); // - polyline 선언, 첫번째 인자는 선이 그려질 점의 위치. 현재는 없음.
		                oMap.addOverlay(oPolyline); // - 지도에 선을 추가함.

		                
		                var oarker= new nhn.api.map.Marker(oIcon,{title:"이곳"});
		                var omPoint1 = new nhn.api.map.LatLng(mapy,mapx);

		                oarker.setPoint(omPoint1);
		                oMap.addOverlay(oarker);
		                
		                oMap.attach('mouseenter', function(oCustomEvent) {

		                        var oTarget = oCustomEvent.target;
		                        // 마커위에 마우스 올라간거면
		                        if (oTarget instanceof nhn.api.map.Marker) {
		                                var oMarker = oTarget;
		                                oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
		                        }
		                });

		                oMap.attach('mouseleave', function(oCustomEvent) {

		                        var oTarget = oCustomEvent.target;
		                        // 마커위에서 마우스 나간거면
		                        if (oTarget instanceof nhn.api.map.Marker) {
		                                oLabel.setVisible(false);
		                        }
		                });

					
					
					}
				}
				
				if(placeinfo!=""&&placeinfo!=null&&placeinfo!=undefined){
					$("#placeinfo").append("<h4>오시는 길 </h4><h5> "+placeinfo+"</h5><br>");		
				}
				
				if(playtime!=""&&playtime!=null&&playtime!=undefined){
					$("#playtime").append("<h4>행사 시간</h4><h5> "+playtime+"</h5><br>");		
				}
				
				if(program!=""&&program!=null&&program!=undefined){
					$("#program").append("<h4>행사 프로그램 </h4><h5>"+program+"</h5><br>");		
				}
				
				if(spendtimefestival!=""&&spendtimefestival!=null&&spendtimefestival!=undefined){
					$("#spendtimefestival").append("<h4>관람 소요 시간</h4><h5>"+spendtimefestival+"</h5><br>");		
				}
				
				if(sponsor1!=""&&sponsor1!=null&&sponsor1!=undefined){
					$("#sponsor1").append("<h4>주최자</h4><h5>"+sponsor1+"</h5><br>");		
				}
				if(sponsor1tel!=""&&sponsor1tel!=null&&sponsor1tel!=undefined){
					$("#sponsor1tel").append("<h4>주최자 연락처</h4><h5>"+sponsor1tel+"</h5><br>");		
				}
				if(sponsor2!=""&&sponsor2!=null&&sponsor2!=undefined){
					$("#sponsor2").append("<h4>주관사</h4><h5>"+sponsor2+"</h5><br>");		
				}
				if(sponsor2tel!=""&&sponsor2tel!=null&&sponsor2tel!=undefined){
					$("#sponsor2tel").append("<h4>주관사 연락처</h4><h5>"+sponsor2tel+"</h5><br>");		
				}
				if(subevent!=""&&subevent!=null&&subevent!=undefined){
					$("#subevent").append("<h4>부대행사</h4><h5>"+subevent+"</h5><br>");		
				}	
				if(usetimefestival!=""&&usetimefestival!=null&&usetimefestival!=undefined){
					$("#usetimefestival").append("<h4>이용요금</h4><h5>"+usetimefestival+"</h5><br>");		
				}
				
				
				
				
				for(var i=0;i<14;i++){
					if(detailcon[i]!=""&&detailcon[i]!=null&&detailcon[i]!=undefined){
						$("#detailcon").append(detailcon[i]+"<br>");		
					}
				}
				//$("#detailcon").append("<li>"+JSON.stringify(txt)+"</li>");
			}
			
			
		});
		var infoname
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
						if(infotext!=undefined){
							$("#infotext").append("<h3>"+infoname+"</h3>"+"<br>"+infotext);
							}
					//	$target.append("<li>"+JSON.stringify(txt)+"</li>");
					}
				});
		
		$("#back").on("click",function(e){
			history.go(-1);
		
		});
		
		 
	});
	
	
</script>
</head>
<body>
	<div id="board">
		<h1>축제게시판</h1>
		<div id="boardin">
			<div id="boardhead">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
				</a> 
				<a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
				</a>
				</div>
			</div>
			<div id="boardmid">
				<div id="midh">
					<div id="homepage"></div>
					<div id="tel"></div>
				</div>
				<div id="midf">
					<div id="overview"></div>
					<div id="infotext"></div>
					<div id="detailcon"><h3>상세정보</h3>
						<div id="agelimit"></div>
						<div id="bookingplace"></div>
						<div id="discountinfofestival"></div>
						<div id="eventplace"></div>
						<div id="placeinfo"></div>
						<div id="playtime"></div>
						<div id="program"></div>
						<div id="spendtimefestival"></div>
						<div id="sponsor1"></div>
						<div id="sponsor1tel"></div>
						<div id="sponsor2"></div>
						<div id="sponsor2tel"></div>
						<div id="subevent"></div>
						<div id="usetimefestival"></div>
						
						
</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<div id="replyboard">
			<h2>댓글</h2>
			<div id="replyboardin"></div>
		</div> -->
		<div id="boardfoot">
			<button id="back">뒤로</button>
		</div>
	</div>
</body>
</html>