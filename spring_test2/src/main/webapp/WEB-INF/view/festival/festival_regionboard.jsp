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
	
	<%Object pagenoObj = request.getAttribute("pageno");
	int pn=1;
	if(pagenoObj!=null){
		pn = (int)pagenoObj; 
	}
	%>
	
	var pageblock=10;
	var block=Math.ceil(<%=pn%>/pageblock) ;
	var bstartpage=(block-1)*pageblock+1;
	console.log(block);
	var bendpage=bstartpage+pageblock-1;
	
	var url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=hqSFyMrMnkcgyqbBzDDaGYqeYOXRLBJbiNPu%2B6xLBOaOgrm3fJGIKuCRi5BIMHHGsejSK82dSwlS%2Bnr4%2FPWfkQ%3D%3D";
	var url2="&numOfRows=10";
	var url3="&pageNo=<%=pn%>";
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
			var $board=$("#board");
			var item= txt["response"]["body"]["items"]["item"];
			$.each(item,function(index,data){
				//$target.append("<li>"+"이름 : "+data["title"]+"내용 : " +data["content"]+"</li>");
				$target.append("<tr><td rowspan=2><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+"><img src=" +data["firstimage2"]+" width=100px height=100px></a></td><td><a href=<%=request.getContextPath()%>/festival_regionboard_view?contentid="+data["contentid"]+">"+data["title"]+"</a></td></tr><tr><td>"+data["eventstartdate"]+"~ "+data["eventenddate"]+"</td></tr>");
				//한국관광공사 api
				//$target.append("<tr><td width=300px>"+data["title"]+"</td><td width=500px>"+ data["bgnde"]+"~"+data[endde]+"</td><td width=300px>"+data["sigun"]+"</td></tr>");
				//강원도
				//$target.append("<tr><td width=300px>"+data["name"]+"</td><td width=500px>"+ data["sday"]+"~"+data["eday"]+"</td><td width=300px>"+data["sigun"]+"</td></tr>");
				
			});
			var numOfRows=txt["response"]["body"]["numOfRows"];
			var total=txt["response"]["body"]["totalCount"];
			var page=txt["response"]["body"]["pageNo"];
			var pnum;
			pnum=Math.ceil(total/numOfRows);
		
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
			//$target.append("<li>"+JSON.stringify(txt)+"</li>");
		}
	});
});
</script>
</head>
<body>
<div id="board">
<h1>축제 게시판</h1>
<div id="boardin">
<table id="fromServer" border="1" cellpadding="1" cellspacing="1">
     
    
    </table>
    </div>
</div>
</body>
</html>