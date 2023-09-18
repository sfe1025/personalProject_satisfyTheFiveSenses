<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
	
	<style media="screen">
      *{
        margin: 0; padding: 0;
      }
      .slide{
        width: 1000px;
        height: 600px;
        overflow: hidden;
        position: relative;
        margin: 10px auto;
      }
      .slide ul{
        width: 5000px;
        position: absolute;
        top:0;
        left:0;
        font-size: 0;
      }
      .slide ul li{
        display: inline-block;
      }
      #back{
        position: absolute;
        top: 250px;
        left: 0;
        cursor: pointer;
        z-index: 1;
      }
      #next{
        position: absolute;
        top: 250px;
        right: 0;
        cursor: pointer;
        z-index: 1;
      }
      
      div#tt img {
    	width: 600px;
    	float: left;
    	}
     </style>
	
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		$("#logoutBtn").on("click", function() {
    			location.href="member/logout";
    		})
    		$("#registerBtn").on("click", function() {
    			location.href="member/registerView";	
    		})
    		$("#mypageBtn").on("click", function() {
    			location.href="member/AuthenticationView";	
    		})
    		
    		var imgs;
      var img_count;
      var img_position = 1;

      imgs = $(".slide ul");
      img_count = imgs.children().length;

      //버튼을 클릭했을 때 함수 실행
      $('#back').click(function () {
        back();
      });
      $('#next').click(function () {
        next();
      });

      function back() {
        if(1<img_position){
          imgs.animate({
            left:'+=1000px'
          });
          img_position--;
        }
      }
      function next() {
        if(img_count>img_position){
          imgs.animate({
            left:'-=1000px'
          });
          img_position++;
        }
      }
    		
    	})
    	/* 
    	function coronaChk(){
    		if($("input[name='temperature']").prop("checked") && $("input[name='cough']").prop("checked")) {
    			return true;
    		} else {
    			alert("발열과 기침여부를 확인해주세요.");
    			event.preventDefault();
    		}
    	} */
    </script>
    
    
    
</head>
<body style="background-color:#EDCDF6">

<%@include file="include/header.jsp"%>

	<!-- ***** Preloader Start ***** -->
    <!-- <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div> -->  
    <!-- ***** Preloader End ***** -->
    
    <!-- ***** About Area Starts ***** -->
    
    <div class="slide">
      <img id="back" src="/controller/resources/img/prev.png" alt="" width="100">
      <ul>
        <li><img src="/controller/resources/img/main1.PNG" alt="" width="1000" height="600"></li>
        <li><img src="/controller/resources/img/main2.png" alt="" width="1000" height="600"></li>
        <!-- <li><img src="/controller/resources/img/name3.png" alt="" width="1000" height="600"></li>
        <li><img src="/controller/resources/img/name4.png" alt="" width="1000" height="600"></li>
        <li><img src="/controller/resources/img/name5.png" alt="" width="1000" height="600"></li> -->
      </ul>
      <img id="next" src="/controller/resources/img/next.png" alt="" width="100">
    </div>

    <%-- <section class="section" id="about">
        <div class="container">
        	<div id="tt">
                <img src="${pageContext.request.contextPath}/resources/img/hajeongwo.jpg"><br>
                	<div class="login_box" style="float:right; margin:100px 0px 0px 0px;">
                		<form name='homeForm' action="/controller/member/login" method="post">
	                		<c:if test="${member ==null }">
		                		<table>
		                			<tr>
		                				<td><input class="form-control" type="text" id="userId" name="userId" required placeholder="아이디"></td>
		                				<td rowspan="2"><button class="btn btn-success" type="submit" style=" padding: 25px 15px;" onclick="coronaChk()">로그인</button></td>
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
		                			<button class="btn btn-success" type="button" id="mypageBtn" style="padding:10px 10px; margin-left:5px; background-color:#46AAFF;">마이페이지</button>
		                			
		                		</div>
		                	</c:if>
		                	<c:if test="${msg == false }">
		                		<p style="color:red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
		                	</c:if>
		                	<c:if test="${member == null }">
		                	<div style="margin-top:30px;">
		                		<input type="checkbox" style="float:right; margin:5px 130px 0px 0px;" id="temperature" name="temperature" value="pass1">
		                		<label  for="check1">나의 체온은 37.5도 이하입니다.</label>
		                	</div>
		                	<div>
		                		<input type="checkbox" style="float:right; margin:5px 130px 0px 0px" id="cough" name="cough" value="pass2">
		                		<label for="check1">기침 및 호흡곤란 증상이 없습니다.</label>
		                	</div>
		                	</c:if>
                		</form>
                		
                	
						<!-- <p class="text">로그인하고<br><span class="color">출석보상</span> 받으세요!</p>
						<a href="session/loginPage">로그인</a>
						<a href="session/myPage">마이페이지</a>
						<a href="session/joinPage">회원가입</a>
						<a href="board/list">조회</a> -->
						
						<!-- <form action="./session/loginOk" method="post">
	                		<table>
	                			<tr>
	                				<td><input type="text" name="id" required placeholder="아이디"></td>
	                				<td rowspan="2"><button type="submit" style=" padding: 18px 15px;">로그인</button></td>
	                			</tr>
	                			<tr>
	                				<td><input type="password" name="pw" required placeholder="비밀번호"></td>
	                			</tr>
	                		</table>
                		</form> -->
                	
						<!-- <p class="text">로그인하고<br><span class="color">출석보상</span> 받으세요!</p>
						<a href="session/loginPage">로그인</a>
						<a href="session/myPage">마이페이지</a>
						<a href="session/joinPage">회원가입</a>
						<a href="board/list">조회</a> -->
					</div>
			</div>
        </div>
    </section> --%>
    
    <%@include file="include/footer.jsp"%>
    
    <!-- ***** About Area Ends ***** -->

	<%-- <h2>메인 페이지</h2>
	
	<img src="${pageContext.request.contextPath}/resources/img/hajeongwo.jpg"><br>
	<a href="session/loginPage">로그인</a>
	<a href="session/myPage">마이페이지</a>
	<a href="session/joinPage">회원가입</a>
	<a href="board/list">조회</a> --%>

</body>
</html>
