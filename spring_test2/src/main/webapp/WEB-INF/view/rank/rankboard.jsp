<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="dto.Users"%>
<%@page import="service.BoardServiceImpl"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="service.BoardService"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/rankboard.css"
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
	Object loginUserObj = session.getAttribute("loginUser");
	if(loginUserObj!=null){
	String loginUser = ((Users) loginUserObj).getUsersId();
	}


	Object selectObj = request.getAttribute("select");
	String currentSelect;
	if(selectObj!=null){
		currentSelect = (String)selectObj;
	}else{
		currentSelect="EVENT_.*";
	}

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Object plist = request.getAttribute("pagelist"); 
	List<Board> pplist = (List<Board>)plist;

	%>
	var rselected;
	var ranklist="<%=request.getContextPath()%>/rankjson";
	$('input[name=optionsRadios]').on("click",function(){
		rselected = $('[name=optionsRadios]:checked').val();
	$.ajax({
		
		url:ranklist,
		type:"post",
		data:{selected:rselected,type:"<%=currentSelect%>"},
		success:function(txt){
			var $box5_2=$("#boardline");
			$box5_2.empty();
			var code;
					
					$box5_2.append("<center>"+
							"<table width=570 border=0 cellpadding=0 cellspacing=0 id=boardlist>"+
						     
						    "<tr align=center valign=middle bordercolor=#333333>"+
						        "<th style='font-family:Tahoma;font-size:15pt;' width=8% height=50 class=sline>"+
						            "<div align=center>순위</div>"+
						        "</th>"+
						        "<th style='font-family:Tahoma;font-size:15pt;' width=8% class=sline>"+
						            "<div align=center>종류</div>"+
						        "</th>"+
						        "<th style='font-family:Tahoma;font-size:15pt;' width=45% class=sline>"+
						            "<div align=center>제목</div>"+
						        "</th>"+
						        "<th style='font-family:Tahoma;font-size:15pt;' width=15% class=sline>"+
						            "<div align=center>작성자</div>"+
						        "</th>"+
						        "<th style='font-family:Tahoma;font-size:15pt;' width=17% class=sline>"+
						            "<div align=center>날짜</div>"+
						        "</th>"+
						        "<th style='font-family:Tahoma;font-size:15pt;' width=15% class=sline>"+
						            "<div align=center>조회수</div>"+
						        "</th>"+
						    "</tr>");
						    
							$.each(txt,function(index,data){

					        	
					        	
								var boardno=txt[index]["boardNo"];
								var code=txt[index]["boardCode"];
								var title=txt[index]["boardName"];
								var replycount=txt[index]["replyCount"];
								var id=txt[index]["usersUsersId"];
								var wdate=txt[index]["boardDate"];
								var hits=txt[index]["boardHits"];
								var date=new Date(wdate);
								var month=date.getMonth()+1;
								var day=date.getDate();
								var hour=date.getHours();
								var min=date.getMinutes();
								var sec=date.getSeconds();
								
								if(title.length>19){
					        		title = title.substring(0,19)+"...";
					        	}
								
								
								if(month<10){
									month="0"+(date.getMonth()+1);
								}
								if(day<10){
									day="0"+date.getDate();
								}
								if(hour<10){
									hour="0"+hour;
								}
								if(min<10){
									min="0"+min;
								}
								if(sec<10){
									sec="0"+sec;
								}
								
								
								
								if(code=="EVENT_food"){
				            		code="음식";
				            	}else if(code=="EVENT_beauty"){
				            		code="미용";
				            	}else if(code=="EVENT_culture"){
				            		code="문화";
				            	}else{
				            		code="자유";
				            	}
								if(replycount==0){
								$box5_2.append("<center>"+
										 
										
										"<table width=900 border=0 cellpadding=0 cellspacing=0 ><tr align=center valign=middle bordercolor='#333333'"+
						        "onmouseover=this.style.backgroundColor='#E6E6E6' onmouseout=this.style.backgroundColor=''>"+
						        "<td width=8% height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
						        +(index+1)+" 위"+
						        "</td>"+
						        "<td width=8% height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
						          	code+  
						        "</td>"+
						            "<td width=45% height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
						            "<a style='color: black; text-decoration: none;' href='<%=request.getContextPath()%>/rankboard_view?boardNo="+boardno+"'>"+title+
						            "</a>"+
						        "</td>    <td width=15%  height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
						        id+
						        "</td>    <td width=17%  height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
						        date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+
						        "</td>    <td width=15%  height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
						        hits+
						        "</td>"+
						      
						    "</tr></table>");
								}else{
									$box5_2.append("<center>"+
											 
											
											"<table width=900 border=0 cellpadding=0 cellspacing=0 ><tr align=center valign=middle bordercolor='#333333' "+
							        "onmouseover=this.style.backgroundColor='#E6E6E6' onmouseout=this.style.backgroundColor=''>"+
							        "<td width=8% height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
							        +(index+1)+" 위"+
							        "</td>"+
							        "<td width=8% height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
							          	code+  
							        "</td>"+
							            "<td width=45% height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
							            "<a style='color: black; text-decoration: none;' href='<%=request.getContextPath()%>/rankboard_view?boardNo="+boardno+"'>"+title+
							            
							            " ("+replycount+")"+
							            
							            "</a>"+
							        "</td>    <td width=15%  height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
							        id+
							        "</td>    <td width=17%  height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
							        date.getFullYear()+"-"+month+"-"+day+" "+hour+":"+min+":"+sec+
							        "</td>    <td width=15%  height=23 style='font-family:Tahoma;font-size:12pt;' class=line>"+
							        hits+
							        "</td>"+
							      
							    "</tr></table>");
									
								}					
							  });
							
					
					
		
					
					
					
					}
				
	});
	});
});
</script>
</head>

