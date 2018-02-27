<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Fuji-Helper</title>
<jsp:include page="../common/common.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<%
	if(session.getAttribute("fujiUser")==null){
		response.sendRedirect("/fuji/login");  
	}
%>
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../fuji/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->


	<div class="container">

		<form id="info" name="info" action="/fuji/phoneWriteSubmit">
		
		<input type="hidden" id="userId" name="userId">


			<div class="col-lg-12">


				<div class="col-lg-12">

					<div class="col-sm-2" style="display: inline-block">
						<div class="form-group">
							<label for="userName">이름</label> <input type="text"
								class="form-control" id="userName" name="userName"
								placeholder="이름" onkeydown="autoComplete();">
						</div>
					</div>

					<div class="col-sm-3" style="display: inline-block">
						<div class="form-group">
							<label for="userField">부문</label> <input type="text"
								class="form-control" id="userField" name="userField" placeholder="부문">
						</div>
					</div>
					<div class="col-sm-3" style="display: inline-block">
						<div class="form-group">
							<label for="userTeam">팀</label> <input type="text"
								class="form-control" id="userTeam" name="userTeam" placeholder="팀">
						</div>
					</div>

					<div class="col-sm-3" style="display: inline-block">
						<div class="form-group">
							<label for="userGroup">담당</label> <input type="text"
								class="form-control" id="userGroup" name="userGroup" placeholder="담당">
						</div>
					</div>

					<div class="col-lg-12"></div>

				</div>

				<div class="col-lg-12">
					<div class="col-lg-3" style="display: inline-block">
						<div class="form-group">
							<label for="userPhone">전화번호</label> <input type="text"
								class="form-control" id="userPhone" name="userPhone" placeholder="전화번호">
						</div>

					</div>
				</div>

				<div class="col-lg-12">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<div class="form-group">
							<label for="userDescription">전화내용</label>
							<textarea class="form-control" id="infoDescription" name="infoDescription" rows="3"></textarea>
						</div>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="col-lg-11"
						style="display: inline-block; text-align: right">
						<button type="button" class="btn btn-info"
							style="display: inline-block" id="submitBtn" onclick="submitOnClick()">등록</button>
						<button type="button" class="btn btn-warning"
							style="display: inline-block" id="cancelBtn" onclick="cancelOnClick()">취소</button>
					</div>


				</div>


			</div>

		</form>


		<!-- 푸터 -->
		<jsp:include page="../fuji/footer.jsp"></jsp:include>
		<!-- 푸터 끝 -->
	</div>
</body>



<script>
	var autocomplete_text = new Array();
	
	
	<c:forEach items="${userNmInfo}" var="userNmInfo" varStatus="status">
	
		autocomplete_text[${status.index}] = "${fn:trim(userNmInfo)}";
	</c:forEach>
	
	for (var i=0; i<autocomplete_text.length; i++){
		
		autocomplete_text[i].replace(/\s/g,'');
	}
	
	

	function autoComplete() {
		

		$("#userName").autocomplete({
			source :autocomplete_text,
			
			select: function( event, ui ) {
				
				var userName = ui.item.label;
				
				$.ajax({
					url : "/fuji/phoneAjax",
					dataType : "json",
					type : "GET",
					data : {
						"userName" : userName
					},
					success : function(data) {
						
						$("#userField").val(data.field_name.replace(/\s/g,''));
						$("#userTeam").val(data.team_name);
						$("#userGroup").val(data.group_name);
						$("#userPhone").val(data.user_phone.replace(/\s/g,''));
						$("#userId").val(data.user_id);
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "error:" + error);
					}
				});
				
	            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
	        },
	        focus: function( event, ui ) {
	        	return false; 
	        }


		});

	}
	
	
	function submitOnClick(){
		
		$("#info").submit();
		
	}
	
	function cancelOnClick(){
		
		$("#userField").val("");
		$("#userTeam").val("");
		$("#userGroup").val("");
		$("#userPhone").val("");
		$("#userId").val("");
		$("#userName").val("");
		$("#infoDescription").val("");
	}
</script>

</html>


