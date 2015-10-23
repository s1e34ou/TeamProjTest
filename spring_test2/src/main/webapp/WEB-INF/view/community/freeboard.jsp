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
<link href="<%=request.getContextPath()%>/style/board.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<div id="board">
	<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/freeboard?page=1">자유게시판</a></h1>
		<div id="boardin">
		<div id="boardinhead">
			<div id="contentnum">
				게시물수 : <%=request.getAttribute("count") %>
			</div>
			<div id="contentsearch">
				<div id="contentsearchin">
				<form action="<%=request.getContextPath()%>/search" method="get">
					<input id="se" name="se" type="hidden" value="free">
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
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Object blist = request.getAttribute("boardlist"); 
List<Board> list = (List<Board>)blist;

Object plist = request.getAttribute("pagelist"); 
List<Board> pplist = (List<Board>)plist;

pnum = (int) Math.ceil((double) list.size() / BoardDao.BOARD_PER_PAGE);
%>
<center>
<table  width=570 border="0" cellpadding="0" cellspacing="0" id="boardlist">
     
    <tr align="center" valign="middle" bordercolor="#333333">
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" height="50" class="sline">
            <div align="center">번호</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="50%" class="sline">
            <div align="center">제목</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="14%" class="sline">
            <div align="center">작성자</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="17%" class="sline">
            <div align="center">날짜</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="11%" class="sline">
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
    <tr  align="center" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='#E6E6E6'"
        onmouseout="this.style.backgroundColor=''">
        <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardNo()%>
        </td>
            <td valign="middle" height="23" style="font-family:Tahoma;font-size:12pt;" class="line"> 
            <a style="color: black; text-decoration: none;" href="<%=request.getContextPath()%>/freeboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%><%if(pplist.get(i).getReplyCount()>0){ %> (<%=pplist.get(i).getReplyCount()%>)<%}%></a>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getUsersUsersId()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=sdf.format(pplist.get(i).getBoardDate())%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardHits()%>
        </td>
      
    </tr>
    <%} %>
     <tr align=center valign="middle" height=100>
        <td  colspan=5 style=font-family:Tahoma;font-size:11pt;>
            <nav>
            <ul class="pagination">
            <%if(currentPage<=1){ %>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/freeboard?page=1">처음</a></li>
            <%} %>
            
            <%if(currentPage<=1){ %>
            <%}else{ %>
            <li><a aria-lable="Previous" href="<%=request.getContextPath() %>/freeboard?page=<%=currentPage-1 %>"><span aria-hidden="true">&laquo;</span></a></li>
            <%} %>
            
          <%
          if(bendpage>pnum){
				bendpage=pnum;
			}
	for (int i = bstartpage; i <= bendpage; i++) {
		if (currentPage == i) {
%>
			 <li class='active'><a style='color: white;' href="#"><%=i%></a></li>
<%
		} else {
%>		
		<li><a href="<%=request.getContextPath()%>/freeboard?page=<%=i%>"><%=i%></a></li>
<%
		}
	}
%>
            
            <%if(currentPage>=pnum){ %>
            <%}else{ %>
            <li><a aria-lable="Next" href="<%=request.getContextPath() %>/freeboard?page=<%=currentPage+1 %>"><span aria-hidden="true">&raquo;</span></a></li>
            <%} %>
             <%if(currentPage>=pnum){ %>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/freeboard?page=<%=pnum%>">끝</a></li>
            <%} %>
            </ul>
        </nav>
        </td>
    </tr>
    <tr align="right">
        <td colspan="5">
        <%if(loginUserObj!=null){ %>
             <a href="<%=request.getContextPath() %>/freeboard_write">[글쓰기]</a>
             <%} %>
        </td>
    </tr>
</table>
<div id="footmargin"></div>
</div>
</div>
</body>
