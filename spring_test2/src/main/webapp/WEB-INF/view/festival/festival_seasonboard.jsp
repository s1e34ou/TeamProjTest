<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.lang.Integer" %>
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
    today = date.getFullYear()+leadingZeros((date.getMonth()+1),2)+leadingZeros(date.getDate(),2);
	}
    <%Date date=new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    String datee = sdf.format(date);
    int f=Integer.parseInt(datee);
    SimpleDateFormat ee= new SimpleDateFormat("yyyyMMdd");
    SimpleDateFormat dd= new SimpleDateFormat("MM");
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
			//$target.append("<li>"+JSON.stringify(txt)+"</li>");
			var pnum;
			pnum=Math.ceil(total/numOfRows);
			
			if(total%10==1&&<%=pn%>==pnum){
				$target.append("<a style='color:black; text-decoration: none;' href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+contentid+"><div onmouseover=this.style.backgroundColor='#E6E6E6' onmouseout=this.style.backgroundColor='' class=sel><table><tr><td rowspan=3><img src=" +firstimage2+" width=100px height=100px></td><td>"+title+"</td></tr><tr><td>"+eventstartdate+"~ "+eventenddate+"</td></tr><tr><td>"+addr1+"</td></tr></table></div></a>");
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
				$target.append("<a style='color:black; text-decoration: none;' href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+contentid+"><div onmouseover=this.style.backgroundColor='#E6E6E6' onmouseout=this.style.backgroundColor='' class=sel><table><tr><td rowspan=3><img src=" +firstimage2+" width=100px height=100px></td><td>"+title+"</td></tr><tr><td>"+eventstartdate+"~ "+eventenddate+"</td></tr><tr><td>"+addr1+"</td></tr></table></div></a>");
				//한국관광공사 api
				
			});
			}
			$("#numtext").append("게시물수 : "+total);
			
			
			if(<%=start%>==null){		
			   if(<%=pn%><=1){ 
	            }else{ 
	            $board.append("<li><a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=1>처음</a></li>");
	            }
	            
	            if(<%=pn%><=1){ 
	            }else{
	            	$board.append("<li><a aria-lable='Previous' href='<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn-1 %>'><span aria-hidden='true'>&laquo;</span></a></li>");
	            } 
	            
	            if(bendpage>pnum){
					bendpage=pnum;
				}
			for(var i=bstartpage;i<=bendpage;i++){
				
				url3="&pageNo="+i;
				if(<%=pn%>==i){
					$board.append("<li class='active'><a style='color: white;' href='#''>"+i+"</a></li>");
				}else{
					$board.append("<li><a href='<%=request.getContextPath()%>/festival_seasonboard?pageno="+i+"'>"+i+"</a></li> ");
				}
			}
			   if(<%=pn%>>=pnum){ 
		            }else{ 
		            $board.append("<li><a aria-lable='Next' href=<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn+1%>><span aria-hidden='true'>&raquo;</span></a></li>");
		            }
		            
		            if(<%=pn%>>=pnum){ 
		            }else{
		            	$board.append("<li><a href=<%=request.getContextPath() %>/festival_seasonboard?pageno="+pnum+">끝</a></li>");
		            } 
			}else{		
				   if(<%=pn%><=1){ 
		            }else{ 
		            $board.append("<li><a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start="+today+"&end=<%=end%>>처음</a></li>");
		            }
		            
		            if(<%=pn%><=1){ 
		            }else{
		            	$board.append("<li><a aria-lable='Previous' href=<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn-1 %>&start="+today+"&end=<%=end%>><span aria-hidden='true'>&laquo;</span></a></li>");
		            } 
		            
		            if(bendpage>pnum){
						bendpage=pnum;
					}
				for(var i=bstartpage;i<=bendpage;i++){
					
					url3="&pageNo="+i;
					if(<%=pn%>==i){
						$board.append("<li class='active'><a style='color: white;' href='#''>"+i+"</a></li>");
					}else{
						$board.append("<li><a href=<%=request.getContextPath()%>/festival_seasonboard?pageno="+i+"&start="+today+"&end=<%=end%>>"+i+"</a></li> ");
					}
				}
				   if(<%=pn%>>=pnum){ 
			            }else{ 
			            $board.append("<li><a aria-lable='Next' href=<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn+1%>&start="+today+"&end=<%=end%>><span aria-hidden='true'>&raquo;</span></a></li>");
			            }
			            
			            if(<%=pn%>>=pnum){ 
			            }else{
			            	$board.append("<li><a href=<%=request.getContextPath() %>/festival_seasonboard?pageno="+pnum+"&start="+today+"&end=<%=end%>>끝</a></li>");
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
	<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/festival_seasonboard">월별 축제</a></h1>
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
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jan"  href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0101&end=<%=datee%>%>0131">1월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="fab" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0201&end=<%=datee%>0228">2월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="mar" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0301&end=<%=datee%>0331">3월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="apr" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0401&end=<%=datee%>0430">4월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="may" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0501&end=<%=datee%>0531">5월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jun" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0601&end=<%=datee%>0630">6월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="jul" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0701&end=<%=datee%>0731">7월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="aug" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0801&end=<%=datee%>0831">8월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="sep" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>0901&end=<%=datee%>0930">9월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="oct" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>1001&end=<%=datee%>1031">10월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="nob" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>1101&end=<%=datee%>1130">11월</a></li>
	   					<li role="presentation"><a role="menuitem" tabindex="-1" id="dec" href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=datee%>1201&end=<%=datee%>1231">12월</a></li>
	 				</ul>
	 				</div>
	 				<div id="month"></div>
	 			</div>
			</div>
			<div id="boardlist">
				<div id="fromServer"></div>
			</div>
			<div id="boardfoot">
				<div id="prevnextbar">
				<nav><ul class="pagination" id="paging"></ul></nav>
				</div>
			</div>
    	</div>
</div>
</body>
</html>