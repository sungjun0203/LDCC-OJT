<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>
<jsp:include page="../common/common.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css'>

<link rel="stylesheet" href="/resources/css/style.css">
</head>

<script>
	$(function() {
		$("#datepicker").datepicker();
		$('#datepicker').datepicker('option', 'dateFormat', 'yy-mm-dd');
		$("#datepicker").datepicker('setDate', new Date());
	});
</script>

<body>

	<!-- 헤더 -->
	<jsp:include page="../fuji/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->


	<div class="container">

		<div class="col-lg-12 row">
			<div class="col-lg-6"></div>
			<div class="col-lg-4">
				<section class="webdesigntuts-workshop">
						<input type="search" placeholder="검색">
						<button>Search</button>
				</section>

			</div>
			<div class="col-lg-2" style="text-align: right">
				<div class="form-group has-success">
					<input type="text" class="form-control is-valid" id="datepicker"
						style="text-align: center" onchange="dayChange()">
				</div>
			</div>
		</div>


		<table class="table table-hover">
			<thead>
				<tr class="table-info" style="text-align: center">
					<th scope="col" style="width: 5%">번호</th>
					<th scope="col" style="width: 15%">담당</th>
					<th scope="col" style="width: 10%">이름</th>
					<th scope="col" style="width: 10%">전화번호</th>

					<th scope="col" style="width: 10%">시간</th>
					<th scope="col" style="width: 50%">내용</th>
				</tr>
			</thead>
			<tbody id="tBodyHTML">

				<c:forEach var="fujiInfo" items="${fujiInfoList}" varStatus="status">
					<tr class="table-light" style="text-align: center">
						<th scope="row" style="width: 5%">${status.count}</th>
						<td style="width: 15%">${fujiInfo.groupName}</td>
						<td style="width: 10%">${fujiInfo.userName}</td>
						<td style="width: 10%">${fujiInfo.userPhone}</td>
						<td style="width: 20%">${fn:substring(fujiInfo.infoTime,0,16)}</td>
						<td style="width: 50%">${fujiInfo.infoDescription}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>

		<!-- 푸터 -->
		<jsp:include page="../fuji/footer.jsp"></jsp:include>
		<!-- 푸터 끝 -->
	</div>
</body>



<script>


function dayChange(){
	
	var check = $("#datepicker").val();
	$("#tBodyHTML").empty();
	
	
}
	
</script>

</html>


