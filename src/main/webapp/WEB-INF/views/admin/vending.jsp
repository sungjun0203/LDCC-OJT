<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript"
src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 템플릿 공통 -->
<jsp:include page="../common/template_common.jsp"></jsp:include>
<!-- 템플릿 공통 끝 -->
<style>
th {
	text-align: center;
}

.cImg {
	width: 60px;
}

</style>
<script>
/*
 * 함수 작성자 : 백상우
 */
	var machineNum = parseInt("${machineNum}");
	if(machineNum == 0) {
		callDrinks(1);
	}
	if(machineNum != 0){
		callDrinks(machineNum);
	}
/*
 * 함수 작성자 : 백상우
 */	
function callState(no){
	$.ajax({
		type : 'GET',
		url : 'getVendingState',
		data : 'vendingId=' + no,
		dataType : 'json',
		success : function(data) {
			if(data.length == 1){
				if(data[0].state == "고장"){
					$(".notice-blue > ").html(no+"번 자판기 작동 상태 : 고장");
					$(".notice-red > ").html(no+"번 자판기 재고 상태 : 양호");

				}
				if(data[0].state == "재고"){
					$(".notice-red > ").html(no+"번 자판기 재고 상태 : 재고 부족");
					$(".notice-blue > ").html(no+"번 자판기 자판기 작동 상태 : 양호");
				}	
			}
			if(data.length == 2){
				$(".notice-red > ").html(no+"번 자판기 재고 상태 : 고장");
				$(".notice-blue > ").html(no+"번 자판기 자판기 작동 상태 : 재고 부족");
			}
			if(data.length == 0){
				$(".notice-red > ").html(no+"번 자판기 재고 상태 : 양호");
				$(".notice-blue > ").html(no+"번 자판기 자판기 작동 상태 : 양호");
			}
		}
	});
}	
/*
 * 함수 작성자 : 백상우
 */			
function callDrinks(no){
	$.ajax({
		type : 'GET',
		url : 'getDrinks',
		data : 'vendingId=' + no,
		dataType : 'json',
		success : function(data) {
			//$(".empty > h2").remove();
			var show_ul = "";
			for (var i = 0; i < data.length; i++) {
				var img = data[i].drinkName + '.png';
				show_ul += "<td class='drinkImg' id='"+data[i].picId+"' style='text-align:center'><img class='cImg' src='./././"+data[i].drinkPicSrc+"'/><br/>"
						+ data[i].drinkPicName
						+ "<br/>재고 수 : "
						+ data[i].stockQuantity + "</td>"
			}
			$(".tb-stocks > ").find("tr").html(show_ul);
			callGraphGender(no);
			$("#btn-gender").attr("onclick","callGraphGender("+no+")");
			$("#btn-age").attr("onclick","callGraphAge("+no+")");
			callState(no);
		},
		error:function(error){
			console.log("정상 에러 : " + error);
		}
	});
}
/*
 * 함수 작성자 : 백상우
 */		
 
 function callGraphGender(no){
		$("#chart_div").html("");
		$.ajax({
			type : 'GET',
			url : 'getDrinkSales',
			data : 'vendingId=' + no,
			dataType : 'json',
			success : function(jdata) {
				console.log(jdata);
				google.charts.load('current', {'packages':['line', 'corechart']});
				google.charts.setOnLoadCallback(drawMultSeries);
				function drawMultSeries() {
					var data = new google.visualization.DataTable();
					data.addColumn('string', '음료수 종류');
					data.addColumn('number', '남');
					data.addColumn('number', '여');
					data.addRows(jdata.length);
					for (i = 0; i < jdata.length; i++) {
						data.setCell(i, 0, jdata[i].drinkName);
						data.setCell(i, 1, jdata[i].countForMale);
						data.setCell(i, 2, jdata[i].countForFemale);
					}

					var options = {
	 						height : 350,
	 						color : 'black',
	 						animation: { startup: true, duration: 2500, easing: 'out' },
	 						crosshair:{
	 							orientation:'both',
	 							trigger:'both'
	 						  },
	 						legend:{
	 							position: 'top',
								  textStyle:{
	 				    		    color: 'black',
	 				    		    fontSize: 12,
	 				    		    bold: false,
	 				    		    italic: false
	 							  }
	 						  },
	 						 lineWidth: 5,
	 						  pointSize: 20,
	 						  dataOpacity: 0.01,
	 						backgroundColor: { fill:'transparent' },
	 						chartArea:{
	 							width: '85%',
	 							height: '70%'
	 						},
	 						hAxis : {
	 							title : '음료수 종류',
	 							textStyle : {
	 				    		    color: 'black',
	 				    		    fontSize: 14,
	 				    		    bold: false,
	 				    		    italic: false
	 							},
	 							titleTextStyle: {
	 				    		    color: 'black',
	 				    		    fontSize: 18,
	 				    		    bold: false,
	 				    		    italic: true
	 				    		  },
	 							gridlines : {
	 								color : 'black'
	 							},

	 						},
	 						vAxis : {
	 							title : "판매수",
	 							textStyle : {
	 				    		    color: 'black',
	 				    		    fontSize: 14,
	 				    		    bold: false,
	 				    		    italic: false
	 							},
	 							gridlines : {
	 								color : 'black',
	 								count : 6
	 							},
	 							titleTextStyle: {
	 				    		    color: 'black',
	 				    		    fontSize: 16,
	 				    		    bold: false,
	 				    		    italic: true
	 				    		  }
	 						}
	 					};
					var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
					chart.draw(data, options);
				}
				
			}
		});
	}
 

