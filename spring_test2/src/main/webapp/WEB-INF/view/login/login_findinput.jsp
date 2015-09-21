<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/login_findinput.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="<%=request.getContextPath()%>/style/main.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<div id="idpwsearchinput">
	<h1>ID/PW찾기</h1>
		<div id="idpwsearchinputin">
		
		
			<div id="idsearch">
				<h2>ID 찾기</h2>
				<c:url value="/login_findinput" var="login_findinput"></c:url>
				<sform:form method="post" action="${login_findinput }" class="form-horizontal" modelAttribute="users">
				
					<div class="form-group" id="nameinputbox">
						<sform:label path="usersEmail" class="col-sm-2 control-label">EMAIL</sform:label>
						<sform:input path="usersEmail" class="form-control"  placeholder="email"/>
					</div>
					
					<div class="form-group" id="idpwsearchquebox">
						<sform:label path="usersName" class="col-sm-2 control-label" >이름</sform:label>
						<sform:input path="usersName" class="form-control" placeholder="name"/>
					</div>
					<div id="joincancelbtn">
  						<sform:button class="btn btn-default">ID찾기</sform:button>
 						<a href="<%=request.getContextPath() %>/main"><button type="button" class="btn btn-default">취소</button></a>
 					 </div>					
				</sform:form>
			
			</div>
			
			
			<div id="pwsearch">
				<h2>PW 찾기</h2>
					<div class="form-group" id="idinputbox">
						<label for="ID" class="col-sm-2 control-label" id="idtext">ID</label> 
						<input type="ID" class="form-control" id="id" name="USERS_NAME" placeholder="ID"> 
					</div>
					<div class="form-group" id="nameinputbox">
						<label for="name" class="col-sm-2 control-label" id="nametext">이름</label>
						<input type="text" class="form-control" id="name" name="USERS_NAME" placeholder="name">
					</div>
					<div class="form-group" id="idpwsearchquebox">
						<label for="email" class="col-sm-2 control-label" id="idsearchquetext">PW찾기 질문</label>
						<select class="form-control" name="USERS_PASSQUES" id="queidpw">
							<option>당신이 졸업한 초등학교는?</option>
							<option>당신이 졸업한 고등학교는?</option>
							<option>가장 좋아 하는 색은?</option>
						</select> 
					</div>
					<div class="form-group" id="idpwsearchansbox">
						<label for="email" class="col-sm-2 control-label" id="idsearchanstext">PW찾기 답</label>
						<input type="text" class="form-control" id="findidpw" placeholder="정답">
						<div id="searchbtn">
							<input class="btn btn-default" type="submit" onclick=""	value="PW 찾기">
							<input class="btn btn-default" type="submit" onclick="" value="취소">
						</div>
					</div>
			</div>
			
			
		</div>
	</div>
</body>
</html>