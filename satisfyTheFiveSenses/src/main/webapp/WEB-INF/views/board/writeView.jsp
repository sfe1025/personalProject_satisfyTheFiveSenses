<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags" %>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	 	<title>혼밥탈출 작성게시판</title>
	 	
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
	<script type="text/javascript">/* 
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function maxLengthCheck(object){
		    if (object.value.length > object.maxLength){
		      object.value = object.value.slice(0, object.maxLength);
		    }    
		  } */
		
	</script>
	<body>
	
	
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style="margin-top:50px">
				<h1>QnA 작성게시판</h1>
			</header>
			 
			<%-- <div style="margin-top:20px">
				<%@include file="nav.jsp" %>
			</div> --%>
			<section id="container" style="width:70%">
				<form role="writeForm" method="post" action="/controller/board/write">
							<c:if test="${member.userId != null }">
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">제목</label>
								<input type="text" id="title" name="title" class="form-control" required />
							</div>
							
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">작성자</label>
								<input type="text" id="writer" name="writer" class="form-control" value="${member.userName}" readonly="readonly" />
							</div>
							<%-- <div class="form-group">
								<label for="location" class="col-sm-2 control-label">작성일</label>
								<input type="text" id="location" name="location" class="form-control" value="${list. }" required/>
							</div> --%>
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">내용</label>
								<textarea id="content" name="content" class="form-control" required></textarea>
							</div>
							<div>
								<input type="hidden" id="userId" name="userId" value="${member.userId }">
							</div>
							
							<%-- <div class="form-group">
								<input type="hidden" id="userId" name="userId" class="form-control" value="${member.userId}" readonly="readonly" />
							</div> --%>
							
								<%-- <tr>
									<td>
										<label for="title">제목</label><input type="text" id="title" name="title" class="chk" required title="제목을 입력하세요."/>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">내용</label><textarea id="content" name="content" class="chk" required title="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="mp">최대 인원</label><input type="number" id="mp" name="mp" class="chk" maxlength="1" oninput="maxLengthCheck(this)" required title="최대 인원을 입력하세요.">
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">작성자</label><input type="text" id="writer" name="writer" title="작성자를 입력하세요." value="${member.userName}" readonly="readonly"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="userId"></label><input type="hidden" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
									</td>
								</tr> --%>
								<div>			
										<button style="float:right" type="submit">작성</button>
								</div>
							</c:if>
							<c:if test="${member.userId == null }">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>	
				</form>
				</section>
			<hr />
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
</html>