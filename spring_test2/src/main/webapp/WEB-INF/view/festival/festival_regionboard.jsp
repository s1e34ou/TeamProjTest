<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/festivalboard.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<style type="text/css">
#fromServer{
width:900px;
display:inline-flex;
flex-wrap:wrap;
}
.sel{
margin:10px 10px;

width:400px;
}
</style>
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
	var url6="&areaCode=<%=region%>";
	var url7="&MobileOS=ETC&MobileApp=AppTesting&arrange=Q&_type=json";
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
			var $board=$("#paging");
			var item= txt["response"]["body"]["items"]["item"];
			var numOfRows=txt["response"]["body"]["numOfRows"];
			var total=txt["response"]["body"]["totalCount"];
			var page=txt["response"]["body"]["pageNo"];
			var contentid=item["contentid"];
			var firstimage2=item["firstimage2"];
			var title=item["title"];
			var eventstartdate=item["eventstartdate"];
			var eventenddate=item["eventenddate"];
			var addr1=item["addr1"];
			if(firstimage2==null){
				firstimage2="<%=request.getContextPath()%>/images/fastival2.jpg";
			}
			var pnum;
			pnum=Math.ceil(total/numOfRows);
			
			if(total%10==1&&<%=pn%>==pnum){
				$target.append("<a style='color:black; text-decoration: none;' href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+contentid+"><div onmouseover=this.style.backgroundColor='#E6E6E6' onmouseout=this.style.backgroundColor='' class=sel><table ><tr><td rowspan=3><img src=" +firstimage2+" width=100px height=100px></td><td>"+title+"</td></tr><tr><td>"+eventstartdate+"~ "+eventenddate+"</td></tr><tr><td>"+addr1+"</td></tr></table></div></a>");
			}else{
			$.each(item,function(index,data){
				contentid=data["contentid"];
				 firstimage2=data["firstimage2"];
				 title=data["title"];
				 eventstartdate=data["eventstartdate"];
				 eventenddate=data["eventenddate"];
				 addr1=data["addr1"];
				 if(firstimage2==null){
						firstimage2="<%=request.getContextPath()%>/images/fastival2.jpg";
					}
				 $target.append("<a style='color:black; text-decoration: none;' href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+contentid+"><div onmouseover=this.style.backgroundColor='#E6E6E6' onmouseout=this.style.backgroundColor='' class=sel><table ><tr><td rowspan=3><img src=" +firstimage2+" width=100px height=100px></td><td>"+title+"</td></tr><tr><td>"+eventstartdate+"~ "+eventenddate+"</td></tr><tr><td>"+addr1+"</td></tr></table></div></a>");
				//한국관광공사 api
			});
			}
		
			$("#numtext").append("게시물수 : "+total);
			if(region==null){		
			   if(<%=pn%><=1){ 
	            }else{ 
	            $board.append("<li><a href=<%=request.getContextPath() %>/festival_regionboard?pageno=1>처음</a></li>");
	            }
	            
	            if(<%=pn%><=1){ 
	            }else{
	            	$board.append("<li><a aria-lable='Previous'  href='<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn-1 %>'><span aria-hidden='true'>&laquo;</span></a></li>");
	            } 
	            
	            if(bendpage>pnum){
					bendpage=pnum;
				}
			for(var i=bstartpage;i<=bendpage;i++){
				
				url3="&pageNo="+i;
				if(<%=pn%>==i){
					$board.append("<li class='active'><a style='color: white;' href='#''>"+i+"</a></li>");
				}else{
					$board.append("<li><a href='<%=request.getContextPath()%>/festival_regionboard?pageno="+i+"'>"+i+"</a></li> ");
				}
			}
			   if(<%=pn%>>=pnum){ 
		            }else{ 
		            $board.append("<li><a aria-lable='Next'  href=<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn+1%>><span aria-hidden='true'>&raquo;</span></a></li>");
		            }
		            
		            if(<%=pn%>>=pnum){ 
		            }else{
		            	$board.append("<li><a href=<%=request.getContextPath() %>/festival_regionboard?pageno="+pnum+">끝</a></li>");
		            } 
			}else{		
				   if(<%=pn%><=1){ 
		            }else{ 
		            $board.append("<li><a href=<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=<%=region%>>처음</a></li>");
		            }
		            
		            if(<%=pn%><=1){ 
		            }else{
		            	$board.append("<li><a aria-lable='Previous' href='<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn-1 %>&region=<%=region%>'><span aria-hidden='true'>&laquo;</span></a></li>");
		            } 
		            
		            if(bendpage>pnum){
						bendpage=pnum;
					}
				for(var i=bstartpage;i<=bendpage;i++){
					
					url3="&pageNo="+i;
					if(<%=pn%>==i){
						$board.append("<li class='active'><a style='color: white;' href='#''>"+i+"</a></li>");
					}else{
						$board.append("<li><a href=<%=request.getContextPath()%>/festival_regionboard?pageno="+i+"&region=<%=region%>>"+i+"</a></li> ");
					}
				}
				   if(<%=pn%>>=pnum){ 
			            }else{ 
			            $board.append("<li><a aria-lable='Next'  href=<%=request.getContextPath() %>/festival_regionboard?pageno=<%=pn+1%>&region=<%=region%>><span aria-hidden='true'>&raquo;</span></a></li>");
			            }
			            
			            if(<%=pn%>>=pnum){ 
			            }else{
			            	$board.append("<li><a href=<%=request.getContextPath() %>/festival_regionboard?pageno="+pnum+"&region=<%=region%>>끝</a></li>");
			            } 
				}
			//$target.append("<li>"+JSON.stringify(txt)+"</li>");
		},
		error:function(xhr,status,error){
			console.log(error);
			
		}
	});
});
</script>
</head>
<body>
<div id="board">

	<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/festival_regionboard">지역별 축제</a></h1>
		<div id="boardin">
			<div id="boardinhead">
				<div id="contentnum">
					<div id="numtext">
					</div>
					<div class="dropdown" id="dropdown">
	  				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
	    			지역별 선택
	   				 <span class="caret"></span>
	 				 </button>
	  				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="region">
	  					<li role="presentation"><a role="menuitem" tabindex="-1" id="allregion" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1">전체</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="seoul"  href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=1">서울</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="incheon" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=2">인천</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="daejeon" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=3">대전</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="daegu" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=4">대구</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="gwangju" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=5">광주</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="busan" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=6">부산</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="ulsan" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=7">울산</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="sejong" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=8">세종</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="gyeonggi" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=31">경기</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="gangwon" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=32">강원</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="chungbuk" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=33">충북</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="chungnam" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=34">충남</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="gyeongbuk" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=35">경북</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="gyeongnam" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=36">경남</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jeonbuk" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=37">전북</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jeonnam" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=38">전남</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jeju" href="<%=request.getContextPath() %>/festival_regionboard?pageno=1&region=39">제주</a></li>
	 				</ul>
					</div>
				</div>
			</div>
			<div id="boardlist">
				<div id="fromServer"></div>
    		</div>
    		<div id="boardfoot">
				<div id="prevnextbar"><nav><ul class="pagination" id="paging"></ul></nav></div>
			</div>
    	</div>
</div>
</body>
</html>