<body>
<div id="board">
	<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/rankboard?page=1&select=*">랭킹게시판</a></h1>
		<div id="boardin">
		<div id="boardinhead">
			<div id="contentnum">
				<div class="dropdown" id="dropdown">
  				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				    게시판 선택
				    <span class="caret"></span>
				</button>
				  	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				   	<li role="presentation"><a role="menuitem" tabindex="-1" id="all" href="<%=request.getContextPath()%>/rankboard?page=1&select=*">전체</a></li>
				  	 <li role="presentation"><a role="menuitem" tabindex="-1" id="event"  href="<%=request.getContextPath()%>/rankboard?page=1&select=EVENT_.*">이벤트</a></li>
				 	<li role="presentation"><a role="menuitem" tabindex="-1" id="free" href="<%=request.getContextPath()%>/rankboard?page=1&select=FREE">자유</a></li>
				  	 <%-- <li role="presentation"><a role="menuitem" tabindex="-1" id="culture" href="<%=request.getContextPath()%>/rankboard?page=1&select=EVENT_c.*">문화</a></li> --%>
				 	</ul>
				</div>
				<div id="likehitbtn">
					<div class="radio" id="radio1">
						<label> 
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="hit" checked> 조회수
						</label>
					</div>
					<div class="radio" id="radio2">
						<label> 
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="rec"> 추천수
						</label>
					</div>
				</div>
			</div>
			<!-- <div id="contentsearch">
				<div id="contentsearchin">
				<input type="text" name="searchtext" placeholder="키워드 검색" id="searchtext" />
				<input class="btn btn-default" type="submit" id="searchbutton" value="검색" />
				</div>
			</div> -->
		</div>
		

<div id="boardline">
<center>
<table width=570 border="0" cellpadding="0" cellspacing="0" id="boardlist">
     
    <tr align="center" valign="middle" bordercolor="#333333">
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" height="50" class="sline">
            <div align="center">순위</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" class="sline">
            <div align="center">종류</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="45%" class="sline">
            <div align="center">제목</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="15%" class="sline">
            <div align="center">작성자</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="17%" class="sline">
            <div align="center">날짜</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="15%" class="sline">
            <div align="center">조회수</div>
        </th>
    </tr>
    
    <%
        for(int i=0;i<pplist.size();i++){
        	String boardname = pplist.get(i).getBoardName();
        	if(boardname.length()>19){
        		boardname = boardname.substring(0,19)+"...";
        	}
    %>
    <tr align="center" valign="middle" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='#E6E6E6'"
        onmouseout="this.style.backgroundColor=''">
        <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%out.println(i+1);%>위
        </td>
        <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%
            	String code=pplist.get(i).getBoardCode();
            	String q;
            	if(code.equals("EVENT_food")){
            		code="음식";
            	}else if(code.equals("EVENT_beauty")){
            		code="미용";
            	}else if(code.equals("EVENT_culture")){
            		code="문화";
            	}else if(code.equals("FREE")){
            		code="자유";
            	}
            	out.println(code);
            %>
            
        </td>
            <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <a style="color: black; text-decoration: none;" href="<%=request.getContextPath()%>/rankboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%><%if(pplist.get(i).getReplyCount()>0){ %> (<%=pplist.get(i).getReplyCount()%>)<%}%></a>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getUsersUsersId()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=sdf.format(pplist.get(i).getBoardDate())%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardHits()%>
        </td>
      
    </tr>
    <%} %>
    
    

    
</table>
</div>
<div id="footmargin"></div>
</div>
</div>
</body>


