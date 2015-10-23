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
<link href="<%=request.getContextPath()%>/style/searchboard.css"
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
	<h1>검색결과</h1>
		<div id="boardin">
			<div id="boardinin">
		<center><h2>총 <%=request.getAttribute("count") %>개의 결과를 찾음.</h2>
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

Object selectObj = request.getAttribute("select");
String currentSelect;
if(selectObj!=null){
	currentSelect = (String)selectObj;
}else{
	currentSelect="*";
}

Object blist = request.getAttribute("boardlist"); 
List<Board> list = (List<Board>)blist;

Object plist = request.getAttribute("pagelist"); 
List<Board> pplist = (List<Board>)plist;

pnum = (int) Math.ceil((double) list.size() / BoardDao.BOARD_PER_PAGE);
%>



<center>
<table width=570 border="0" cellpadding="0" cellspacing="0" id="boardlist">
     
    <tr align="center" valign="middle" bordercolor="#333333" id="sline">
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" height="26">
            <div align="center">번호</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="8%" height="26">
            <div align="center">종류</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="45%">
            <div align="center">제목</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="15%">
            <div align="center">작성자</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="17%">
            <div align="center">날짜</div>
        </th>
        <th style="font-family:Tahoma;font-size:15pt;" width="15%">
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
        onmouseover="this.style.backgroundColor='E6E6E6'"
        onmouseout="this.style.backgroundColor=''" id="line">
        <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <%=pplist.get(i).getBoardNo()%>
        </td>
        <td height="23" style="font-family:Tahoma;font-size:12pt;">
           <%
            	String code=pplist.get(i).getBoardCode();
            	if(code.equals("EVENT_food")){
            		code="음식";
            	}else if(code.equals("EVENT_beauty")){
            		code="미용";
            	}else if(code.equals("EVENT_culture")){
            		code="문화";
            	}else{
            		code="자유";
            	}
            	out.println(code);
            %>
            
        </td>
            <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <% 
            	String view = pplist.get(i).getBoardCode();
				if(view.equals("FREE")){ %>
					 <a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/freeboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%></a>
			<%		 
				}else if(view.equals("QNA")){
			%>
					 <a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/qnaboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%></a>
			<%
				}else if(view.equals("NOTICE")){
            %>
            	<a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/noticeboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%></a>
            <%
            	}else{ 
            %>
            	<a style="color:black;text-decoration: none;" href="<%=request.getContextPath()%>/eventboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=boardname%></a>
            <%} %>
           
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
            <nav>
            <ul class="pagination">
            <%if(currentPage<=1){ %>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/search?se=all&page=1&select=<%=currentSelect%>">처음</a></li>
            <%} %>
            
            <%if(currentPage<=1){ %>
            <%}else{ %>
            <li><a aria-lable="Previous" href="<%=request.getContextPath() %>/search?se=all&page=<%=currentPage-1 %>&select=<%=currentSelect%>"><span aria-hidden="true">&laquo;</span></a></li>
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
		
		<li><a href="<%=request.getContextPath()%>/search?se=all&page=<%=i%>&select=<%=currentSelect%>"><%=i%></a></li>
<%
		}
	}
%>
            
            <%if(currentPage>=pnum){ %>
            <%}else{ %>
            <li><a aria-lable="Next" href="<%=request.getContextPath() %>/search?se=all&page=<%=currentPage+1 %>&select=<%=currentSelect%>"><span aria-hidden="true">&raquo;</span></a></li>
            <%} %>
             <%if(currentPage>=pnum){ %>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/search?se=all&page=<%=pnum%>&select=<%=currentSelect%>">끝</a></li>
            <%} %>
            </ul>
            </nav>
        </td>
    </tr>
    

    
</table>
</div>
</div>
</div>
</body>


