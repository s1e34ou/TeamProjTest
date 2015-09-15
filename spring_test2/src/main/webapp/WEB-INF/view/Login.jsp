<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<style type="text/css">
			.form-group{
				width: 30%;
			}
			
		</style>
</head>
<body>
<fieldset>
<legend><h1>회원가입</h1></legend>
<form class="form-horizontal">

  <div class="form-group">
    <label for="ID" class="col-sm-2 control-label">ID</label>
    <div class="col-sm-10">
      <input type="ID" class="form-control" id="ID" placeholder="ID">
      <input class="btn btn-default" type="button" value="중복확인">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" placeholder="name">
    </div>
  </div>
  <div class="form-group">
    <label for="gender" class="col-sm-2 control-label">성별</label>
    <label class="radio-inline">
 	 <input type="radio" name="gender" id="male" value="male"> 남
	</label>
	<label class="radio-inline">
  	<input type="radio" name="gender" id="female" value="female"> 여
	</label>
  </div>
  
	
	
	<div class="form-group">
    <label for="birth" class="col-sm-2 control-label">생년월일</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="birth" placeholder="birth">
    </div>
  </div>
  
  <div class="form-group">
    <label for="address" class="col-sm-2 control-label">주소</label>
    <div class="col-sm-10">
   		<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
      <input type="text" class="form-control" id="sample6_address" placeholder="address">
      <input class="btn btn-default" type="button" onclick="sample6_execDaumPostcode()" value="주소찾기">
      <input type="text" class="form-control" id="sample6_address2" placeholder="상세주소">
    </div>
  </div>
  
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" placeholder="email">
    </div>
  </div>
  
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">ID/PassWord 찾기질문</label>
    <div class="col-sm-10">
      <select class="form-control">
		<option>당신이 졸업한 초등학교는?</option>
		<option>당신이 졸업한 고등학교는?</option>
		<option>가장 좋아 하는 색은?</option>
	</select>
	<input type="text" class="form-control" id="findpass" placeholder="정답">
    </div>
  </div>
  
  
</form>
</fieldset>
</body>
</html>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
