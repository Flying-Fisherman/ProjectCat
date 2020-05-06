<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>執事の条件</title>
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<input type="hidden" value="userInfo" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 
	
	<script type="text/javascript">

		$(function() {
			var tempID = '${requestScope.result.userid}';
			var tempName = '${requestScope.result.username}';
			var tempPhone = '${requestScope.result.phone}';

			tempID = changeData(tempID);
			tempName = changeData(tempName);
			tempPhone = changePhone(tempPhone);
			
			$('#tempID').text(tempID);
			$('#tempID2').text(tempID);
			$('#tempName').text(tempName);
			$('#tempPhone').text(tempPhone);

			$('#insertCat').on("click", function(){
		       	var catname = $('#catname').val();
		       	var userid = '${requestScope.result.userid}';
            	var cat_birth = $('#cat_birth').val();
            	
            	$.ajax({
						url : "insertCat",
						type : "post",
						data : {
							catname : catname
							,userid : userid
							,cat_birth : cat_birth
						},
						success : function(data){
							alert("猫が登録されました。");
							$('#catList').remove();
				            var str = '<TR>';
				            var list = new Array(); 
				            list = [];
				           /*  $.each(data , function(i){
					            var temp = i + 1;
				                str += '<TD>' + temp + '</TD><TD>' + data[i].catname + '</TD><TD>'
				                + data[i].cat_birth + '</TD>';
				                str += '</TR>';
				           });
				           $("#newCatList").append(str); */
				           location.href = "userInfo";   
						},
						error : function(){
						
						}
					});
        								     							
			});
		});

		var infoModify = function() {
			if($('#tempPWData').val() == null || $('#tempPWData').val() != '${requestScope.result.userpwd}') {
				alert('もう一度確認してください');
				return false;
			}
			location.href = "/project/member/member_Modify"
		}

		function changeData(data) {
			var temp = String(data).length;
			var str = ""
			for (var i = 0 ; i < parseInt(temp) - 2 ; i++) {
				str += "*"	
			};

			data = String(data).replace( String(data).substr(1, parseInt(temp - 2)) , str);

			return data;
		}

		function changePhone(data) {
			var temp = String(data).length;
			var str = ""
			for (var i = 3 ; i < parseInt(temp) - 3 ; i++) {
				str += "*"	
			};

			data = String(data).replace( String(data).substr(4, parseInt(temp) - 7) , str);

			return data;
		}

		
    </script>
    
    <c:if test="${requestScope.result_val == true}">
		<script type="text/javascript">
			alert('修正に成功しました。');
		</script>
	</c:if>
	<c:if test="${requestScope.result_val == false}">
		<script type="text/javascript">
			alert('修正に失敗しました。');
		</script>
	</c:if>
	
	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron" style='background-color: #351F15; margin-top: 30px;'>
			<div Style="text-align: center; ">
				<h1 style='color: #D3D2D1;'>会員情報</h1>
			</div>
			<div class="container">
				<div class="" style="align-items: center;">
					<table class="table table-hover table-bordered infoTable" style="margin: auto; width: 80%;">
						<tr>
							<th class="infoName" style='color: #D3D2D1;'>ユーザID</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempID" style="margin-bottom: 5px;"></p>
							</td>
						</tr>

						<tr>
							<th class="infoName" style='color: #D3D2D1;'>お名前</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempName" style="margin-bottom: 5px;"></p>
							</td>
						</tr>

						<tr>
							<th class="infoName" style='color: #D3D2D1;'>電話番号</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempPhone" style="margin-bottom: 5px;"></p>
							</td>
						</tr>
					</table>
					
					<div align="center"><p style="font-size: 120%; color: gray;">全ての情報は本人認証の後、表示されます。</p></div>
				</div>
				<div style="margin-left: 102px; margin-top: 20px;" >
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle='modal' data-target='#pwCheckModal'>情報修正</button>
				</div>
			</div>
		</div>

	</div>
	
	<div class="container">
		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron" style='background-color: #351F15; margin-top: 30px;'>
			<div Style="text-align: center; ">
				<h1 style='color: #D3D2D1;'>飼い猫の情報</h1>
				＊猫の名前をクリックして情報の変更ができます。
			</div>
			
			<div id="cat" align="center">
				<div class="" style="align-items: center;">
					<table style="margin: auto; width: 80%; color: white;">
					<thead>
						<tr>
							<th>登録番号</th>
							<th>名前</th>
							<th>生年月日</th>
						</tr>
					</thead>
					<tbody id = "catList">
					<c:forEach items="${requestScope.list }" var="board" begin="1" step="1" varStatus="status">
					    <tr>
					      <th scope="row">${status.index}</th>
					      <th>
					      	<a href = "<c:url value = '/catRead?cat_no=${board.cat_no}'/>">
					      		${board.catname }
					      	</a>
					      </th>
					      <th>${board.cat_birth}</th> 
					    </tr>
				    </c:forEach>
					</tbody>
					
					<tbody id = "newCatList">
					
					
						
					</tbody>
					</table>
				</div>
			</div>
			</div>
	</div>
	
	<div class="container">
		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron" style='background-color: #351F15; margin-top: 30px;'>
			<div Style="text-align: center; ">
				<h1 style='color: #D3D2D1;'>飼い猫の登録</h1>
				<h2 style="color: #D3D2D1;">猫の情報を入力してください。</h2>
			</div>
			<div class="container">
				<div class="" style="align-items: center;">
					<table class="table table-hover table-bordered infoTable" style="margin: auto; width: 80%;">
						<tr>
							<th class="infoName" style='color: #D3D2D1;'>猫の名前</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<input type = "text" id="catname" name="catname" required="required">
							</td>
						</tr>

						<tr>
							<th class="infoName" style='color: #D3D2D1;'>猫の生年月日</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<input type = "date" id="cat_birth" name="cat_birth" required="required">
							</td>
						</tr>
					</table>
				</div>
				<div style="margin-left: 102px; margin-top: 20px;" >
					<button type="button" class="btn btn-primary btn-lg"
						id = "insertCat">登録</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
		<c:choose>
			<c:when test="${sessionScope.userid != null}">
	  
					<div style="position: fixed; right: 20px; bottom: 20px;">
						<a href="javascript:void chatChannel()">
							  <img src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png"/ style="width: 120px;">
							</a>
					</div>
			</c:when>
		</c:choose>	

   <!-- 카카오 챗봇 을 위해 추가 -->
  	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('bcb304f051b2968e7a9473de010e09a0');
    function chatChannel() {
      Kakao.Channel.chat({
        channelPublicId: '_hHcGxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
      });
    }
  //]]>
</script>

<div class="modal fade" id="pwCheckModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">PASSWORD 確認</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div class="modal-body">
						<p>PASSWORDをもう一度入力してください</p>
						<input type="password" id='tempPWData'><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="return infoModify()">Check</button>
					</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
<!-- Modal end -->
	
	 <jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 

</body>
</html>