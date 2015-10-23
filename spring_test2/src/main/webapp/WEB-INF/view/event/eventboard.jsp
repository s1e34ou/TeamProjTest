<%@page import="java.text.SimpleDateFormat"%>
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
<link href="<%=request.getContextPath()%>/style/eventboard.css"
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
	<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*">이벤트게시판</a></h1>
		<div id="boardin">
		<div id="boardinhead">
			<div id="contentnum">
				<div id="numtext">
				게시물수 : <%=request.getAttribute("count") %></div>
				<div class="dropdown" id="dropdown">
  				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    			카테고리 선택
   				 <span class="caret"></span>
 				 </button>
  				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
  				 <li role="presentation"><a role="menuitem" tabindex="-1" id="all" href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_.*">전체</a></li>
   				 <li role="presentation"><a role="menuitem" tabindex="-1" id="food"  href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_f.*">음식</a></li>
   				 <li role="presentation"><a role="menuitem" tabindex="-1" id="beauty" href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_b.*">미용</a></li>
   				 <li role="presentation"><a role="menuitem" tabindex="-1" id="culture" href="<%=request.getContextPath()%>/eventboard?page=1&select=EVENT_c.*">문화</a></li>
 				 </ul>
				</div>
			</div>
			<div id="contentsearch">
				<div id="contentsearchin">
				<form action="<%=request.getContextPath()%>/search" method="get">
					<input id="se" name="se" type="hidden" value="event">
					<input id="page" name="page" type="hidden" value="1"> 
					<input type="text" name="select" placeholder="키워드 검색" id="select" />
					<input class="btn btn-default" type="submit" id="searchbutton" value="검색" />
				</form>
				</div>
			</div>
		</div>
<%
Object loginUserObj = session.getAttribute("loginUser");
if(loginUserObj!=null){
String loginUser = ((Users) loginUserObj).getUsersId();
}
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

Object currentPageObj= request.getAttribute("page");
int currentPage;
if(currentPageObj!=null){
	 currentPage = (int)currentPageObj;
}else{
	 currentPage = 1;
}
int pnum;
int pageblock=20;
int block=(int)Math.ceil((double)currentPage/pageblock);
int bstartpage=(block-1)*pageblock+1;
int bendpage=bstartpage+pageblock-1;
Object selectObj = request.getAttribute("select");
String currentSelect;
if(selectObj!=null){
	currentSelect = (String)selectObj;
}else{
	currentSelect="EVENT_.*";
}

Object blist = request.getAttribute("boardlist"); 
List<Board> list = (List<Board>)blist;

Object plist = request.getAttribute("pagelist"); 
List<Board> pplist = (List<Board>)plist;

pnum = (int) Math.ceil((double) list.size() / BoardDao.BOARD_PER_PAGE);
%>
<center>
<table width=570 border="0" cellpadding="0" cellspacing="0" id="boardlist">
     
    <tr align="center" valign="middle" bordercolor="#333333">
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" height="50" class="sline">
            <div align="center">번호</div>
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
            <%=pplist.get(i).getBoardNo()%>
        </td>
        <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%
            	String code=pplist.get(i).getBoardCode();
            	String q;
            	if(code.equals("EVENT_food")){
            		code="음식";
            	}else if(code.equals("EVENT_beauty")){
            		code="미용";
            	}else{
            		code="문화";
            	}
            	out.println(code);
            %>
            
        </td>
            <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <a style="color: black; text-decoration: none;" href="<%=request.getContextPath()%>/eventboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%><%if(pplist.get(i).getReplyCount()>0){ %> (<%=pplist.get(i).getReplyCount()%>)<%}%></a>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getUsersUsersId()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=sdf.format(pplist.get(i).getBoardDate())%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardHits()%>
        </td>
      
    </tr>
    <%} %>
     <tr align=center height=100>
        <td colspan=7 style=font-family:Tahoma;font-size:11pt;>
            <nav>
            <ul class="pagination">
            <%if(currentPage<=1){ %>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/eventboard?page=1&select=<%=currentSelect%>">처음</a></li>
            <%} %>
            
            <%if(currentPage<=1){ %>
            <%}else{ %>
             <li><a aria-lable="Previous" href="<%=request.getContextPath() %>/eventboard?page=<%=currentPage-1 %>&select=<%=currentSelect%>"><span aria-hidden="true">&laquo;</span></a></li>
            <%} %>
            
          <%
          if(bendpage>pnum){
				bendpage=pnum;
			}
	for (int i = 1; i <= pnum; i++) {
		if (currentPage == i) {
%>
			<li class='active'><a style='color: white;' href="#"><%=i%></a></li>
<%
		} else {
%>		
		
		 <li><a href="<%=request.getContextPath()%>/eventboard?page=<%=i%>&select=<%=currentSelect%>"><%=i%></a></li>
<%
		}
	}
%>
            
            <%if(currentPage>=pnum){ %>
            <%}else{ %>
             <li><a aria-lable="Next"href="<%=request.getContextPath() %>/eventboard?page=<%=currentPage+1 %>&select=<%=currentSelect%>"><span aria-hidden="true">&raquo;</span></a></li>
            <%} %>
             <%if(currentPage>=pnum){ %>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/eventboard?page=<%=pnum%>&select=<%=currentSelect%>">끝</a></li>
            <%} %>
        </td>
        </ul></nav>
    </tr>
    <tr align="right">
        <td colspan="5">
        <%if(loginUserObj!=null){ %>
             <a href="<%=request.getContextPath() %>/eventboard_write">[글쓰기]</a>
             <%} %>
        </td>
        
    </tr>
</table>
<div id="footmargin"></div>
</div>
</body>


