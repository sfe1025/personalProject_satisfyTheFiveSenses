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
		<title>비밀번호 찾기</title>
		
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
	
		
		var code = "";
	
		var idChk = 0;
		var emailChk = 0;
		
		$(document).ready(function(){
		
			$("#searchBtn").on("click", function() {
				
				if(emailChk == 0){
					alert("이메일 인증을 성공해주세요.");
				}
				else if($("#userId").val() == ""){
					alert("아이디를 적어주세요.");
				}
				else{
					
					 var formObj = $("form[name='mailform']");
						
						
						formObj.attr("action", "/controller/member/searchPw");
						formObj.attr("method", "post");
						formObj.submit();
					
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
			
			
			});
			
			$("#loginViewBtn").click(function(){
				
				location.href="loginView";
			})
			
		})
			
		
			function mail_check() {
			
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
				<h1>비밀번호 찾기</h1>
			</header>
			<div style="width:50%; display:inline">
			<form name="mailform" action="/controller/board/searchId" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId"/>
				</div>
				<div class="mail_wrap">
					<label class="control-label">이메일</label>
					<div class="mail_input_box">
						<input class="mail_input" id="userEmail" name="userEmail">
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
					<button class="btn btn-success" type="button" id="searchBtn">찾기</button>
					<button class="cencle btn btn-danger" type="button" id="loginViewBtn">로그인으로</button>
				</div>
			</form>
			</div>
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
	
</html>