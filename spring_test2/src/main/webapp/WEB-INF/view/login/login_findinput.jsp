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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#findid").on("click",function(e){
		if($("#usersEmail").val()==""){
			alert("이메일을 입력해 주세요");
			e.preventDefault();
			
		}
		if($("#usersEmail").val()!=""&&$("#usersName").val()==""){
			alert("이름을 입력해 주세요");
			e.preventDefault();
		}
	});
	
	$("#findpw").on("click",function(e){
		if($("#usersId").val()==""){
			alert("아이디를 입력해 주세요");
			e.preventDefault();
			
		}
		if($("#usersId").val()!=""&&$("#usersName2").val()==""){
			alert("이름을 입력해 주세요");
			e.preventDefault();
		}
		if($("#usersId").val()!=""&&$("#usersName2").val()!=""&&$("#usersPassques").val()==""){
			alert("비밀번호 찾기 답을 입력해 주세요");
			e.preventDefault();
		}
	});
});
</script>

</head>
<body>
	<div id="idpwsearchinput">
	<h1>ID / PW찾기</h1>
		<div id="idpwsearchinputin">
		
		
			<div id="idsearch">
				<div id="idsearchin">
				<h2>ID 찾기</h2>
				<c:url value="/login_findinput" var="login_findinput"></c:url>
				<sform:form method="post" action="${login_findinput }" class="form-horizontal" modelAttribute="users">
				
					<div class="form-group" id="emailinputbox">
						<sform:label path="usersEmail" class="col-sm-2 control-label">EMAIL</sform:label>
						<sform:input path="usersEmail" class="form-control"  placeholder="email"/>
					</div>
					
					<div class="form-group" id="nameinputbox">
						<sform:label path="usersName" class="col-sm-2 control-label" >이름</sform:label>
						<sform:input path="usersName" class="form-control" placeholder="name"/>
						<div id="searchbtn">
  						<sform:button id="findid" class="btn btn-default">ID찾기</sform:button>
 						<a href="<%=request.getContextPath() %>/main"><button type="button" class="btn btn-default">취소</button></a>
 					 </div>	
					</div>
									
				</sform:form>
				</div>
			</div>
			
			
			<div id="pwsearch">
				<div id="pwsearchin">
				<h2>PW 찾기</h2>
				<c:url value="/login_findinputPw" var="login_findinputPw"></c:url>
				<sform:form method="post" action="${login_findinputPw }" class="form-horizontal" modelAttribute="users">
				
					<div class="form-group" id="idinputbox">
						<sform:label path="usersId" class="col-sm-2 control-label">ID</sform:label>
						<sform:input path="usersId"  class="form-control" placeholder="ID"/>
					</div>
					<div class="form-group" id="nameinputbox">
						<sform:label path="usersName" class="col-sm-2 control-label" >이름</sform:label>
						<sform:input id="usersName2" path="usersName" class="form-control" placeholder="name"/>
					</div>
					<div class="form-group" id="idpwsearchquebox">
						<label id="queidpw" class="col-sm-2 control-label">찾기질문</label>
						<select class="form-control" name="USERS_PASSQUES" id="queidpwslc">
							<option>당신이 졸업한 초등학교는?</option>
							<option>당신이 졸업한 고등학교는?</option>
							<option>가장 좋아 하는 색은?</option>
						</select> 
					</div>
					<div class="form-group" id="idpwsearchansbox">
						<sform:label path="usersPassques" class="col-sm-2 control-label" >PW찾기 답</sform:label>
						<sform:input class="form-control" path="usersPassques" placeholder="정답"/>
						<div id="searchbtn">
							<sform:button id="findpw" class="btn btn-default">PW 찾기</sform:button>
							<a href="<%=request.getContextPath() %>/main"><button type="button" class="btn btn-default">취소</button></a>
						</div>
					</div>
					</sform:form>
					</div>
			</div>
			
			
		</div>
	</div>
</body>
</html>