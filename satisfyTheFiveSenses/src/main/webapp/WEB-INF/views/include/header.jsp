<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header file</title>

	<style>
	.nav li{ border-left: solid 1px #E6E6E6; }
	.mod-header_headerNavList{
	display: inline-block;
	position: relative;
	height: 18px;
	font-size: 12px;
	margin: 0 0 7px 8px;
	padding: 7px 0 0 8px;
	vertical-align: bottom;
	}
	.lp{
	margin-left:100px;
	}
	</style>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo-klassy-cafe.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl-carousel.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.css">
    

</head>
<body>

	<header class="header-area header-sticky" style="background-color:#19F3A7">
	<div>
	<form name="searchForm">
		<a href="/controller/" id="tt" style="margin-left:220px">
		<img id="tt2" width="80" height="80" src="${pageContext.request.contextPath}/resources/img/logo10.JPG">
		</a>
		<ul class="nav" style="float:right; margin-right:10px">
		<c:if test="${member == null }">
			<li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/member/loginView" class="active">로그인</a></li>
		    <li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/member/registerView">회원가입</a></li>
		</c:if>
		<c:if test="${member.userStatus == 1}">
			<li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/board/pdRegistView">물품등록</a></li>
			<li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/cart/manageStateView">주문관리</a></li>
			<li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/board/manageStockView">재고관리</a></li>
		</c:if>
		<c:if test="${member.userStatus == 0}">
		    <li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/cart/list">장바구니</a></li>
		    <li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/cart/stateView">주문배송</a></li>
		 </c:if>
		    <li class="mod-header_headerNavList"><a href="${pageContext.request.contextPath }/board/customerService">Q&A</a></li>
		</ul>
		
		<span style="margin-left:200px">
            <input id="pdName" name="pdName" type="text">
            <img id="ee" width="30" height="30" onclick="ee();" src="${pageContext.request.contextPath}/resources/img/searchIcon.png">       
		</span>
		<script>
		
		 $("#ee").click(function(){
				var formObj = $("form[name='searchForm']");
				var pdName = document.getElementById('pdName').value;
				
			
				formObj.attr("action", "/controller/board/list?eee=" + pdName);
				formObj.attr("method", "get");
				formObj.submit();
		    })
   
		</script>
		</form>
	</div>
	
		        <%-- <div class="container">
		            <div class="row">
		                <div class="col-12">
		                    <nav class="main-nav">
		                        <!-- ***** Logo Start ***** -->
		                        <a href="/controller/" id="tt" class="logo" style="margin-top:25px;">
		                            <img id="tt2" src="${pageContext.request.contextPath}/resources/img/HB-logo.PNG" align="klassy cafe html template">
		                        </a>
		                        <!-- ***** Logo End ***** -->
		                        <!-- ***** Menu Start ***** -->
		                        <ul class="nav">
		                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath }" class="active">Home</a></li>
		                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath }/board/purpose">사이트의 목적</a></li>
		                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath }/board/list">혼밥탈출</a></li>
		                           	
		                        <!-- 
		                            <li class="submenu">
		                                <a href="javascript:;">Drop Down</a>
		                                <ul>
		                                    <li><a href="#">Drop Down Page 1</a></li>
		                                    <li><a href="#">Drop Down Page 2</a></li>
		                                    <li><a href="#">Drop Down Page 3</a></li>
		                                </ul>
		                            </li>
		                        -->
		                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath }/board/rList">추천 맛집</a></li>
		                            <c:if test="${member != null }">
		                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath }/member/memberUpdateView">마이페이지</a></li> 
		                            </c:if>
		                            <!-- <li class="submenu">
		                                <a href="javascript:;">Features</a>
		                                <ul>
		                                    <li><a href="#">Features Page 1</a></li>
		                                    <li><a href="#">Features Page 2</a></li>
		                                    <li><a href="#">Features Page 3</a></li>
		                                    <li><a href="#">Features Page 4</a></li>
		                                </ul>
		                            </li>
		                            <li class=""><a rel="sponsored" href="https://templatemo.com" target="_blank">External URL</a></li>
		                            <li class="scroll-to-section"><a href="#reservation">Contact Us</a></li>  -->
		                        </ul>        
		                        <a class='menu-trigger'>
		                            <span>Menu</span>
		                        </a>
		                        <!-- ***** Menu End ***** -->
		                    </nav>
		                </div>
		            </div>
		        </div> --%>
    </header>
    <div id="header_02">
		<ul class="nav">
			<li class="lp"><a href="${pageContext.request.contextPath }/board/list?pdCategory=1" class="active">면류</a></li>
			<li class="lp"><a href="${pageContext.request.contextPath }/board/list?pdCategory=2">과자</a></li>
			<li class="lp"><a href="${pageContext.request.contextPath }/board/list?pdCategory=3" class="active">음료</a></li>
			<li class="lp"><a href="${pageContext.request.contextPath }/board/list?pdCategory=4" class="active">빵</a></li>
			<li class="lp"><a href="${pageContext.request.contextPath }/board/list?pdCategory=5" class="active">아이스크림</a></li>
		</ul>
	</div>

</body>
</html>