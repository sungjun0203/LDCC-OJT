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


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<style>
@
keyframes click-wave { 0% {
	height: 40px;
	width: 40px;
	opacity: 0.35;
	position: relative;
}

.option-input {
	-webkit-appearance: none;
	-moz-appearance: none;
	-ms-appearance: none;
	-o-appearance: none;
	appearance: none;
	position: relative;
	top: 13.33333px;
	right: 0;
	bottom: 0;
	left: 0;
	height: 40px;
	width: 40px;
	transition: all 0.15s ease-out 0s;
	background: #cbd1d8;
	border: none;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	margin-right: 0.5rem;
	outline: none;
	position: relative;
	z-index: 1000;
}

.option-input:hover {
	background: #9faab7;
}

.option-input:checked {
	background: #40e0d0;
}

.option-input:checked::before {
	height: 40px;
	width: 40px;
	position: absolute;
	content: '✔';
	display: inline-block;
	font-size: 26.66667px;
	text-align: center;
	line-height: 40px;
}

.option-input:checked::after {
	-webkit-animation: click-wave 0.65s;
	-moz-animation: click-wave 0.65s;
	animation: click-wave 0.65s;
	background: #40e0d0;
	content: '';
	display: block;
	position: relative;
	z-index: 100;
}

.option-input.radio {
	border-radius: 50%;
}

.option-input.radio::after {
	border-radius: 50%;
}

body {
	
}
</style>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="/resources/radio/css/style.css">



<script> 
	function inputSubmit(){
	
		if($("#vendingNumber").val()!=null){
	
			var gender = $('input:radio[name=genderRadio]:checked').val();
			
			$("#faceGender").val(gender);
			
			$("#userInputForm").attr("action","/user/vending");
			$("#userInputForm").submit();
		}
		
		else {
				swal({
					type : 'error',
					title : '에러',
					text : '모든값을 입력해주세요',
				})
			}

	}

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

	<!-- 작성자: 박성준 -->
	<!-- 관리자 로그인 -->
	<div class="container">

		<div class="progress" style="margin-bottom: 40px">
			<div class="progress-bar progress-bar-striped progress-bar-animated"
				role="progressbar" aria-valuenow="50" aria-valuemin="0"
				aria-valuemax="100" style="width: 50%"></div>
		</div>

		<form id="userInputForm">

			<input type="hidden" id="faceGender" name="faceGender"> <span
				class="badge badge-primary"
				style="margin-top: 20px; margin-bottom: 05px">성별</span>

			<div class="card border-primary mb-3" style="max-width: 20rem;">
				<div class="radio_container">
					<ul class="list" id="genderList" >
						<li class="list__item"><input type="radio" class="radio-btn"
							name="genderRadio" id="a-opt" value="male" CHECKED /> <label
							for="a-opt" class="label">Man</label></li>
						<li class="list__item"><input type="radio" class="radio-btn"
							name="genderRadio" id="b-opt" value="female" /> <label
							for="b-opt" class="label">Woman</label></li>
					</ul>
				</div>
			</div>



			<span class="badge badge-primary"
				style="margin-top: 20px; margin-bottom: 05px">연령</span>


			<div class="form-group">
				<select class="form-control" id="faceAge" name="faceAge">
					<option value="0">01 ~ 10</option>
					<option value="10">10 ~ 20</option>
					<option value="20">20 ~ 30</option>
					<option value="30">30 ~ 40</option>
					<option value="40">40 ~ 50</option>
					<option value="50">50 ~ 60</option>
					<option value="60">60 ~ 70</option>
					<option value="70">70 ~</option>
				</select>
			</div>

			<span class="badge badge-primary"
				style="margin-top: 20px; margin-bottom: 05px">자판기 - 고장난 자판기는 나오지 않습니다.</span>

			<div class="form-group">
				<select class="form-control" id="location" name="location"
					onchange="drinkChange(this.value)">

					<option value="notSelect">지역선택</option>

					<c:forEach var="location" items="${location}">

						<option value="${location.vending_location}">${location.vending_location}</option>

					</c:forEach>

				</select>
			</div>

			<div class="form-group">
				<select class="form-control" id="vendingNumber" name="vendingNumber">

				</select>
			</div>





			<button type="button" class="btn btn-danger" onclick="inputSubmit()"
				style="width: 100%">제출</button>

		</form>

	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>

