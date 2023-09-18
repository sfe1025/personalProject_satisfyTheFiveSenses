<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	 	<title>혼밥탈출 상세보기 게시판</title>
	 	
	 	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
	 	
	 	<style>
		.container {
			margin-top:5px
		}
		header {
			text-align:center;
			margin-top:50px;
		}
		</style>
	 	
	</head>
	
	<script type="text/javascript">
		/* $(document).ready(function(){
			var formObj = $("form[name='readForm']");
			var mp = "<c:out value='${read.mp}'/>";
			var cp = "<c:out value='${read.cp}'/>";
			var writerId = "<c:out value='${read.userId}'/>";
			var userId = "<c:out value='${member.userId}'/>";
			
			if(writerId == userId){
				$("#join_btn").hide();
			} else {
				$("#update_btn").hide();
				$("#delete_btn").hide();
			}
			
			// 참여하기
			$(".join_btn").on("click", function(){
				
				if(cp >= mp){
					alert("인원이 모두 찼습니다.");
					return false;
				}					
				
				var joinYN = confirm("참여하시겠습니까?");
				
				if(joinYN == true) {
					formObj.attr("action", "/controller/board/join");
					formObj.attr("method", "get");
					formObj.submit();
					}
				//location.href = "/controller/board/join";
						    
			})
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/controller/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				
				if(deleteYN == true) {
				formObj.attr("action", "/controller/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
			
			location.href = "/controller/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		}) */
	</script>
	<body>
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style="margin-top:50px">
				<h1>QnA 상세보기</h1>
			</header>
			 
			<%-- <div>
				<%@include file="nav.jsp" %>
			</div> --%>
			
			<section id="container" style="width:70%">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${read.userId}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
				</div>
				<div>
					<!-- <button type="submit" class="update_btn" id="update_btn">수정</button>
					<button type="submit" class="delete_btn" id="delete_btn">삭제</button>
					<button type="submit" class="list_btn" id="list_btn">목록</button>
					<button type="submit" class="join_btn" id="join_btn">참여하기</button> -->
				</div>
			</section>
			<hr />
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
</html>