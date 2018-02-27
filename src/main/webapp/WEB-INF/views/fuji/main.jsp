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
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<%
	if(session.getAttribute("id")!=null){
		response.sendRedirect("/");  
	}
%>

</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../fuji/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->


	<div class="container">


<div id="linechart_material" style="width: 900px; height: 500px"></div>
		<!-- 푸터 -->
		<jsp:include page="../fuji/footer.jsp"></jsp:include>
		<!-- 푸터 끝 -->
	</div>
</body>



<script>
			google.charts.load('current', {'packages':['line']});
			google.charts.setOnLoadCallback(drawChart);
			
			function drawChart() {
			
			var data = new google.visualization.DataTable();
			data.addColumn('number', 'Day');
			data.addColumn('number', 'Guardians of the Galaxy');
			data.addColumn('number', 'The Avengers');
			data.addColumn('number', 'Transformers: Age of Extinction');
			
			data.addRows([
			  [1,  37.8, 80.8, 41.8],
			  [2,  30.9, 69.5, 32.4],
			  [3,  25.4,   57, 25.7],
			  [4,  11.7, 18.8, 10.5],
			  [5,  11.9, 17.6, 10.4],
			  [6,   8.8, 13.6,  7.7],
			  [7,   7.6, 12.3,  9.6],
			  [8,  12.3, 29.2, 10.6],
			  [9,  16.9, 42.9, 14.8],
			  [10, 12.8, 30.9, 11.6],
			  [11,  5.3,  7.9,  4.7],
			  [12,  6.6,  8.4,  5.2],
			  [13,  4.8,  6.3,  3.6],
			  [14,  4.2,  6.2,  3.4]
			]);
			
			var options = {
			  chart: {
			    title: 'Box Office Earnings in First Two Weeks of Opening',
			    subtitle: 'in millions of dollars (USD)'
			  },
			  width: 900,
			  animation: { startup: true, duration: 2500, easing: 'out' },
			  height: 500
			};
			
			var chart = new google.charts.Line(document.getElementById('linechart_material'));
			
			chart.draw(data, google.charts.Line.convertOptions(options));
			}

</script>

</html>

