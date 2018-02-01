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
    
    
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->

	<div class="container">
	
	<H1>로그인성공</H1>
	
	
	
	

	<div class="col-lg-12" style="margin-bottom:20px">
	
		<div id="piechart" style="height: 400px;"></div>
		
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

<script>

function test(){
	
	var msgId = "01035660203";
	var msgBody = "test";
	var destPhone="01035660203";
	
	$.ajax({
		url:"http://210.93.181.229:9000/v1/send/kakao-friend",
		type:"POST",
		dataType:"JSON",
		headers:{
			"cache-control" : "no-cache",
			"Content-Type" : "application/json",
			"Authorization" : "Y2xhc3M6c2VjcmV0MTIhQA=="
		},
		data:{
			msg_id : msgId,
			msg_body : msgBody,
			send_time : "",
			dest_phone : destPhone,
			send_phone : "01035660203",
			sender_key : "d6b73318d4927aa80df1022e07fecf06c55b44bf",
			ad_flag : "N"
		},
		
		success:function(code){		
			alert(code);
			
		},
		error:function(code,msg,data){
			alert("code"+code.val+" msg" + msg + " data" + data);
		}
	});
	
}

</script>