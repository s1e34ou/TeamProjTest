<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<div id="loginform">
		<%
			Object loginIdObj = session.getAttribute("loginId");
			if (loginIdObj == null) {
		%>
		<form class="inlineform" action="<%=request.getContextPath()%>/login"
			method="post">
			<label for="id">ID</label> 
			<input type="text" name="id" id="id"><br>

			<label for="pass">PASS</label> 
			<input type="password" name="pass" id="pass"><br> 
			<input type="submit" value="login">

		</form>
		<a href="<%=request.getContextPath()%>/front?command=join"><button>가입</button></a>
		<%
			} else {
				String loginId = ((Users) loginIdObj).getUserName();
		%>
		<div>
			<%=loginId%>님 반갑습니다.<br> <a
				href="<%=request.getContextPath()%>/front?command=modify"><button>개인정보</button></a>
			<a href="<%=request.getContextPath()%>/front?command=logout"><button>로그아웃</button></a>
			<ul class="menulist">
			<li class="menulistitem"><a href="<%=request.getContextPath()%>/front?command=write" id="ma2">게시글쓰기</a></li>
			</ul>
		</div>
		<%
			}
		%>

	</div>
</html>
