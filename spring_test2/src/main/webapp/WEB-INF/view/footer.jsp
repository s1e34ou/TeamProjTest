<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<footer>
	<div class="copy_link" id="mainfoot">
		<div id="fastivalci">
			<a href="<%=request.getContextPath()%>/main">
			<img src="<%=request.getContextPath()%>/images/fastival.jpg" id="fastivalfootlogo">
			</a>
		</div>
		<div id="fastivalinfo">
			<span class="skip"> 충남 아산시 배방읍 호서로 79번길 20
				호서대학교 제2공학관 510호 (우)336-795 tel : 010-oooo-oooo<br>
				copyright(c) 2015 fastival 주식회사. all rights reserved
			</span>
		</div>
		<div class="select_link" id="sitegogo">
			<select onchange="if(this.value) window.open(this.value);" name="jumpMenu" id="jumpMenu">
				<option value="" selected="selected">관련 사이트</option>
				<option value="https://www.google.co.kr">구글</option>
				<option value="http://www.naver.com/">네이버</option>
				<option value="http://www.letskorail.com/">코레일</option>
				<option value="http://www.hoseo.ac.kr">호서대학교</option>
				<option value="http://www.culture.go.kr/wday/">문화가있는날</option>
				<option value="http://korean.visitkorea.or.kr/kor/inut/addOn/main/publish/index.jsp">한국관광공사</option>
			</select> 
		</div>
	</div>

	</footer>