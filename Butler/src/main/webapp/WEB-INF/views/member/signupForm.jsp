<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>執事の条件</title>

 
  
	<script>
		function idCheckForm() { 
			open("<c:url value='idCheckForm'/>", "_blank", "width=500, height=200");
		}
	</script>

</head>

<body>

	<input type="hidden" value="home" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 
 
 	
		    <div class="jumbotron" style="background-color: #331C13; margin: 20px 30% 20px 30%;">
		    	<div class="container" style="text-align: center;">
					<div class="" style="margin: 0 auto;">
		   				<form action="<c:url value='signup'/>" method="post">
							<table style="margin: 0 auto;" >
								<tr>
									<th style="color: white;">ユーザID</th>
									<td>
										<input type="text" id="userid" name="userid" required="required" readonly="readonly" class="form-control input-lg" placeholder="Username">
									</td>
									<td>
										<input type="button" value="IDチェック" onclick="idCheckForm()" class="btn btn-primary">
									</td>
								</tr>
								<tr>
									<th style="color: white;">パスワード</th>
									<td>
										<input type="password" name="userpwd" required="required" class="form-control input-lg" placeholder="Password">
									</td>
								</tr>
								
								<tr>
									<th style="color: white;">氏名</th>
									<td>
										<input type="text" name="username" required="required" class="form-control input-lg" placeholder="お名前">
									</td>
								</tr>								
								<tr>
									<th style="color: white; width: 100px;">電話番号</th>
									<td>
										<input type="tel" name="phone" required="required" class="form-control input-lg" placeholder="携帯番号"
										pattern="(010)-\d{3,4}-\d{4}" title="例)010-0000-0000">
										
									</td>
								</tr>
								
								<tr>
									<th colspan="3" style="text-align: center;">
										<input type="submit" id="signupbtn" value="アカウント登録" disabled="disabled" class="btn btn-primary">
										<input type ="button" value = "キャンセル" onclick = "history.back(-1);" class="btn btn-primary">
									</th>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>

  
<jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 	

</body>

</html>
