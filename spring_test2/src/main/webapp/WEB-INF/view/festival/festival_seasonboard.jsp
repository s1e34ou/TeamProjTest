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

	<% Object pagenoObj = request.getAttribute("pageno");
	int pn=1;
	
	if(pagenoObj!=null){
		pn = (int)pagenoObj; 
	}
	Object startObj = request.getAttribute("start");
	String start=null;
	if(startObj!=null){
		start=(String)startObj;
	}
	Object endObj = request.getAttribute("end");
	String end=null;
	if(endObj!=null){
		end=(String)endObj;
	}
	
	%>
	var date = new Date();
	var today;
	if(<%=startObj%>!=null){
		today=<%=start%>;	
	}else{
    today = date.getFullYear()+""+leadingZeros((date.getMonth()+1),2)+""+leadingZeros(date.getDate(),2);
	}
    <%Date date=new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    
    %>
	var pageblock=10;
	var block=Math.ceil(<%=pn%>/pageblock) ;
	var bstartpage=(block-1)*pageblock+1;
	var bendpage=bstartpage+pageblock-1;
	
	var url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var url2="&numOfRows=10";
	var url3="&pageNo=<%=pn%>";
	var url4="&eventStartDate="+today;
	var url5="&eventEndDate=<%=end%>";
	var url6="&MobileOS=ETC&MobileApp=AppTesting&arrange=Q&_type=json";
	if(<%=startObj%>==null){
	url = url+url2+url3+url4+url6;
	}else{
		url = url+url2+url3+url4+url5+url6;
	}
	$.ajax({
		url:url,
		type:"get",
		success:function(txt){
			
			var $target=$("#fromServer");
			var $board=$("#prevnextbar");
			var item= txt["response"]["body"]["items"]["item"];
			var numOfRows=txt["response"]["body"]["numOfRows"];
			var total=txt["response"]["body"]["totalCount"];
			var page=txt["response"]["body"]["pageNo"];
			var pnum;
			pnum=Math.ceil(total/numOfRows);
			
			if(total%10==1&&<%=pn%>==pnum){
				$target.append("<div class=sel><table><tr><td rowspan=3><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+item["contentid"]+"><img src=" +item["firstimage2"]+" width=100px height=100px></a></td><td><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+item["contentid"]+">"+item["title"]+"</a></td></tr><tr><td>"+item["eventstartdate"]+"~ "+item["eventenddate"]+"</td></tr><tr><td>"+item["addr1"]+"</td></tr></table></div>");
			}else{
			$.each(item,function(index,data){
				$target.append("<div class=sel><table><tr><td rowspan=3><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+"><img src=" +data["firstimage2"]+" width=100px height=100px></a></td><td><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+">"+data["title"]+"</a></td></tr><tr><td>"+data["eventstartdate"]+"~ "+data["eventenddate"]+"</td></tr><tr><td>"+data["addr1"]+"</td></tr></table></div>");
				//한국관광공사 api
				
			});
			}
			$("#numtext").append("게시물수 : "+total);
			
			
			if(<%=start%>==null){		
			   if(<%=pn%><=1){ 
	            }else{ 
	            $board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=1>[처음]</a>");
	            }
	            
	            if(<%=pn%><=1){ 
	            }else{
	            	$board.append("<a href='<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn-1 %>'>[이전]</a>");
	            } 
	            
	            if(bendpage>pnum){
					bendpage=pnum;
				}
			for(var i=bstartpage;i<=bendpage;i++){
				
				url3="&pageNo="+i;
				if(<%=pn%>==i){
					$board.append("[ "+i+" ]");
				}else{
					$board.append("<a href='<%=request.getContextPath()%>/festival_seasonboard?pageno="+i+"'> ["+i+"]</a> ");
				}
			}
			   if(<%=pn%>>=pnum){ 
		            }else{ 
		            $board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn+1%>>[다음]</a>");
		            }
		            
		            if(<%=pn%>>=pnum){ 
		            }else{
		            	$board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno="+pnum+">[끝]</a>");
		            } 
			}else{		
				   if(<%=pn%><=1){ 
		            }else{ 
		            $board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start="+today+"&end=<%=end%>>[처음]</a>");
		            }
		            
		            if(<%=pn%><=1){ 
		            }else{
		            	$board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn-1 %>&start="+today+"&end=<%=end%>>[이전]</a>");
		            } 
		            
		            if(bendpage>pnum){
						bendpage=pnum;
					}
				for(var i=bstartpage;i<=bendpage;i++){
					
					url3="&pageNo="+i;
					if(<%=pn%>==i){
						$board.append("[ "+i+" ]");
					}else{
						$board.append("<a href=<%=request.getContextPath()%>/festival_seasonboard?pageno="+i+"&start="+today+"&end=<%=end%>> ["+i+"]</a> ");
					}
				}
				   if(<%=pn%>>=pnum){ 
			            }else{ 
			            $board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn+1%>&start="+today+"&end=<%=end%>>[다음]</a>");
			            }
			            
			            if(<%=pn%>>=pnum){ 
			            }else{
			            	$board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno="+pnum+"&start="+today+"&end=<%=end%>>[끝]</a>");
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
	<h1>월별 축제</h1>
		<div id="boardin">
			<div id="boardinhead">
				<div id="contentnum">
					<div id="numtext">
					</div>
					<div class="dropdown" id="dropdown">
	  				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
	    			월별 선택
	   				 <span class="caret"></span>
	 				 </button>
	 				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="season">
	  					<li role="presentation"><a role="menuitem" tabindex="-1" id="allseason" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1">전체</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jan"  href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0101&end=<%=sdf.format(date)%>0131">1월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="fab" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0201&end=<%=sdf.format(date)%>0228">2월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="mar" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0301&end=<%=sdf.format(date)%>0331">3월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="apr" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0401&end=<%=sdf.format(date)%>0430">4월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="may" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0501&end=<%=sdf.format(date)%>0531">5월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jun" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0601&end=<%=sdf.format(date)%>0630">6월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jul" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0701&end=<%=sdf.format(date)%>0731">7월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="aug" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0801&end=<%=sdf.format(date)%>0831">8월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="sep" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0901&end=<%=sdf.format(date)%>0930">9월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="oct" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>1001&end=<%=sdf.format(date)%>1031">10월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="nob" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>1101&end=<%=sdf.format(date)%>1130">11월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="dec" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>1201&end=<%=sdf.format(date)%>1231">12월</a></li>
	 				</ul>
	 				</div>
	 				<div id="month"></div>
	 			</div>
	 			<div id="contentsearch">
					<div id="contentsearchin">
					<input type="text" name="searchtext" placeholder="키워드 검색" id="searchtext" />
					<input class="btn btn-default" type="submit" id="searchbutton" value="검색" />
					</div>
				</div>
			</div>
			<div id="boardlist">
				<div id="fromServer"></div>
			</div>
			<div id="boardfoot">
				<div id="prevnextbar"></div>
			</div>
    	</div>
</div>
</body>
</html>