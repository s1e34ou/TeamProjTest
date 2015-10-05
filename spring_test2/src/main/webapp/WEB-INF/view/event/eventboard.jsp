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
	<style type="text/css">
	.family_site ul {display:none;position:absolute;top:30px; /*임의*/width:100px;/*임의*/}
	.family_site {position:relative;}
	.family_site button.title {height:30px;/*임의*/width:100px;/*임의*/}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	jQuery(document).ready(function($){
		 //button toggle
		     $('.family_site button.title').click(function(){
		     $('.family_site ul').slideToggle();
		    });
		})
	</script>
</head>

<body>
<div id="board">
	<h1>이벤트게시판</h1>
		<div id="boardin">
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

Object blist = request.getAttribute("boardlist"); 
List<Board> list = (List<Board>)blist;

Object plist = request.getAttribute("pagelist"); 
List<Board> pplist = (List<Board>)plist;

pnum = (int) Math.ceil((double) list.size() / BoardDao.BOARD_PER_PAGE);
%>


<div class="family_site">
    <button type="button" class="title">Family Site</button>
    <ul>
        <li><a href="<%=request.getContextPath() %>/eventboard?page=1" title="식품" value="<%=request.setAttribute("select", "EVENT_f.*" ) %>">식품</a></li>            
        <li><a href="#" title="새 창" target="_blank">내용2</a></li>
        <li><a href="#" title="새 창" target="_blank">내용3</a></li>
    </ul>
</div>
<center>
<table width=570 border="0" cellpadding="0" cellspacing="0" id="boardlist">
     
    <tr align="center" valign="middle" bordercolor="#333333">
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" height="26">
            <div align="center">번호</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="50%">
            <div align="center">제목</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="14%">
            <div align="center">작성자</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="17%">
            <div align="center">날짜</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="11%">
            <div align="center">조회수</div>
        </th>
    </tr>
    
    <%
        for(int i=0;i<pplist.size();i++){
    %>
    <tr align="center" valign="middle" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='F8F8F8'"
        onmouseout="this.style.backgroundColor=''">
        <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <%=pplist.get(i).getBoardNo()%>
        </td>
            <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <a href="<%=request.getContextPath()%>/eventboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%></a>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <%=pplist.get(i).getUsersUsersId()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <%=pplist.get(i).getBoardDate()%>
        </td>    <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <%=pplist.get(i).getBoardHits()%>
        </td>
      
    </tr>
    <%} %>
     <tr align=center height=20>
        <td colspan=7 style=font-family:Tahoma;font-size:11pt;>
            
            <%if(currentPage<=1){ %>
            [처음]&nbsp;
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/evnetboard?page=1">[처음]</a>&nbsp;
            <%} %>
            
            <%if(currentPage<=1){ %>
            [이전]&nbsp;
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/evnetboard?page=<%=currentPage-1 %>">[이전]</a>&nbsp;
            <%} %>
            
          <%
	for (int i = 1; i <= pnum; i++) {
		if (currentPage == i) {
%>
			 <%=i%> 
<%
		} else {
%>		
		<%-- <ul class="pagination">
		<li><a href="<%=request.getContextPath()%>/freeboard?page=<%=i%>"><%=i%></a></li>
		</ul> --%>
		<a href="<%=request.getContextPath()%>/evnetboard?page=<%=i%>"><%=i%></a>
<%
		}
	}
%>
            
            <%if(currentPage>=pnum){ %>
            [다음]
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/evnetboard?page=<%=currentPage+1 %>">[다음]</a>
            <%} %>
             <%if(currentPage>=pnum){ %>
            [끝]
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/evnetboard?page=<%=pnum%>">[끝]</a>
            <%} %>
        </td>
    </tr>
    <tr align="right">
        <td colspan="5">
        <%if(loginUserObj!=null){ %>
             <a href="<%=request.getContextPath() %>/eventboard_write">[글쓰기]</a>
             <%} %>
        </td>
    </tr>
    

    
</table>
</div>
</div>
</body>
