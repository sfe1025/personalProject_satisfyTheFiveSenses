<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
<title>Insert title here</title>
</head>
<script>

	$(document).ready(function(){
	
	$("#userPw").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
           
        	$("#passChk").trigger("click");
        }
	})

	
	$("#passChk").on("click", function () {
		
		$.ajax({
			url : "/controller/member/passChk",
			type : "POST",
			dataType : "json",
			data : $("#updateForm").serializeArray(),
			success : function(data){
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;	
				} else{
					
					$("#updateForm").attr("action", "/controller/member/mypageView");
					$("#updateForm").attr("method", "post");
					$("#updateForm").submit();
					
				}
			}
		})
		
	});
	
})

</script>


<body>

<%@include file="../include/header.jsp"%>

				<div class="box__password-check">
					<h2 class="text__header-title">비밀번호 확인</h2>
					<div class="box__password-input">
						<!-- to.dev 조건에 따라 아래 클래스 추가 됩니다.
							.box__password-input 					  : 일반회원
							.box__password-input.box__account--linked : 옥션-카카오 연결회원
							.box__password-input.box__account--kakao  : 카카오회원
						-->
						<form id="updateForm" name="updateForm">
						<p class="text__message">개인 정보를 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</p>
						<div class="box__id">
							<span class="text__label">아이디</span>
							<strong><input type="text" id="userId" name="userId" value="${member.userId }" readonly></strong>
						</div>
						<label for="input_password" class="for-a11y">비밀번호</label>
						<input type="password" id="userPw" name="userPw" placeholder="비밀번호" maxlength="40">
						<button type="button" id="passChk" style="display: block;">확인</button>
						</form>
					</div>
				</div>
<%@include file="../include/footer.jsp"%>


<!-- <div class="box__password-check">
					<h2 class="text__header-title">비밀번호 확인</h2>
					<div class="box__password-input">
						to.dev 조건에 따라 아래 클래스 추가 됩니다.
							.box__password-input 					  : 일반회원
							.box__password-input.box__account--linked : 옥션-카카오 연결회원
							.box__password-input.box__account--kakao  : 카카오회원
						
						<p class="text__message">개인 정보를 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</p>
						<div class="box__id">
							<span class="text__label">아이디</span>
							<strong class="text__id">sfe1025</strong>
						</div>
						<label for="input_password" class="for-a11y">비밀번호</label>
						<input type="password" id="input_password" placeholder="비밀번호" maxlength="40" class="form__input-text" onkeypress="return EnterKeyInsert(event);">
						<button type="submit" id="password-confimr" class="button__submit" onclick="ConfirmButton(); return false;" style="display: block;">확인</button>
						<button type="submit" class="button__submit button__kakao  sprite__mypage--before" onclick="loginWithKakao()" style="display: none;">카카오로 확인</button>
					</div>
				</div> -->



</body>
</html>