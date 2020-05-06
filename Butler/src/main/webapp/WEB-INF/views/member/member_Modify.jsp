<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>執事の条件</title>


<script type="text/javascript">
	function haveValue() {
		if(!confirm("修正しますか。")) {
			return false;
		}
		return true;
	}
</script>
</head>


<body>

	<input type="hidden" value="userInfo" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 

<form action="<c:url value='/member/member_ModifyProcess'/>" method="POST">
	<div class="container">
		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron" style="background-color: #351F15; margin-top: 20px;">
		
			<div style="text-align: center;">
				<h1 style="color: white;">会 員 情 報 修 正</h1>				
				<h3 style="color: white;">基本情報のみ修正可能です。</h3>
				<h3 style="color: white;">その他の情報の修正はQ&Aからお問い合わせください。</h3>
			</div>
			
			<div class="container"  style="text-align: center;">
				<div>
					<table class="table table-hover table-bordered infoTable">
						<tr>
							<th class="infoName" style="color: white; font-size: 25px; vertical-align: middle;">ID</th>
							<td style="vertical-align: middle; background-color: white;">
								<div class="container col-md-12">
									<input type="text" class="form-control" name="userid" id="inputid"
									value="${requestScope.result.userid}" readonly="readonly">
								</div>
							</td>
						</tr>

						<tr>
							<th class="infoName" style="color: white; font-size: 25px; vertical-align: middle;">お名前</th>
							<td style="vertical-align: middle; background-color: white;">
								<div class="container col-md-12">
									<input type="text" value="${requestScope.result.username}" class="form-control" name="username" id="inputName" placeholder="名前を入力してください" required="required">
								</div>
							</td>
						</tr>

						<tr>
							<th class="infoName" style="color: white; font-size: 25px; vertical-align: middle;">電話番号</th>
							<td style="vertical-align: middle; background-color: white;">
								<div class="container col-md-12">
									<input type="text" class="form-control" name="phone" id="inputPhone" placeholder="-を含めて入力してください。" required="required" value="${requestScope.result.phone}">
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="form-group">
					<input type="submit" value="修正" onclick="return haveValue()"
					class="btn btn-primary btn-lg">
				</div>
				
			</div>
		</div>
	</div>
</form>
	
	<jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 

</body>
</html>