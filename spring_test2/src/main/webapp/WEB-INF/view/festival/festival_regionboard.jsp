<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();
		  
		  if (n.length < digits) {
		   for (i = 0; i < digits - n.length; i++)
		    zero += '0';
		  }
		  return zero + n;
		 }
		
	<%Object pagenoObj = request.getAttribute("pageno");
	int pn=1;
	if(pagenoObj!=null){
		pn = (int)pagenoObj; 
	}
	Object regionObj = request.getAttribute("region");
	String region=null;
	if(regionObj!=null){
		region=(String)regionObj;
	}
	
	%>
	var date = new Date();
    var today = date.getFullYear()+""+leadingZeros((date.getMonth()+1),2)+""+leadingZeros(date.getDate(),2);
    
	var pageblock=10;
	var block=Math.ceil(<%=pn%>/pageblock) ;
	var bstartpage=(block-1)*pageblock+1;
	var bendpage=bstartpage+pageblock-1;
	
	var url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var url2="&numOfRows=10";
	var url3="&pageNo=<%=pn%>";
	var url4="&eventStartDate="+today;
	var url5="&eventEndDate=20151030";
	var url6="&areaCode=<%=region%>";
	var url7="&MobileOS=ETC&MobileApp=AppTesting&arrange=O&_type=json";
	if(<%=regionObj%>==null){
	url = url+url2+url3+ url4+url7;
	}else{
		url = url+url2+url3+ url4+url6+url7;
	}
	//한국관광공사 api
	//var url ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=Vy4971YDIgMFmywWHmPkgSex6ENrqIJLG2VRGHEZ7geY%2BqiSR7qdr7vXoVo20mxV1xIeM49o3WYt4Fft6%2Fg9yg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json";
	$.ajax({
		url:url,
		type:"get",
		success:function(txt){
			
			var $target=$("#fromServer");
			var $board=$("#board");
			var item= txt["response"]["body"]["items"]["item"];
			$.each(item,function(index,data){
				$target.append("<tr><td rowspan=3><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+"><img src=" +data["firstimage2"]+" width=100px height=100px></a></td><td><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+">"+data["title"]+"</a></td></tr><tr><td>"+data["eventstartdate"]+"~ "+data["eventenddate"]+"</td></tr><tr><td>"+data["addr1"]+"</td></tr>");
				//한국관광공사 api
				
			});
			var numOfRows=txt["response"]["body"]["numOfRows"];
			var total=txt["response"]["body"]["totalCount"];
			var page=txt["response"]["body"]["pageNo"];
			var pnum;
			pnum=Math.ceil(total/numOfRows);
			if(region==null){		
			   if(<%=pn%><=1){ 
	            }else{ 
	            $board.append("<a href=<%=request.getContextPath() %>/festival_regionboard?pageno=1>[처음]</a>&nbsp");
	            }
	            
	            if(<%=pn%><=1){ 
	            }else{
	            	$board.append("<a href='<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn-1 %>'>[이전]</a>&nbsp");
	            } 
	            
	            if(bendpage>pnum){
					bendpage=pnum;
				}
			for(var i=bstartpage;i<=bendpage;i++){
				
				url3="&pageNo="+i;
				if(<%=pn%>==i){
					$board.append("[ "+i+" ]");
				}else{
					$board.append("<a href='<%=request.getContextPath()%>/festival_regionboard?pageno="+i+"'> ["+i+"]</a> ");
				}
			}
			   if(<%=pn%>>=pnum){ 
		            }else{ 
		            $board.append("<a href=<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn+1%>>[다음]</a>&nbsp");
		            }
		            
		            if(<%=pn%>>=pnum){ 
		            }else{
		            	$board.append("<a href=<%=request.getContextPath() %>/festival_regionboard?pageno="+pnum+">[끝]</a>&nbsp");
		            } 
			}else{		
				   if(<%=pn%><=1){ 
		            }else{ 
		            $board.append("<a href=<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=<%=region%>>[처음]</a>&nbsp");
		            }
		            
		            if(<%=pn%><=1){ 
		            }else{
		            	$board.append("<a href='<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn-1 %>&region=<%=region%>'>[이전]</a>&nbsp");
		            } 
		            
		            if(bendpage>pnum){
						bendpage=pnum;
					}
				for(var i=bstartpage;i<=bendpage;i++){
					
					url3="&pageNo="+i;
					if(<%=pn%>==i){
						$board.append("[ "+i+" ]");
					}else{
						$board.append("<a href=<%=request.getContextPath()%>/festival_regionboard?pageno="+i+"&region=<%=region%>> ["+i+"]</a> ");
					}
				}
				   if(<%=pn%>>=pnum){ 
			            }else{ 
			            $board.append("<a href=<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn+1%>&region=<%=region%>>[다음]</a>");
			            }
			            
			            if(<%=pn%>>=pnum){ 
			            }else{
			            	$board.append("<a href=<%=request.getContextPath() %>/festival_regionboard?pageno="+pnum+"&region=<%=region%>>[끝]</a>");
			            } 
				}
			//$target.append("<li>"+JSON.stringify(txt)+"</li>");
		}
	});
});
</script>
</head>
<body>
<div id="board">
<h1>축제 게시판</h1>
<div id="region">
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1"><button id="allregion">전체</button></a><br>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=1"><button id="seoul">서울</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=2"><button id="incheon">인천</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=3"><button id="daejeon">대전</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=4"><button id="daegu">대구</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=5"><button id="gwangju">광주</button></a><br>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=6"><button id="busan">부산</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=7"><button id="ulsan">울산</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=8"><button id="sejong">세종</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=31"><button id="gyeonggi">경기</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=32"><button id="gangwon">강원</button></a><br>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=33"><button id="chungbuk">충북</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=34"><button id="chungnam">충남</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=35"><button id="gyeongbuk">경북</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=36"><button id="gyeongnam">경남</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=37"><button id="jeonbuk">전북</button></a><br>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=38"><button id="jeonnam">전남</button></a>
<a href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=39"><button id="jeju">제주</button></a>
</div>
<div id="boardin">

<table id="fromServer" border="1" cellpadding="1" cellspacing="1">
     
    
    </table>
    </div>
</div>
</body>
</html>