<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
	 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<title>회원가입</title>
		
	<style>
		.form-control{
			width:40% !important;
		}
		
		 #mail_check_input_box_false{
    		background-color:#ebebe4;
    		width:1%;
		}
		 
		#mail_check_input_box_true{
		    background-color:white;
		}
		
		.correct{
			color : green;
		}
		.incorrect{
			color : red;
		}
		
	</style>
		
	</head>
	<script type="text/javascript">
	
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById('postCode').value = data.zonecode; */
                document.getElementById("userAddress1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userAddress2").focus();
            }
        }).open();
    }
		
		var code = "";
	
		var idChk = 0;
		var emailChk = 0;
		
		var pass= RegExp(/^[a-zA-Z0-9]{4,12}$/)
		var named= RegExp(/^[가-힣]{2,4}$/)
		var birth= RegExp(/^[0-9]{6}$/)
		var phoneNumber= RegExp(/^[0-9]{11}$/)
	
		$(document).ready(function(){
			
			//한글입력 불가능 처리
			$("input[name=userId]").keyup(function(event){ 

				   if (!(event.keyCode >=37 && event.keyCode<=40)) {

				    var inputVal = $(this).val();

				    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));

				   }

				  });
			
			
			
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/controller/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				//비밀번호 공백 확인
	            if($("#userPw").val() == ""){
	                  alert("패스워드를 입력해주세요.");
	                  $("#userPw").focus();
	                  return false;
	             }
				//비밀번호 유효성검사
	            if(!pass.test($("#userPw").val())){
	                alert("패스워드를 형식에 맞게 입력해주세요");
	                $("#userPw").val("");
	                $("#userPw").focus();
	                 return false;
	           }
	          	//이름 공백 검사
	            if($("#userName").val() == ""){
	            	alert("이름을 입력해주세요");
	            	$("#userName").focus();
	                return false;
	           }
	            //이름 유효성 검사
	            if(!named.test($("#userName").val())){
	                alert("이름을 형식에 맞게 입력해주세요")
	                $("#userName").val("");
	                $("#userName").focus();
	                return false;
	           }
	           /*  //생일 공백 검사
	            if($("#userBirth").val() == ""){
	            	alert("생일을 입력해주세요");
	            	$("#userBirth").focus();
	                return false;
	           }
	            //생일 유효성 검사
	            if(!birth.test($("#userBirth").val())){
	                alert("생일을 형식에 맞게 입력해주세요")
	                $("#userBirth").val("");
	                $("#userBirth").focus();
	                return false;
	           } */
	            //전화번호 공백 검사
	            if($("#userPhone").val() == ""){
	            	alert("전화번호를 입력해주세요");
	            	$("#userPhone").focus();
	                return false;
	           }
	            //전화번호 유효성 검사
	            if(!userPhone.test($("#userPhone").val())){
	                alert("전화번호를 형식에 맞게 입력해주세요")
	                $("#userPhone").val("");
	                $("#userPhone").focus();
	                return false;
	           }
				/* if(idChk != 1){
					alert("중복확인을 성공해주세요.");
					return false;
				} */
				
				if($("#passChk").val() == $("#userPw").val()){
					return true;					
				} else {
					alert("패스워드와 패스워드 확인이 일치하지 않습니다.")
					return false;
				}
			
			})
			
			// 인증번호 비교
			$(".mail_check_input").blur(function(){
				
				var inputCode = $(".mail_check_input").val();
				var checkResult = $("#mail_check_input_box_warn");
				
				if(inputCode == code) {
					checkResult.html("인증번호가 일치합니다.");
					checkResult.attr("class", "correct");
					emailChk = 1;
				} else {
					checkResult.html("인증번호를 다시 확인해주세요.");
					checkResult.attr("class", "incorrect");
					emailChk = 0;
				}
			
			
			})
			
			
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/controller/member/idChk",
				type : "POST",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
						idChk = 2;
					}else if($("#userId").val() == "" || $("#userId").val().length < 6){
						alert("아이디를 형식에 맞게 입력해주세요.");
					}
					
					else if(data == 0){
						$("#idChk").attr("value","Y");
						alert("사용가능한 아이디입니다.");
						idChk = 1;
					}
				}
			})
			
		}
		/* $(".mail_check_button").click(function(){ */
		function mail_check() {
			
			alert("ㅈㄹㄷㅈㅈㄹ")
			var email = $(".mail_input").val();
			var checkBox = $(".mail_check_input");
			var boxWrap = $(".mail_check_input_box");
			
			$.ajax({
				type:"GET",
				url:"mailCheck?email=" + email,
				success : function(data){
					
					console.log("data : " + data);
					checkBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					
					code = data;
				}
			})
		};
		
		
		
	</script>
	<body>
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style="text-align:center; margin:50px 0px 50px 0px">
				<h1>회원 가입</h1>
			</header>
			<div style="width:50%; display:inline">
			<form action="/controller/member/regist" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<button style="margin-left:5px; border:1px solid black" class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
					<input class="form-control" type="text" id="userId" name="userId" placeholder="영문 또는 숫자 6자이상 15자이하"/>
					
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPw" name="userPw" placeholder="영문 또는 숫자 4자이상 12자이하"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="passChk">패스워드 확인</label>
					<input class="form-control" type="password" id="passChk" name="passChk" placeholder="패스워드를 다시한번 입력해주세요."/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="userName" placeholder="한글 2자이상 4자이하" />
				</div>
				<div>
					<label class="control-label" for="userAddress">주소</label>
					<input type="button" onclick="execDaumPostcode()" value="주소 찾기">
					<!-- <input class="form-control" type="text" id="postCode" name="postCode" placeholder="우편번호" required="required"> -->
					<input class="form-control" type="text" id="userAddress1" name="userAddress1" placeholder="주소">
					<input class="form-control" type="text" id="userAddress2" name="userAddress2" placeholder="상세주소">
				</div>
				<!-- <div class="form-group has-feedback">
					<label class="control-label" for="userBirth">생년월일</label>
					<input class="form-control" type="text" id="userBirth" name="userBirth" placeholder="출생년도 앞 2자리를 제외한 숫자 6자"/>
				</div> -->
				<div class="mail_wrap">
					<label class="control-label">이메일</label>
					<div class="mail_input_box">
						<input class="mail_input" type="text" id="userEmail" name="userEmail">
					</div>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<button type="button" class="mail_check_button" onclick="mail_check();">인증번호 전송</button>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="phoneNumber">전화번호</label>
					<input class="form-control" type="text" id="userPhone" name="userPhone" placeholder="'-'를 제외한 숫자 11자"/>
				</div>
				
				<!-- <div class="form-group has-feedback">
					<label class="control-label" for="phoneNumber">전화번호</label>
					<input class="form-control" type="tel" id="phoneNumber" name="phoneNumber" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"/>
				</div> -->
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			</div>
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
	
</html>