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
	var url6="&MobileOS=ETC&MobileApp=AppTesting&arrange=P&_type=json";
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
			if(<%=start%>==null){		
			   if(<%=pn%><=1){ 
	            }else{ 
	            $board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=1>[처음]</a>&nbsp");
	            }
	            
	            if(<%=pn%><=1){ 
	            }else{
	            	$board.append("<a href='<%=request.getContextPath() %>/festival_seasonboard?pageno=<%=pn-1 %>'>[이전]</a>&nbsp");
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
		            $board.append("<a href=<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start="+today+"&end=<%=end%>[처음]</a>");
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
<h1>축제 게시판</h1>
<div id="season">
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1"><button id="allseason">전체</button></a><br>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0101&end=<%=sdf.format(date)%>0131"><button id="jan">1월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0201&end=<%=sdf.format(date)%>0228"><button id="fab">2월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0301&end=<%=sdf.format(date)%>0331"><button id="mar">3월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0401&end=<%=sdf.format(date)%>0430"><button id="apr">4월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0501&end=<%=sdf.format(date)%>0531"><button id="may">5월</button></a><br>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0601&end=<%=sdf.format(date)%>0630"><button id="jun">6월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0701&end=<%=sdf.format(date)%>0731"><button id="jul">7월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0801&end=<%=sdf.format(date)%>0831"><button id="aug">8월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>0901&end=<%=sdf.format(date)%>0930"><button id="sep">9월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>1001&end=<%=sdf.format(date)%>1031"><button id="oct">10월</button></a><br>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>1101&end=<%=sdf.format(date)%>1130"><button id="nob">11월</button></a>
<a href="<%=request.getContextPath() %>/festival_seasonboard?pageno=1&start=<%=sdf.format(date)%>1201&end=<%=sdf.format(date)%>1231"><button id="dec">12월</button></a>
</div>
<div id="boardin">

<table id="fromServer" border="1" cellpadding="1" cellspacing="1">
     
    
    </table>
    </div>
</div>
</body>
</html>