<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>

<!-- 템플릿 공통 -->
<jsp:include page="../common/template_common.jsp"></jsp:include>
<!-- 템플릿 공통 끝 -->

<script src="https://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="/resources/sweetalert/sweetalert.js"></script>

<script>

var troubleCheckValue = false;

function drinkSelect(id){
	troubleCheck();
	
	if(troubleCheckValue==false){
		vendingStockCheck(id);
	}
	
	
}

function troubleCheck(){
	
	var vendingId = $("#vendingId").val();
	
	$.ajax({
		url : "/user/troubleCheck",
		dataType : "text",
		type : "POST",
		data : {
			"vendingId" : vendingId
		},
		success : function(data) {
			
			if(data>0){
				troubleCheckValue = true;
				swal("고장 자판기", "죄송합니다 다음에 이용해주세요","error")
				.then((value) => {
					location.href="/"
				});
			}
			else{
				troubleCheckValue=false;
			}

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
	
	
	
	
}


function vendingTrouble(){
	
	
	var vendingId = $("#vendingId").val();
	
	$.ajax({
		url : "/user/troubleCheck",
		dataType : "text",
		type : "POST",
		data : {
			"vendingId" : vendingId
		},
		success : function(data) {
			
			if(data>0){
				swal("이미 고장난 자판기입니다.", "죄송합니다 다음에 이용해주세요","error")
				.then((value) => {
					location.href="/"
				});
			}
			else{
				swal("고장.. 전원Off", "죄송합니다 다음에 이용해주세요","error")
				.then((value) => {
					$("#vendingMachineInfo").attr("action","/user/vendingTrouble");
					$("#vendingMachineInfo").submit();
				});
			}

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
	
}



function vendingStockCheck(id){
	
	var vendingId = $("#vendingId").val();
	
	$.ajax({
		url : "/user/vendingStockCheck",
		dataType : "json",
		type : "POST",
		data : {
			"vendingId" : vendingId,
			"selectDrinkId" : id
		},
		success : function(data) {
			
			if(data.stock_quantity==0){
				swal("죄송합니다.", "음료수의 재고가 없습니다.","error");
			}
			
			else{
				
				$.ajax({
					url : "/user/vendingSubmit",
					dataType : "text",
					type : "POST",
					data : {
						"vendingId" : vendingId,
						"selectDrinkId" : id,
						"faceAge" : $("#faceAge").val(),
						"faceGender" : $("#faceGender").val(),
						"stock" : data.stock_quantity,
						"sendCheck" : data.sended
					},
					success : function() {
						
						swal("음료 주문완료", "감사합니다.","success");
						
						
						swal({
							  title: '음료 주문 완료',
							  text: "감사합니다.",
							  type: 'success',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '종료',
							  cancelButtonText: '계속 주문',
							  confirmButtonClass: 'btn btn-danger',
							  cancelButtonClass: 'btn btn-success',
							  buttonsStyling: false,
							  reverseButtons: true
							}).then((result) => {
							  if (result.value) {
								  location.href="/"
							  // result.dismiss can be 'cancel', 'overlay',
							  // 'close', and 'timer'
							  } else if (result.dismiss === 'cancel') {
							    	
							  }
							})
						
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "error:" + error);
					}
				});
				
			}
						
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
	
}
</script>


</head>

<body>


	<form id="vendingMachineInfo">
	
		<input type="hidden" id="faceGender" name="faceGender" value="${faceResult.gender}">
		<input type="hidden" id="faceAge" name="faceAge" value="${faceResult.age}">
		<input type="hidden" id="selectDrinkId" name="selectDrinkId">
		<c:forEach var="drinksInfo" items="${drinksInfo}" begin="0" end="0"
			step="1" varStatus="status">
			<input type="hidden" id="vendingId" name="vendingId"
				value=${drinksInfo.vending_id}>
		</c:forEach>
		<div class="row" id="vmbgimg"
			style="overflow-x: hidden; background-color: #018226;">
			<div class="row" style="text-align: center;">
				<img src="/resources/assets/img_mobile/lense.png"
					style="height: 25px; margin: 10px; margin-top: 25px; text-align: center"
					onclick="vendingTrouble()">
			</div>
			<div
				style="display: block; background-color: #fff; border-radius: 12px; width: 80%; height: 690px; margin-left: 10%;">
				<div
					style="display: block; width: 100%; border-radius: 12px 12px 0px 0px; background: black; color: #E20411; font-weight: bold; margin-bottom: 0px;">
					<marquee>현재 이용중인 자판기는 ${vendingInfo.vendingLocation} -
						${vendingInfo.vendingField} - ${vendingInfo.vendingId}번 자판기입니다.</marquee>
				</div>



				<!--<img src="assets/img_mobile/bg_vm.png" style="position:absolute; left:0px; top:0px; width:100%; height:218.5%;z-index:1;">-->
				<div class="row"
					style="height: 150px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">

					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="0" end="4"
						step="1" varStatus="status">

						<c:if test="${status.index eq 0}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 12%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 1}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 2}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 3}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

					</c:forEach>


				</div>
				<div
					style="background-color: #999999; opacity: 0.5; height: 5px; width: 100%; filter: blur(6px); margin-bottom: 2px;"></div>
				<div
					style="background-color: #999999; opacity: 0.1; height: 5px; width: 100%; filter: blur(1px); margin-bottom: 2px;"></div>
				<div class="row"
					style="background-color: #fff; height: 22px; width: 100%; margin-left: 0%;">

					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="0" end="4"
						step="1" varStatus="status">
						<c:if test="${status.index eq 0}">
							<label class="cost" style="margin-left: 10%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 1}">
							<label class="cost" style="margin-left: 11%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 2}">
							<label class="cost" style="margin-left: 12%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 3}">
							<label class="cost" style="margin-left: 11%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

					</c:forEach>
				</div>
				<div
					style="background-color: #092382; height: 20px; width: 100%; font-color: transparent;">
				</div>
				<div
					style="background-color: #fff; height: 40px; width: 100%; font-color: transparent;">
					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="0" end="3"
						step="1" varStatus="status">


							<c:if test="${status.index eq 0}">
							<button type="button" class="vm_button" style="margin-left: 9%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 1}">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 2}">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 3 }">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>


					</c:forEach>


				</div>
				<div
					style="background-color: #999999; opacity: 0.3; height: 5px; width: 100%; filter: blur(1px);"></div>

				<!-- ------------------------------------------------------------------------------------------------------------------------------ -->

				<div class="row"
					style="height: 120px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">

					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="4" end="8"
						step="1" varStatus="status">

						<c:if test="${status.index eq 4}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 12%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 5}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 6}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 7}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

					</c:forEach>


				</div>
				<div
					style="background-color: #999999; opacity: 0.5; height: 5px; width: 100%; filter: blur(6px); margin-bottom: 2px;"></div>
				<div
					style="background-color: #999999; opacity: 0.1; height: 5px; width: 100%; filter: blur(1px); margin-bottom: 2px;"></div>
				<div class="row"
					style="background-color: #fff; height: 22px; width: 100%; margin-left: 0%;">

					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="4" end="8"
						step="1" varStatus="status">
						<c:if test="${status.index eq 4}">
							<label class="cost" style="margin-left: 10%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 5}">
							<label class="cost" style="margin-left: 11%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 6}">
							<label class="cost" style="margin-left: 12%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 7}">
							<label class="cost" style="margin-left: 11%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

					</c:forEach>
				</div>
				<div
					style="background-color: #092382; height: 20px; width: 100%; font-color: transparent;">
				</div>
				<div
					style="background-color: #fff; height: 40px; width: 100%; font-color: transparent;">
					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="4" end="8"
						step="1" varStatus="status">


							<c:if test="${status.index eq 4}">
							<button type="button" class="vm_button" style="margin-left: 9%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 5}">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 6}">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 7 }">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>


					</c:forEach>


				</div>
				<div
					style="background-color: #999999; opacity: 0.3; height: 5px; width: 100%; filter: blur(1px);"></div>

				<!-- ------------------------------------------------------------------------------------------------------------------------------ -->

				<div class="row"
					style="height: 120px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">

					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="8"
						end="12" step="1" varStatus="status">

						<c:if test="${status.index eq 8}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 12%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 9}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 10}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

						<c:if test="${status.index eq 11}">
							<img src="${drinksInfo.drink_pic_src}"
								style="width: 12%; margin-left: 9%; transform: translateY(7%);">
						</c:if>

					</c:forEach>


				</div>
				<div
					style="background-color: #999999; opacity: 0.5; height: 5px; width: 100%; filter: blur(6px); margin-bottom: 2px;"></div>
				<div
					style="background-color: #999999; opacity: 0.1; height: 5px; width: 100%; filter: blur(1px); margin-bottom: 2px;"></div>
				<div class="row"
					style="background-color: #fff; height: 22px; width: 100%; margin-left: 0%;">

					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="8"
						end="12" step="1" varStatus="status">
						<c:if test="${status.index eq 8}">
							<label class="cost" style="margin-left: 10%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 9}">
							<label class="cost" style="margin-left: 11%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 10}">
							<label class="cost" style="margin-left: 12%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

						<c:if test="${status.index eq 11 }">
							<label class="cost" style="margin-left: 11%;"><b>${drinksInfo.drink_price}원</b></label>
						</c:if>

					</c:forEach>
				</div>
				<div
					style="background-color: #092382; height: 20px; width: 100%; font-color: transparent;">
				</div>
				<div
					style="background-color: #fff; height: 40px; font-color: transparent; border-radius: 12px;">
					<c:forEach var="drinksInfo" items="${drinksInfo}" begin="8"
						end="12" step="1" varStatus="status">


							<c:if test="${status.index eq 8}">
							<button type="button" class="vm_button" style="margin-left: 9%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 9}">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 10}">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>
	
							<c:if test="${status.index eq 11 }">
								<button type="button" class="vm_button" style="margin-left: 6%;"
									onclick="drinkSelect(${drinksInfo.drink_id})">
									<span class="slider round"></span>
								</button>
							</c:if>



					</c:forEach>


				</div>
				<div
					style="background-color: #999999; opacity: 0.3; height: 5px; width: 100%; filter: blur(1px);"></div>



				<div style="margin: 30px;"></div>
				<div style="text-align: center;">
					<img src="/resources/assets/img_mobile/cider_ad.PNG"
						style="width: 79%; text-align: center; display: inline-block;">
				</div>
				<div style="height: 30px;"></div>
			</div>
	</form>
</body>
</html>

<script>

$( document ).ready(function() {
	
	if(${checkHuman}==true){
		
		if("${faceResult.gender}"=="male"){
			genderValue="남";
		}
		else{
			genderValue="여";
		}
		
		var tempMsg = "추천 음료 : ";
		
		<c:forEach var="drinkAnalysis" items="${drinkAnalysis}" >
			
			tempMsg+=" ${drinkAnalysis.drinkName} ";
		</c:forEach>
		
		swal(genderValue + " / 나이 : ${faceResult.age}" , "<strong>" + tempMsg +"</strong>", "success");
	}
	else{
		swal("얼굴 분석 실패", "당신은 사람이 아니네유..", "error");
	}
	
});

</script>

