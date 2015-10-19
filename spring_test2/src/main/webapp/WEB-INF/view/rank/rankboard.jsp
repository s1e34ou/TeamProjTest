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
</head>

<body>
<div id="board">
	<h1>랭킹게시판</h1>
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
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> 조회수
						</label>
					</div>
					<div class="radio" id="radio2">
						<label> 
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"> 추천수
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


Object plist = request.getAttribute("pagelist"); 
List<Board> pplist = (List<Board>)plist;

%>

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
    %>
    <tr align="center" valign="middle" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='F8F8F8'"
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
            <a style="color: black" href="<%=request.getContextPath()%>/rankboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%><%if(pplist.get(i).getReplyCount()>0){ %> (<%=pplist.get(i).getReplyCount()%>)<%}%></a>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getUsersUsersId()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardDate()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardHits()%>
        </td>
      
    </tr>
    <%} %>
    
    

    
</table>
<div id="footmargin"></div>
</div>
</div>
</body>


