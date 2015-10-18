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
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div id="board">
	<h1><a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/notice?page=1">공지사항</a></h1>
		<div id="boardin">
		<div id="boardinhead">
			<div id="contentnum">
				게시물수 : <%=request.getAttribute("count") %>
			</div>
			<div id="contentsearch">
				<div id="contentsearchin">
				<input type="text" name="searchtext" placeholder="키워드 검색" id="searchtext" />
				<input class="btn btn-default" type="submit" id="searchbutton" value="검색" />
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
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
    %>
    <tr align="center" valign="middle" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='F8F8F8'"
        onmouseout="this.style.backgroundColor=''">
        <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <%=pplist.get(i).getBoardNo()%>
        </td>
            <td height="23" style="font-family:Tahoma;font-size:12pt;" class="line">
            <a style="color: black" href="<%=request.getContextPath()%>/notice_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%><%if(pplist.get(i).getReplyCount()>0){ %> (<%=pplist.get(i).getReplyCount()%>)<%}%></a>
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
            
            <%if(currentPage<=1){ %>
            [처음]&nbsp;
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/notice?page=1">[처음]</a>&nbsp;
            <%} %>
            
            <%if(currentPage<=1){ %>
            [이전]&nbsp;
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/notice?page=<%=currentPage-1 %>">[이전]</a>&nbsp;
            <%} %>
            
          <%
	for (int i = 1; i <= pnum; i++) {
		if (currentPage == i) {
%>
			 <%=i%> 
<%
		} else {
%>
		<a href="<%=request.getContextPath()%>/notice?page=<%=i%>"><%=i%></a>
<%
		}
	}
%>
            
            <%if(currentPage>=pnum){ %>
            [다음]
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/notice?page=<%=currentPage+1 %>">[다음]</a>
            <%} %>
             <%if(currentPage>=pnum){ %>
            [끝]
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/notice?page=<%=pnum%>">[끝]</a>
            <%} %>
        </td>
    </tr>
    <tr align="right">
        <td colspan="5">
        <%if((loginUserObj!=null)&&(((Users)loginUserObj).getUsersId().equals("admin"))){ %>
             <a href="<%=request.getContextPath() %>/notice_write">[글쓰기]</a>
             <%} %>
        </td>
    </tr>
</table>
<div id="footmargin"></div>
</div>
</div>
</body>
