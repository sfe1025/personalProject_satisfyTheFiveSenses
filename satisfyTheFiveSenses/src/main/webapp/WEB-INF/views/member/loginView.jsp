<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		부가적인 테마
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	 -->
	 	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
		<title>로그인</title>
		
	<style>
	</style>
		
	</head>
	<script type="text/javascript">
	
		$(document).ready(function(){
			$("#registerBtn").on("click", function() {
    			location.href="registerView";
    		})
		})
	
		/* var idChk = 0;
		
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
	            //생일 공백 검사
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
	           }
	            //전화번호 공백 검사
	            if($("#phoneNumber").val() == ""){
	            	alert("전화번호를 입력해주세요");
	            	$("#phoneNumber").focus();
	                return false;
	           }
	            //전화번호 유효성 검사
	            if(!phoneNumber.test($("#phoneNumber").val())){
	                alert("전화번호를 형식에 맞게 입력해주세요")
	                $("#phoneNumber").val("");
	                $("#phoneNumber").focus();
	                return false;
	           }
				if(idChk != 1){
					alert("중복확인을 성공해주세요.");
					return false;
				}
				
				if($("#passChk").val() == $("#userPw").val()){
					return true;					
				} else {
					alert("패스워드와 패스워드 확인이 일치하지 않습니다.")
					return false;
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
			
		} */
		
	</script>
	<body>
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style="text-align:center; margin:50px 0px 50px 0px">
				<h1>로그인</h1>
			</header>
			<div class="login_box">
                		<form name='homeForm' action="/controller/member/login" method="post">
	                		<c:if test="${member ==null }">
		                		<table>
		                			<tr>
		                				<td><input class="form-control" type="text" id="userId" name="userId" required placeholder="아이디"></td>
		                				<td rowspan="2"><button class="btn btn-success" type="submit" style=" padding: 25px 15px;">로그인</button></td>
		                				<td rowspan="2"><button class="btn btn-success" type="button" id="registerBtn" style=" padding: 26px 12px; border:0; outline:0; background-color:#46AAFF;">회원가입</button>
		                			</tr>
		                			<tr>
		                				<td><input class="form-control" type="password" id="userPw" name="userPw" required placeholder="비밀번호"></td>
		                			</tr>
		                			<tr>
		                				<td><a href="/controller/member/searchIdView">아이디 찾기</a>
		                				<a href="/controller/member/searchPwView">비밀번호 찾기</a></td>
		                			</tr>
		                		</table>
		                	</c:if>
		                	<c:if test="${member != null }">
		                		<div>
		                			<span style="font-size:24px; margin-right:20px">${member.userName }님 환영합니다.</span>
		                			<!-- <button id="memberUpdateBtn" type="button">회원정보수정</button> -->
		                			<button class="cencle btn btn-danger" style="padding:10px 10px; margin-left:5px" id="logoutBtn" type="button">로그아웃</button>
		                		</div>
		                	</c:if>
		                	<c:if test="${msg == false }">
		                		<p style="color:red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
		                	</c:if>
                		</form>
					</div>
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
	
</html>