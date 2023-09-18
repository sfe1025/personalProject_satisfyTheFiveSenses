<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
<script>
$(document).ready(function(){
	
	

  

}) 
</script>

<body>

	<input type="text" name="cartNo" id="cartNo">
	
	<input type="hidden" id="eeee" name="eeee">
	
	<div id="reviewView${list.cartNo}">
		<select name="rvScore" id="rvScore">
							        <option value="1">1점</option>
							        <option value="2">2점</option>
							        <option value="3">3점</option>
							        <option value="4">4점</option>
							        <option value="5" selected>5점</option>
							    </select>
								<input type="text" id="rvContent" name="rvContent" placeholder="구매 후기를 솔직하게 작성해주세요.">
								<button type="button" id="btn">제출</button>
<%-- 								<button type="submit" id="sendReview${list.cartNo}">작성</button>
 --%>							</div>
 
 <script>
	 $("#btn").click(function() {
		  
		 alert(opener.document.getElementById("cartNo").value);
		 
		 //window.opener.fnCall();
		 
		 //$(opener.document).find("#ee").click();
		 
		 
		 /* 
		  var target = document.getElementById("rvScore");
		  
		  
		  
		  //alert(target.options[target.selectedIndex].value);
		  
		 $("#rvScore", parent.opener.document).val(target.options[target.selectedIndex].value);
		 $("#rvContent", parent.opener.document).val($("#rvContent").val());
		  
		  //opener.document.getElementById("ee").click();
		 opener.document.getElementById("sendReview${list.cartNo}").click();
		 
		 window.self.close(); */
	 })
 </script>

</body>
</html>