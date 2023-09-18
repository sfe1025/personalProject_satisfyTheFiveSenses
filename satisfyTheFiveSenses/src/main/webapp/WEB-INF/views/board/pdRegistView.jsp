<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	<title>물품등록 관리자 페이지</title>
	 	
	 	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
	 	
	 	<style>
		.container {
			margin-top:5px
		}/* 
		header {
			text-align:center;
			margin-top:50px;
		} */
		</style>
	 	
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".regist_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/pdRegist");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
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
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
	</script>
	<body>
	
	<%@include file="../include/header.jsp"%>
	
		<div class="container">
			<header style="text-align:center; margin-top:50px;">
				<h1>물품등록 관리자 페이지</h1>
			</header>
			 
			<%-- <div style="margin-top:20px">
				<%@include file="nav2.jsp" %>
			</div> --%>
			
			<section id="container" style="width:60%">
				<form role="writeForm" method="post" action="/controller/board/pdRegist" enctype="multipart/form-data">
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">물품명</label>
								<input type="text" id="pdName" name="pdName" class="form-control" required/>
							</div>
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">카테고리</label>
								<select id="pdCategory" name="pdCategory" style="width:50px">
									<option value="1">면류</option>
									<option value="2">과자</option>
									<option value="3" selected>음료</option>
									<option value="4">빵</option>
									<option value="5">아이스크림</option>
								</select>
							</div>
							<!-- <div>
								<input type="file" name="file">				
								<button class="fileAdd_btn" type="button">이미지 추가(목록 보기용)</button>	
							</div> -->
 							<div>
 								<input type="file" name="imgFile" />
								<input type="submit" value="이미지저장"/>	
 							</div>
 
 
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">간단한 정보(목록 보기용)</label>
								<textarea id="pdSimple" name="pdSimple" class="form-control" required></textarea>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">상세 정보(상세 보기용)</label>
								<textarea id="pdDetail" name="pdDetail" class="form-control" required></textarea>
							</div>
							<!-- <div>						
								<button class="fileAdd_btn" type="button">상세 이미지 추가(상세 보기용)</button>	
							</div> -->
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">입고 개수</label>
								<textarea id="pdStock" name="pdStock" class="form-control" required></textarea>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">물품 가격</label>
								<textarea id="pdPrice" name="pdPrice" class="form-control" required></textarea>
							</div>
							<div>						
										<button class="regist_btn" type="submit">등록</button>
							</div>
							<%-- <div class="form-group">
								<label for="writer" class="col-sm-2 control-label">작성자</label>
								<input type="text" id="writer" name="writer" class="form-control" value="${member.userName}"  readonly="readonly"/>
							</div>
							<div class="form-group" id="fileIndex">
							</div>
							<input type="hidden" id="userId" name="userId" value="${member.userId}" readonly="readonly"/> --%>
								<%-- <tr>
									<td>
										<label for="title">가게 이름</label><input type="text" id="shopName" name="shopName" class="chk" title="가게 이름을 입력하세요."/>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">가게 위치</label><input type="text" id="location" name="location" class="chk" title="가게 위치를 입력하세요."/>
								</tr>
								<tr>
									<td>
										<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">작성자</label><input type="text" id="writer" name="writer" title="작성자를 입력하세요." value="${member.userName}" readonly="readonly" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="file" name="file">
									</td>
								</tr> --%>
								<!-- <div>						
										<button class="write_btn" type="submit">작성</button>
										<button class="fileAdd_btn" type="button">파일추가</button>	
								</div> --><%-- 
							<c:if test="${member.userId == null }">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>	 --%>
				</form>
			</section>
			<hr />
		</div>
		<%@include file="../include/footer.jsp"%>
	</body>
</html>