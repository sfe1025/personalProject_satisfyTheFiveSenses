<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
    <style>
    	div#tt img {
    	width: 600px;
    	float: left;
    }
    	a.logo img {
    	margin-top: 20px;
    	}
    </style>
    
    
    
</head>
<body>

<%
		if(session.getAttribute("userid")==null){
			out.println("<a href='loginPage'>로그인</a>");
		}else{
			String userid = (String)session.getAttribute("userid");
			out.println(userid+"님 반갑습니다.<br>");
			out.println("<a href='logout'>로그아웃</a>");
		}
	
	%>

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
    <section class="section" id="about">
        <div class="container">
        	<div id="tt">
                <img src="${pageContext.request.contextPath}/resources/img/hajeongwo.jpg"><br>
                	<div class="login_box" style="float:right; margin-top:100px;">
                		<table>
                			<tr>
                				<td><input type="text" name="id" required placeholder="아이디"></td>
                				<td rowspan="2"><input type="button" value="로그인" style=" padding: 18px 15px;" onclick="location.href='session/loginOk'"></td>
                			</tr>
                			<tr>
                				<td><input type="password" name="pw" required placeholder="비밀번호"></td>
                			</tr>
                		</table>
                	
						<!-- <p class="text">로그인하고<br><span class="color">출석보상</span> 받으세요!</p>
						<a href="session/loginPage">로그인</a>
						<a href="session/myPage">마이페이지</a>
						<a href="session/joinPage">회원가입</a>
						<a href="board/list">조회</a> -->
					</div>
			</div>
        </div>
    </section>
    <!-- ***** About Area Ends ***** -->
 <%@include file="include/footer.jsp"%>
</body>
</html>
