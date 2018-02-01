<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>
<jsp:include page="../common/common.jsp"></jsp:include>



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    
    
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['정상',     ${vendingCount.normalVendingCount}],
          ['에러',      ${vendingCount.errVendingCount}],
        ]);

        var options = {
                title: '자판기 현황',
                pieHole: 0.4,
         };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    
    
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->

	<div class="container">
	
	<H1>로그인성공</H1>
	
	
	
	

	<div class="col-lg-12" style="margin-bottom:20px">
	
		<div id="piechart" style="height: 400px;"></div>
		
		<div id="donutchart" style="height: 400px;"></div>
		
		<button type="button" class="btn btn-primary">Primary</button>
		<button type="button" class="btn btn-secondary">Secondary</button>
		<button type="button" class="btn btn-success">Success</button>
		<button type="button" class="btn btn-info">Info</button>
		<button type="button" class="btn btn-warning">Warning</button>
		<button type="button" class="btn btn-danger">Danger</button>
	</div>
	
	
	<button type="button" onclick="test()">hello</button>
	
	
	
	
	
	
	<!-- 헤더 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 헤더 끝 -->



</body>
</html>