function callGraphAge(no){
	//alert("Age and no : "+no);
	$("#chart_div").html("");
	$.ajax({
		type : 'GET',
		url : 'getDrinkSales',
		data : 'vendingId=' + no,
		dataType : 'json',
		success : function(jdata) {
			google.charts.load('current', {
				packages : [ 'corechart', 'bar' ]
			});
			google.charts.setOnLoadCallback(drawMultSeries);
			function drawMultSeries() {
				var data = new google.visualization.DataTable();
				data.addColumn('string', '음료수 종류');
				data.addColumn('number', '10대');
				data.addColumn('number', '20대');
				data.addColumn('number', '30대');
				data.addColumn('number', '40대');
				data.addColumn('number', '50대');
				data.addRows(jdata.length);
				for (i = 0; i < jdata.length; i++) {
					data.setCell(i, 0, jdata[i].drinkName);
					data.setCell(i, 1, jdata[i].countForTen);
					data.setCell(i, 2, jdata[i].countForTwenty);
					data.setCell(i, 1, jdata[i].countForThirty);
					data.setCell(i, 2, jdata[i].countForForthy);
					data.setCell(i, 1, jdata[i].countForFifty);
				}

				var options = {
					height : 350,
					animation: { startup: true, duration: 2500, easing: 'out' },
					chart : {
						title : '남녀별 음료 매출'
					},
					vAxis : {
							title : "판매수",
							textStyle : {
				    		    color: 'black',
				    		    fontSize: 14,
				    		    bold: false,
				    		    italic: false
							},
							gridlines : {
								color : 'black',
								count : 6
							},
							titleTextStyle: {
				    		    color: 'black',
				    		    fontSize: 16,
				    		    bold: false,
				    		    italic: true
				    		  }
						},
						chartArea:{
 							width: '80%',
 							height: '70%'
 						}
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
				chart.draw(data, options);
			}
		}
	});
}
</script>
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html"><img
				src="/resources/assets/img/lotte-logo.png" alt="lotte logo"
				align="middle"
				style="width: 50px; position: relative; top: 50%; transform: translateY(-50%);" /></a>
		</div>
		<div>

			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px; position: relative; top: 50%;">
				<a href="#"> <i class="fa fa-bell fa-2x"
					style="position: relative; top: 50%; transform: translateY(25%); color: #424242"></i><span
					class="notice-badge badge">3</span></a> <span style="margin: 3px;"></span>
				<img src="/resources/assets/img/profile.jpg"
					style="width: 50px; height: 50px; border-radius: 50%;" />
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">

				<li><a class="text-center" onclick="moveHome(this.id)"
					id="navi1"><i class="fa fa-home fa-3x"></i> <br>Home</a></li>
				<li><a class="text-center" onclick="moveMember(this.id)"
					id="navi2"><i class="fa fa-users fa-3x"></i> <br>Member</a></li>
				<li><a class="active-menu" onclick="moveMachine()" id="navi3"><i
						class="fa fa-calculator fa-3x"></i> <br>Machine</a></li>
				<li><a class="text-center" onclick="moveHome()" id="navi4"><i
						class="fa fa-chart-pie fa-3x"></i> <br>Analysis</a></li>
				<li><a class="text-center" onclick="moveRank()"><i
						class="fa fa-chart-bar fa-3x"></i> <br>Rank</a></li>
				<li><a class="text-center" onclick="moveHome()" id="navi5"><i
						class="fa fa-chart-line fa-3x"></i> <br>Sales</a></li>
				<li><a class="text-center" onclick="moveHome()" id="navi6"><i
						class="fa fa-bullhorn fa-3x"></i> <br>Notice </a></li>
			</ul>
		</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>자판기 관리</h2>
						<h5>자판기 매출 및 결함 유무를 확인할 수 있는 페이지 입니다.</h5>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

				<div class="row">
					<div class="col-md-4 col-sm-12 col-xs-12">

						<div class="panel panel-back noti-box" style="height: 680px;">
							<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">실시간 자판기 총현황</p>
								<hr />
								<!-- <p class="text-muted">Messages</p>-->
							</div>
							<div>
								<div class="row">
									<div style="height: 635px; overflow-y: scroll;">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>자판기 번호</th>
													<th>자판기 위치</th>
													<th>관리자</th>
													<th>자판기 상세 위치</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="vMachine" items="${item}">
													<tr class="data" id="${vMachine.vendingId}"
														onclick='callDrinks(${vMachine.vendingId})'
														style="text-align: center">
														<td>${vMachine.vendingId}</td>
														<td>${vMachine.vendingLocation}</td>
														<td>${vMachine.vendingAsInfo}</td>
														<td>${vMachine.vendingField}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-8 col-sm-12 col-xs-12">
						<div class="row">
							<div class="panel panel-back noti-box">
								<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
								<div class="text-box">
									<p class="main-text">실시간 작동 현황</p>
									<hr />

									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-6">
											<div class="notice-blue">
												<i class="fa fa-wrench fa-2x"
													style="width: 30px; height: 30px; color: black"></i> <span
													style="margin-left: 10px; font-size: 15pt; color: white;"></span>
											</div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6">
											<div class="notice-red">
												<i class="fa fa-cart-arrow-down fa-2x"
													style="width: 30px; height: 30px; color: black"></i> <span
													style="margin-left: 10px; font-size: 15pt; color: white;"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<hr />
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="row">
									<div class="panel panel-back noti-box">
										<div class="text-box">
											<p class="main-text">자판기별 재고 현황</p>
											<hr />
											<table class="table table-hover tb-stocks" id=>
												<tbody>
													<tr></tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<hr />
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="row">
									<div class="panel panel-back noti-box">
										<div class="text-box">
											<p class="main-text" style="display:inline;margin-right:25px;">자판기별 판매 현황</p>
											<div id="chart-btn" style="display:inline">
												<input type="button"  onclick="callGraphGender('${machineNum}')" class="btn-machine" id="btn-gender" value="성별 판매 현황"> 
												<input type="button" onclick="callGraphAge('${machineNum}')" class="btn-machine" id="btn-age" value="나이별 판매 현황"></div><hr />
											<div id="chart_div">
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
					<!-- /. PAGE INNER  -->
				</div>
				<!-- /. PAGE WRAPPER  -->
			</div>
			<!-- /. WRAPPER  -->
</body>
</html>

