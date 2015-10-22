<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sform" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dto.Users"%>
<%@page import="dto.Photo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/board_change.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/head_footer.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/style/thumbnail.css " rel="stylesheet" type="text/css">

<!-- 합쳐지고 최소화된 옵션 테마 -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<%
Object cb = request.getAttribute("photo");
Photo photo = (Photo)cb;

%>

<script type="text/javascript">
$(function() {
	$("#wri").on("click",function(e){
		if($("#boardName").val()==""){
			alert("제목을 입력하세요");
			e.preventDefault();
		}
	});	
});

$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});


</script>
</head>
<body>
<div id="boardchange">
	<h1>포토게시판</h1>
		<div id="boardin">
<div class="admin admin-add-problem">
	<c:url value="/albumboard_change" var="albumboard_change"></c:url>
    <sform:form method="post" action="${albumboard_change }" enctype="multipart/form-data" modelAttribute="photo">
        <fieldset>
        	<div id="blisthead">
        	<sform:label path="photoName">제목</sform:label>
			<sform:input path="photoName"/>
			<sform:label path="usersUsersId">작성자</sform:label>
        	<sform:input path="usersUsersId"  readonly="true"/>
        	
			<div class="filebox bs3-primary preview-image">
            	<input class="upload-name" value="<%=photo.getPhotoImage() %>" disabled="disabled" style="width: 200px;">
            	<label for="file">썸네일등록</label>
            	<input id="file" name="file" type="file" class="upload-hidden"/>
            </div>
            
        	<sform:label path="photoNo">글번호</sform:label>
        	<sform:input path="photoNo" readonly="true"/>
			</div>
			<hr>
            <sform:label path="photoContent">내용</sform:label>
            <sform:textarea path="photoContent" rows="10" cols="100"></sform:textarea><br>
            <div id="blistfoot">
            <sform:button id="wri">수정</sform:button>
            <a href="<%=request.getContextPath()%>/albumboard_view?photoNo=<%=photo.getPhotoNo()%>"><button type="button">취소</button></a>
            </div>
        </fieldset>
    </sform:form>
</div>
</div>
</div>
<script>
	CKEDITOR.replace('photoContent');
	
</script>
</body>
</html>