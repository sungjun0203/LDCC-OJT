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
					<input type="search" placeholder="검색" id="searchInput"
						name="searchInput" onkeydown="searchInputForm()">
					<button onclick="searchBtn()">Search</button>
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
						<td style="width: 10%">${fujiInfo.userName}
							${fujiInfo.userPosition}</td>
						<td style="width: 15%">${fujiInfo.userPhone}</td>
						<td style="width: 15%">${fn:substring(fujiInfo.infoTime,0,16)}</td>
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
	function tableWrite(data) {

		$("#tBodyHTML").append(
				'<tr class="table-light" style="text-align: center"></tr>')

		for (var i = 0; i < data.length; i++) {

			var date = new Date(data[i].infoTime);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hour = date.getHours();
			var min = date.getMinutes();
			var sec = date.getSeconds();
			
			var retVal = year + "-" + (month < 10 ? "0" + month : month) + "-"
					+ (day < 10 ? "0" + day : day) + " "
					+ (hour < 10 ? "0" + hour : hour) + ":"
					+ (min < 10 ? "0" + min : min);

			$("#tBodyHTML").append(
					'<tr class="table-light" style="text-align: center">' +

					'<th scope="row" style="width: 5%">' + (i + 1) + ' </th> '
							+ '<td style="width: 15%">' + data[i].groupName
							+ '</td> ' + '<td style="width: 10%">'
							+ data[i].userName + '</td>'
							+ '<td style="width: 15%">' + data[i].userPhone
							+ '</td>' + '<td style="width: 15%">' + retVal
							+ '</td> ' + '<td style="width: 50%">'
							+ data[i].infoDescription + '</td> </th>');

		}
	}

	function dayChange() {

		var wantDate = $("#datepicker").val();
		$("#tBodyHTML").empty();

		$.ajax({
			url : "/fuji/phoneDateList",
			dataType : "json",
			type : "GET",
			data : {
				"wantDate" : wantDate
			},
			success : function(data) {
				tableWrite(data);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});

	}

	function searchInputForm() {
		if (event.keyCode == 13) {
			var searchData = $("#searchInput").val();
			if (searchData.length > 0) {
				searchBtn();
			} else {
				swal({
					type : 'error',
					title : '검색 오류',
					text : '값을 입력해주세요',
				})
			}
		}
	}

	function searchBtn() {

		var searchData = $("#searchInput").val();

		if (searchData.length > 0) {

			$("#tBodyHTML").empty();

			$.ajax({
				url : "/fuji/phoneSearchList",
				dataType : "json",
				type : "GET",
				data : {
					"searchData" : searchData
				},
				success : function(data) {
					tableWrite(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "error:" + error);
				}
			});
		} else {
			swal({
				type : 'error',
				title : '검색 오류',
				text : '값을 입력해주세요',
			})
		}

	}
</script>

</html>


