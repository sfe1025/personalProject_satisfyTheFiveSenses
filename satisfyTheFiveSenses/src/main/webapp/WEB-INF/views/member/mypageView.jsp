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
	</head>
	<script type="text/javascript">
	
		var userPw = "<c:out value='${member.userPw}'/>";
		
		var named= RegExp(/^[가-힣]{2,4}$/)
		var birth= RegExp(/^[0-9]{6}$/)
		/* var phoneNumber= RegExp(/^[0-9]{11}$/) */

		$(document).ready(function(){
			
			
			$("#pwView").hide();
			$("#addressView").hide();
			$("#phoneView").hide();
			
			$("#changePw").on("click", function() {
				if($("#pwView").is(":visible")){
					$("#pwView").hide();
				}else {
					$("#pwView").show();
				}
			})
			$("#changeAddress").on("click", function() {
				if($("#addressView").is(":visible")){
					$("#addressView").hide();
				}else {
					$("#addressView").show();
				}
			})
			$("#changePhone").on("click", function() {
				if($("#phoneView").is(":visible")){
					$("#phoneView").hide();
				}else {
					$("#phoneView").show();
				}
			})
			
			// 취소
			$("#cancle").on("click", function(){
				
				location.href = "/controller/";
						    
			})
			/* 
			$("#phoneNumber").on("click", function(){
				$(this).val('');
			}); */
			
			$("#deleteBtn").on("click", function () {
				
				
				if(confirm("정말 회원탈퇴 하시겠습니까?")){
					
					$("#update").attr("action", "/controller/member/memberDelete");
					$("#update").attr("method", "post");
					$("#update").submit();
				}
				
			});
			
				
			
		})
		
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
	</script>
	<body>
	
	<%@include file="../include/header.jsp"%>
	
		

		<div class="container" style="margin-top:50px">
		
			<header style="text-align:center;">
				<h1>마이페이지</h1>
			</header>
			
			<section id="container">
				<form id="update" method="post" name="sub1" action="/controller/member/memberUpdate">
					<div class="form-group has-feedback">
						<label class="control-label" for="userId">아이디</label>
						<input class="form-control" type="text" id="userId" name="userId" value="${mypage.userId}" readonly="readonly"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userName">성명</label>
						<input class="form-control" type="text" id="userName" name="userName" placeholder="한글 2자이상 4자이하" value="${mypage.userName}" readonly="readonly"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userEmail">이메일</label>
						<input class="form-control" type="text" id="userEmail" name="userEmail" value="${mypage.userEmail}" readonly />
					</div>
					<div>
						<button type="button" id="changePw">패스워드 변경</button>
						<button type="button" id="changeAddress">주소 변경</button>
						<button type="button" id="changePhone">핸드폰번호 변경</button>
					</div>
					<hr>
					<div class="form-group has-feedback" id="pwView">
						<label class="control-label" for="userPw">패스워드</label>
						<input class="form-control" type="password" id="userPw" name="userPw" value="${mypage.userPw }" placeholder="새로운 패스워드를 입력해주세요."/>
					</div>
					<div id="addressView">
						<label class="control-label" for="userAddress">주소</label>
						<input type="button" onclick="execDaumPostcode()" value="주소 찾기">
						<input class="form-control" type="text" id="userAddress1" name="userAddress1" placeholder="주소" value="${mypage.userAddress1 }">
						<input class="form-control" type="text" id="userAddress2" name="userAddress2" placeholder="상세주소" value="${mypage.userAddress2 }">
					</div>
					<div class="form-group has-feedback" id="phoneView">
						<label class="control-label" for="userPhone">핸드폰 번호</label>
						<input class="form-control" type="text" id="userPhone" name="userPhone" placeholder="'-'를 제외한 숫자 11자" value="${mypage.userPhone}" 
						placeholder="ex) 01012345678"/>
					</div>
					<div class="form-group has-feedback">
						<button class="btn btn-success" type="submit" id="modify">회원정보수정</button>
						<button class="cencle btn btn-danger" type="button" id="deleteBtn">회원탈퇴</button>
						<button class="cencle btn btn-danger" type="button" id="cancle">취소</button>
					</div>
				</form>
			</section>
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
	
</html>