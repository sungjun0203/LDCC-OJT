<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>

<!-- 템플릿 공통 -->
<jsp:include page="../common/template_common.jsp"></jsp:include>
<!-- 템플릿 공통 끝 -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
$(function(){
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart_locationField());

		function drawChart_locationField() {
				var data = new google.visualization.DataTable();
				data.addColumn('string', '지역');
				data.addColumn('number', '대학교');
				data.addColumn('number', '중학교');
				data.addColumn('number', '지하철');
				data.addColumn('number', '회사');
				data.addRows([
					<c:forEach var="locationField" items="${locationField}">
			        	['${locationField.vendingLocation}', ${locationField.vendingLocation}, selectHandler_Year('${earthYear.eq_year}','${earthYear.eq_countyear}')],
			      	</c:forEach>
				]);

				var options = {
					height : 400,
					color : 'white',
					animation: { startup: true, duration: 2500, easing: 'out' },
					crosshair:{
						orientation:'both',
						trigger:'both'
					  },
					legend:{
						position: 'top',
					  textStyle:{
						  	fontName:'Jeju Gothic',
			    		    color: 'white',
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
						height: '75%'
					},
					hAxis : {
						title : '시간',
						textStyle : {
							fontName:'Jeju Gothic',
			    		    color: 'white',
			    		    fontSize: 12,
			    		    bold: false,
			    		    italic: false
						},
						titleTextStyle: {
		    				fontName:'Jeju Gothic',
			    		    color: 'white',
			    		    fontSize: 16,
			    		    bold: false,
			    		    italic: true
			    		  },
						gridlines : {
							color : 'lightgrey',
							count : 9
						},

					},
					vAxis : {
						title : "빈도수",
						textStyle : {
							fontName:'Jeju Gothic',
			    		    color: 'white',
			    		    fontSize: 12,
			    		    bold: false,
			    		    italic: false
						},
						gridlines : {
							color : 'lightgrey',
							count : 9
						},
						titleTextStyle: {
		    				fontName:'Jeju Gothic',
			    		    color: 'white',
			    		    fontSize: 16,
			    		    bold: false,
			    		    italic: true
			    		  }
					}
				};

				var chart = new google.visualization.LineChart(document
						.getElementById('placeholder2'));
				chart.draw(data, options);
			}
	
});

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
                <nav class="navbar-default navbar-side" role="navigation" >
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					
                    <li>
                        <a class="text-center"  onclick="moveHome(this.id)" id="navi1"><i class="fa fa-home fa-3x"></i> <br>Home</a>
                    </li>
                     <li>
                        <a  class="text-center" onclick="moveMember(this.id)" id="navi2"><i class="fa fa-users fa-3x"></i> <br>Member</a>
                    </li>
                     <li>
                        <a  class="text-center" onclick="moveMachine()" id="navi3"><i class="fa fa-calculator fa-3x"></i> <br>Machine</a>
                    </li>
						   <li  >
                        <a  class="text-center" onclick="moveHome()" id="navi4"><i class="fa fa-chart-pie fa-3x"></i> <br>Analysis</a>
                    </li>	
                    
                    <li><a class="active-menu" onclick="moveRank()"><i
						class="fa fa-chart-bar fa-3x" ></i> <br>Rank</a></li>
                      <li  >
                        <a  class="text-center" onclick="moveHome()" id="navi5"><i class="fa fa-chart-line fa-3x"></i> <br>Sales</a>
                    </li>
                    <li  >
                        <a  class="text-center" onclick="moveHome()" id="navi6"><i class="fa fa-bullhorn fa-3x"></i> <br>Notice </a>
                    </li>				
					
					                   
                </ul>
               
            </div>
            
        </nav>  

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>랭킹</h2>
						<h5>칠성에서 음료 개발 및 마케팅 정보로 활용할 수 있는 자판기 판매 분석 랭킹 보는곳이라는 말을 예쁘게
							고쳐주세요.</h5>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<!--                    upper row
					
					
-->
					<div class="col-md-2 col-sm-2 col-xs-2">
						<div class="panel panel-back noti-box" style="height: 300px;">
							<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">남여 비율</p>
								<hr />

								<div id="donutchart"></div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>

						</div>
					</div>

					<div class="col-md-5 col-sm-5 col-xs-5">
						<div class="panel panel-back noti-box" style="height: 300px;">
							<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">남성</p>
								<hr />
								<div id="manSellRank"></div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>

						</div>
					</div>


					<div class="col-md-5 col-sm-5 col-xs-5">
						<div class="panel panel-back noti-box" style="height: 300px;">
							<div class="text-box">
								<p class="main-text">여성</p>
								<hr />
								<div id="womanSellRank"></div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-back noti-box">
							<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">지역별 판매 랭킹</p>
								<hr />
								<div id="locationSellRank"></div>
								
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-back noti-box">
							<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">위치별 판매 랭킹</p>
								<hr />
								<div id="fieldSellRank"></div>
								
							</div>
						</div>
					</div>


				</div>
				
				
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-back noti-box">
							<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">시간대별 판매 랭킹</p>
								<hr />
							</div>
						</div>
					</div>


				</div>
			</div>


		</div>
	</div>
	</div>
	</div>
	<!-- /. ROW  -->
	</div>
	<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->


</body>
</html>