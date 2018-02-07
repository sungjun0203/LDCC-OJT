
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>Insert title here</title>
<jsp:include page="../common/template_common.jsp"></jsp:include>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		  div { font-family: 'Noto Sans KR'; }
		  p {font-family: 'Noto Sans KR';}
		  h2 {font-family: 'Noto Sans KR'; }
		  h5 {font-family: 'Noto Sans KR'; }
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['남자',     ${humanInfo.manCnt} ],
    ['여자',     ${humanInfo.womanCnt} ],
  ]);
  var options = {
		sliceVisibilityThreshold: .2,
    	legend:'none',
    	fontName:'Noto Sans KR',
    	fontSize:17,
    	slices: {
            0: { color: '#292c44' },
            1: { color: '#ff5349' }
      },
    	backgroundColor:'transparent',
	    chartArea:{width:'100%',height:'100%'},
	    pieSliceText:'label',
	    pieSliceTextStyle:{fontSize:'15',},
  };
  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(data, options);
}
</script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '음료이름');
        data.addColumn('number', '가격');
        data.addColumn('number', '판매 개수');
        data.addColumn('number', '총 판매액');
        data.addRows([
        	<c:forEach var="manSellRank" items="${manSellRank}">
        	  ["${manSellRank.drinkName}",  ${manSellRank.drinkPrice}, ${manSellRank.sellCnt}, ${manSellRank.drinkPrice} * ${manSellRank.sellCnt}],
     		</c:forEach>
        ]);
        var table = new google.visualization.Table(document.getElementById('manSellRank'));
        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }
</script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '음료이름');
        data.addColumn('number', '가격');
        data.addColumn('number', '판매 개수');
        data.addColumn('number', '총 판매액');
        data.addRows([
        	<c:forEach var="womanSellRank" items="${womanSellRank}">
        	  ["${womanSellRank.drinkName}",  ${womanSellRank.drinkPrice}, ${womanSellRank.sellCnt}, ${womanSellRank.drinkPrice} * ${womanSellRank.sellCnt}],
     		</c:forEach>
        ]);
        var table = new google.visualization.Table(document.getElementById('womanSellRank'));
        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }
</script>
<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMaterial);
function drawMaterial() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', '지역');
      data.addColumn('number', '판매량');
      data.addRows([
    	 	 <c:forEach var="locationSellRank" items="${locationSellRank}">
        		["${locationSellRank.vending_location}", ${locationSellRank.cnt}],
        	</c:forEach>
      ]);
      var options = {
        title: 'Motivation and Energy Level Throughout the Day',
        hAxis: {
          title: 'Time of Day',
          format: 'h:mm a',
          viewWindow: {
            min: [7, 30, 0],
            max: [17, 30, 0]
          }
        },
        vAxis: {
          title: 'Rating (scale of 1-10)'
        },
        colors: ['#292c44'],
        backgroundColor: 'transparent'
      };
      var materialChart = new google.charts.Bar(document.getElementById('locationSellRank'));
      materialChart.draw(data, options);
    }
</script>
<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMaterial);
function drawMaterial() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', '위치');
      data.addColumn('number', '판매량');
      data.addRows([
    	 	 <c:forEach var="fieldSellRank" items="${fieldSellRank}">
        		["${fieldSellRank.vending_field}", ${fieldSellRank.cnt}],
        	</c:forEach>
      ]);
      var options = {
        title: 'Motivation and Energy Level Throughout the Day',
        hAxis: {
          title: 'Time of Day',
          format: 'h:mm a',
          viewWindow: {
            min: [7, 30, 0],
            max: [17, 30, 0]
          }
        },
        vAxis: {
          title: 'Rating (scale of 1-10)'
        },
        colors: ['#292c44'],
        backgroundColor: 'transparent'
      };
      var materialChart = new google.charts.Bar(document.getElementById('fieldSellRank'));
      materialChart.draw(data, options);
    }
</script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['시간', '판매량'],
          	<c:forEach var="timeSellRank" items="${timeSellRank}">
  				["${timeSellRank.time}", ${timeSellRank.sellCnt}],
  			</c:forEach>
        ]);
        var options = {
          curveType: 'function',
          vAxis: {
              minValue:0,
              viewWindow: {
                  min: 0
              }
          },
        };
        var chart = new google.visualization.LineChart(document.getElementById('timeSellChart'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
<div id="wrapper">
	<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
		<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.html"><img src="/resources/assets/img/lotte-logo.png" alt="lotte logo" align="middle" style="width: 50px; position: relative; top: 50%; transform: translateY(-50%);"/></a>
	</div>
	<div style="color: white;padding: 15px 50px 5px 50px;float: left;font-size: 16px; position: relative;top: 50%;">
		<span style="color:#ED3A2E; font-size:30pt; font-weight:600;">L.SMO</span>
	</div>
	</nav>
	<!-- /. NAV TOP  -->
	<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li>
			<a class="text-center" onclick="moveHome(this.id)" id="navi1"><i class="fa fa-home fa-3x"></i><br>
			Home</a>
			</li>
			<li>
			<a class="text-center" onclick="moveMember(this.id)" id="navi2"><i class="fa fa-users fa-3x"></i><br>
			Member</a>
			</li>
			<li>
			<a class="text-center" onclick="moveMachine()" id="navi3"><i class="fa fa-calculator fa-3x"></i><br>
			Machine</a>
			</li>
			<li>
			<a class="text-center" onclick="moveHome()" id="navi4"><i class="fa fa-chart-pie fa-3x"></i><br>
			Analysis</a>
			</li>
			<li><a class="active-menu" onclick="moveRank()"><i class="fa fa-chart-bar fa-3x"></i><br>
			Rank</a></li>
			<li>
			<a class="text-center" onclick="moveHome()" id="navi5"><i class="fa fa-chart-line fa-3x"></i><br>
			Sales</a>
			</li>
			<li>
			<a class="text-center" onclick="moveHome()" id="navi6"><i class="fa fa-bullhorn fa-3x"></i><br>
			Notice </a>
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
					<h5>칠성에서 음료 개발 및 마케팅 정보로 활용할 수 있는 자판기 판매 분석 랭킹 보는곳이라는 말을 예쁘게 고쳐주세요.</h5>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr/>
			<div class="row">
				<!--                    upper row
-->
				<div class="col-md-3 col-sm-12 col-xs-12">
					<div class="panel panel-back noti-box" style="height: 300px;">
						<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
						<div class="text-box">
							<p class="main-text">
								남여 비율
							</p>
							<hr/>
							<div id="donutchart">
							</div>
							<!-- <p class="text-muted">Messages</p>-->
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box" style="height: 300px;">
							<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">
									남성
								</p>
								<hr/>
								<div id="manSellRank">
								</div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box" style="height: 300px;">
							<div class="text-box">
								<p class="main-text">
									여성
								</p>
								<hr/>
								<div id="womanSellRank">
								</div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr/>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-back noti-box">
						<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
						<div class="text-box">
							<p class="main-text">
								지역별 판매 랭킹
							</p>
							<hr/>
							<div id="locationSellRank">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr/>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-back noti-box">
						<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
						<div class="text-box">
							<p class="main-text">
								위치별 판매 랭킹
							</p>
							<hr/>
							<div id="fieldSellRank">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /. ROW  -->
			<hr/>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-back noti-box">
						<!--                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">시간대별 판매 랭킹</p>
								<hr />
								 <div id="timeSellChart"></div>
							</div>
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