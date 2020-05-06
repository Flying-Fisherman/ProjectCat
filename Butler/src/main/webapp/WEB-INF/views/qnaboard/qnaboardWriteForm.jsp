<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
    <meta charset="utf-8">
    <title>執事の条件</title>
    
  <script>
			function writeConfirm()
			{
				var title = document.getElementById("title1");
				var content = document.getElementById("content");
				if(title.value.length==0)
				{
					alert("タイトルを入力してください。");
					return false;
				}
				if(content.value.length==0)
				{
					alert("内容を入力してください。");
					return false;
				}
				return confirm("登録しますか。"); //확인 누르면 true 아니오 누르면 false
			}
		</script>
        
</head>
<body>

	<input type="hidden" value="QnaData" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 
	
  <form action="<c:url value = '/qnaboard/write'/>" method="post" enctype="multipart/form-data">
	<div class='jumbotron' style="margin-left: 25%; margin-right: 25%; margin-top: 20px; background-color: #331C13;">
	<div style="font-size: 24px; color: white;">Q&A登録</div>
	<table style="margin-top: 20px;margin-left: auto; margin-right: auto; border-radius: 10px;background-color: #6F3B29; width: 90%; border-color: black;" class='table'>
		<tr>
			<th style="text-align: center;color: white;  width: 20%;">タイトル</th>
			<td>
				<input type = "text" style="color: black; width:100%;" name = "title" id = "title1" placeholder = "タイトル" required = "required">
				<input type = "hidden" value = "${sessionScope.userid}" name = "userid"/>
			</td>
			<!-- required 를 쓰면 값이 무조건 들어가야 넘어간다 -->
		</tr>
		<tr>
			<th style="text-align: center;color: white;  width: 20%;">ファイル</th>
			<td>
				<input type = "file" name = "uploadFile" value = "ファイルを選択" style="color: white; width:100%;" class='btn btn-default'>
			</td>
		</tr>
		<tr>
			<th style="text-align: center;color: white;  width: 20%;">内容</th>
			<td><textarea cols="10" rows="10" placeholder = "内容" name = "content" id = "content" style="width: 500px;color: black; width:100%; resize: none;"></textarea> </td>
		</tr>
		<tr>
			<td class="right" colspan="2" style="text-align: center;color: black;">
				<input type = "submit" value = "投稿" onclick ="return writeConfirm()" class='btn btn-primary'>
				<input type = "reset" value = "リセット" class='btn btn-primary'>
				<input type = "button" value = "戻る" onclick = "history.back(-1);" class='btn btn-info'>
			</td>
		</tr>
	</table>
	</div>
</form>

	 <jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 	
	

</body>
</html>