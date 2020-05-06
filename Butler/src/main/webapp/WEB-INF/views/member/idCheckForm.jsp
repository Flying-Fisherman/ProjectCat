<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IDチェック</title>
	    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
	<script>
		function closeFunc() {
			close();
		}

		function submitId() {
			var useridDoc = opener.document.getElementById("userid");
			var signupBtnDoc = opener.document.getElementById("signupbtn");
			useridDoc.value = "${userid}";
			signupBtnDoc.removeAttribute("disabled");
			close();
		}
	</script>
	
	<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/business-casual.min.css'/>" rel="stylesheet">

<!-- Style & Common Css -->
<link href="<c:url value='/resources/css/common.css'/>" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src = "<c:url value = '/resources/js/jquery-3.4.1.js'/>"></script>
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	
</head>

<body>
<div style="text-align: center; margin: 10px 10% 10px 10%;">
	<h1 style="color: white;">IDチェック</h1>
	<form action="<c:url value='checkid' />" method="post">
		<input type="text" placeholder="使用するIDを入力してください。" name="userid" value="${userid}" required="required" style="width: 70%; margin-bottom: 10px;"><br>
		<input class='btn btn-primary' type="submit" value="チェック">
		<input class='btn btn-primary' type="button" id="btn" value="入力" onclick="submitId()" disabled="disabled">
		<input class='btn btn-info' type="button" value="キャンセル" onclick="closeFunc()">
	</form>
	
	<c:choose>
		<c:when test="${checkResult == true}">
			<p>このIDは使用可能です。</p>
			<script>
				document.getElementById("btn").removeAttribute("disabled");
			</script>
		</c:when>
		
		<c:when test="${checkResult == false}">
			<p>このIDは使用できません。</p>
		</c:when>
	</c:choose>
</div>
</body>

</html>
