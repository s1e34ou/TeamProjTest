<%@page import="dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="service.BoardService"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<%Object bserviceObj = request.getAttribute("boardservice"); 
BoardService bservice = (BoardService)bserviceObj;
Object boardObj = request.getAttribute("board");
Board board = (Board)boardObj;
List<Board> list = bservice.getBoardByPage(BoardDao.BOARD_PER_PAGE);

%>
<table width=570 border="0" cellpadding="0" cellspacing="0">
     
    <tr align="center" valign="middle" bordercolor="#333333">
        <th style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
            <div align="center">번호</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="50%">
            <div align="center">제목</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="14%">
            <div align="center">작성자</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="17%">
            <div align="center">날짜</div>
        </th>
        <th style="font-family:Tahoma;font-size:8pt;" width="11%">
            <div align="center">조회수</div>
        </th>
    </tr>
    
    <%
        for(int i=0;i<list.size();i++){
            list.get(i).;
    %>
    <tr align="center" valign="middle" bordercolor="#333333"
        onmouseover="this.style.backgroundColor='F8F8F8'"
        onmouseout="this.style.backgroundColor=''">
        <td height="23" style="font-family:Tahoma;font-size:10pt;">
            <%=bl.getBOARD_NUM()%>
        </td>
        
        <td style="font-family:Tahoma;font-size:10pt;">
            <div align="left">
            <%if(bl.getBOARD_RE_LEV()!=0){ %>
                <%for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ %>
                &nbsp;
                <%} %>
                ▶
            <%}else{ %>
                ▶
            <%} %>
            <a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>">
                <%=bl.getBOARD_SUBJECT()%>
            </a>
            </div>
        </td>
        
        <td style="font-family:Tahoma;font-size:10pt;">
            <div align="center"><%=bl.getBOARD_ID() %></div>
        </td>
        <td style="font-family:Tahoma;font-size:10pt;">
            <div align="center"><%=bl.getBOARD_DATE() %></div>
        </td>    
        <td style="font-family:Tahoma;font-size:10pt;">
            <div align="center"><%=bl.getBOARD_READCOUNT() %></div>
        </td>
    </tr>
    <%} %>
 <%--    <tr align=center height=20>
        <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
            <%if(nowpage<=1){ %>
            [이전]&nbsp;
            <%}else{ %>
            <a href="./BoardList.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
            <%} %>
            
            <%for(int a=startpage;a<=endpage;a++){
                if(a==nowpage){%>
                [<%=a %>]
                <%}else{ %>
                <a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>
                &nbsp;
                <%} %>
            <%} %>
            
            <%if(nowpage>=maxpage){ %>
            [다음]
            <%}else{ %>
            <a href="./BoardList.bo?page=<%=nowpage+1 %>">[다음]</a>
            <%} %>
        </td>
    </tr> --%>
    <tr align="right">
        <td colspan="5">
             <a href="./BoardWrite.bo">[글쓰기]</a>
        </td>
    </tr>
</table>
</body>
