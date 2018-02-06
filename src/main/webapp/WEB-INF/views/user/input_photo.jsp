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

<link href="/resources/login/style.css" rel="stylesheet" />
<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<script>
	function drinkChange(location) {

		$("select[name='vendingNumber'] option").remove();

		if (location != "notSelect") {
			$.ajax({
				url : "/user/vendingId",
				dataType : "json",
				type : "POST",
				data : {
					"location" : location
				},
				success : function(data) {

					for (var i = 0; i < data.length; i++) {
						$('#vendingNumber').append(
								$('<option></option>').val(data[i]).html(
										data[i]));
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "error:" + error);
				}
			});

		}

	}
</script>

</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->

	<form id="photoForm" name="photoForm" method="post"
		enctype="multipart/form-data" class="form-control2">

		<div class="container">

			<span class="badge badge-primary"
				style="margin-top: 20px; margin-bottom: 05px">자판기</span>

			<div class="form-group">
				<select class="form-control" id="location" name="location"
					onchange="drinkChange(this.value)" style="height: 40px">

					<option value="notSelect">지역선택</option>

					<c:forEach var="location" items="${location}">

						<option value="${location.vending_location}">${location.vending_location}</option>

					</c:forEach>

				</select>
			</div>

			<div class="form-group">
				<select class="form-control" id="vendingNumber" name="vendingNumber"
					style="height: 40px">

				</select>
			</div>
		</div>

		<div class="div_top form-group col-md-5 col-sm-8 col-xs-12 container">


			<header id="header_guest">
				<img src="/resources/assets/img/lotte-logo.png" alt="lotte logo"
					align="middle"
					style="width: 50px; position: relative; top: 50%; transform: translateY(-50%);">얼굴
				인식 사진 업로드
			</header>

			<p class="text-muted">* 얼굴인식은 원본으로 진행됩니다.</p>

			<div class="div_mid" style="width: 100%">
				<input type="file" id="btn_file" name="file" align="middle" /> <img
					id="img_preview" src="#"
					style="visibility: hidden; text-align: center" />
			</div>
			<div class=" form-group" style="margin-top: 30px">
				<input type="button" id="btn_add" name="add" onclick="photoSubmit()"
					value="등록">
			</div>


		</div>

	</form>


</body>
</html>


<script>
	$(function() {

		$("#btn_file").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img_preview').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
		img_preview.style.visibility = "visible";
	}

	function photoSubmit() {

		$("#photoForm").attr("action", "/user/faceVending");
		$("#photoForm").submit();
	}
</script>


