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
	<h1>검색결과</h1>
		<div id="boardin">
		<%=request.getAttribute("count") %>개의 결과를 찾음.
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
     
    <tr align="center" valign="middle" bordercolor="#333333">
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
    %>
    <tr align="center" valign="middle" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='F8F8F8'"
        onmouseout="this.style.backgroundColor=''">
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
            		code="기타";
            	}
            	out.println(code);
            %>
            
        </td>
            <td height="23" style="font-family:Tahoma;font-size:12pt;">
            <% 
            	String view = pplist.get(i).getBoardCode();
				if(view.equals("FREE")){ %>
					 <a href="<%=request.getContextPath()%>/freeboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%></a>
			<%		 
				}else if(view.equals("QNA")){
			%>
					 <a href="<%=request.getContextPath()%>/qnaboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%></a>
			<%
				}else if(view.equals("NOTICE")){
            %>
            	<a href="<%=request.getContextPath()%>/noticeboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%></a>
            <%
            	}else{ 
            %>
            	<a href="<%=request.getContextPath()%>/eventboard_view?boardNo=<%=pplist.get(i).getBoardNo()%>"><%=pplist.get(i).getBoardName()%></a>
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
            
            <%if(currentPage<=1){ %>
            [처음]&nbsp;
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/search?page=1&select=<%=currentSelect%>">[처음]</a>&nbsp;
            <%} %>
            
            <%if(currentPage<=1){ %>
            [이전]&nbsp;
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/search?page=<%=currentPage-1 %>&select=<%=currentSelect%>">[이전]</a>&nbsp;
            <%} %>
            
          <%
	for (int i = 1; i <= pnum; i++) {
		if (currentPage == i) {
%>
			 <%=i%> 
<%
		} else {
%>		
		
		<a href="<%=request.getContextPath()%>/search?page=<%=i%>&select=<%=currentSelect%>"><%=i%></a>
<%
		}
	}
%>
            
            <%if(currentPage>=pnum){ %>
            [다음]
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/search?page=<%=currentPage+1 %>&select=<%=currentSelect%>">[다음]</a>
            <%} %>
             <%if(currentPage>=pnum){ %>
            [끝]
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/search?page=<%=pnum%>&select=<%=currentSelect%>">[끝]</a>
            <%} %>
        </td>
    </tr>
    <tr align="right">
        <td colspan="5">
        <%if(loginUserObj!=null){ %>
             <a href="<%=request.getContextPath() %>/searchboard_write">[글쓰기]</a>
             <%} %>
        </td>
    </tr>
    

    
</table>
</div>
</div>
</body>


