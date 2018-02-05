<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
.machine-container{
	border: 1px black solid;
    position: absolute;
    height: 90%;
    width: 90%;
}
.title {
    font-size: 25px;
    text-align: center;
}
.machine.list{
    margin-left: 32px;
    margin-top: 40px;
}
.machine {
    position: relative;
    float: left;
}
.list-contents{
	border: 1px black solid;
    height: 500px;
    width: 400px;
    overflow: scroll;
}
.machine.sales{
	left: 138px;
}
.sales-machine{
	left: 140px;
    display: block;
}
.sales-contents{   
	border: 1px black solid;
    height: 100%;
    width: 800px;
}
.machine.stock{
	left: 138px;
    margin-top: 100px;
}
.stock-contents{
border: 1px black solid;
    height: 100%;
    width: 800px;
}
.cImg {
    width: 150px;
}
	
</style>
<script>
$(function(){
	
	/*  $.ajax({
		type : 'GET',
		url : 'getVendingMachineInfo',
		dataType : 'json',
		success : function(data){
			var show_ul = "";
			for(var i = 0; i < data.length; i++){
				 var no = data[i].vendingId;
				 show_ul += "<tr class='data' id='"+no+"' onclick='callDrinks("+no+")'><td>"+no+"</td>"
					+ "<td>"+data[i].vendingLocation+"</td>"
					+ "<td>"+data[i].vendingAsInfo+"</td>"
					+ "<td>"+data[i].vendingField+"</td></tr>"; 
			}
			console.log(show_ul);
			$(".tb-machine").append(show_ul);
		}
	});   */
	 
	 $(".data").click(function(){
		var no = $(this).attr("id");
		alert("tr click test and no : "+no);
		
		$.ajax({
			type : 'GET',
			url : 'getDrinks',
			data : 'vendingId='+no,
			dataType : 'json',
			success : function(data){
				console.log(data);
				var show_ul = "";
				for(var i = 0; i<data.length; i++){
					var img = data[i].drinkName+'.jpg';
					show_ul += "<td class='drinkImg' id='"+data[i].drinkId+"' style='text-align:center'><img class='cImg' src='./././resources/image/"+img+"'/><br/>"+data[i].drinkName+"<br/>재고 수 : "+data[i].stockQuantity+"</td>"
				}
				$(".tb-stocks > ").find("tr").html(show_ul);
			}
		});
		
		$.ajax({
			type : 'GET',
			url : 'getDrinkSales',
			data : 'vendingId='+no,
			dataType : 'json',
			success : function(jdata){
				console.log("매출 그래프 데이터 입니다.");
				console.log(jdata);
				
				google.charts.load('current', {packages: ['corechart', 'bar']});
				google.charts.setOnLoadCallback(drawMultSeries);
				
				function drawMultSeries(){
					var data = new google.visualization.DataTable();
 					data.addColumn('string', '음료수 종류');
 					data.addColumn('number', '남자');
 					data.addColumn('number', '여자');
 					data.addRows(jdata.length);
 					for (i = 0; i < jdata.length; i++) {
 						data.setCell(i, 0, jdata[i].drinkName);
 						data.setCell(i, 1, jdata[i].countForMale);
 						data.setCell(i, 2, jdata[i].countForFemale);
 					}

 					 var options = {
 					          chart: {
					            title: '남녀별 음료 매출'}
 					        };

				    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
				    chart.draw(data, options);
				}  
				
			}
		});
	}); 
	
});

/* function callDrinks(no){
	alert("tr click test and no : "+no);
} */

    

</script>
</head>
<body>
<h1>자판기 관리(매출, 재고)</h1>
<div class="machine-container">
	<div class="machine-wrapper">
		<div class="machine list">
			<div class="title">자판기 리스트</div>
			<div class="list-contents">
				<center>
					<table border class="tb-machine">
						<tr><th>자판기 번호</th><th>자판기 위치</th><th>수리기사 번호</th><th>자판기 세부위치</th></tr>
						<c:forEach var="vMachine" items="${item}">
							<tr class="data" id="${vMachine.vendingId}" style="text-align:center">
								<td>${vMachine.vendingId}</td>
								<td>${vMachine.vendingLocation}</td>
								<td>${vMachine.vendingAsInfo}</td>
								<td>${vMachine.vendingField}</td>
							</tr>
						</c:forEach>
					</table>
			</center>
			</div>
		</div>
		<div class="machine sales">
			<div class="title">자판기 음료 재고 현황</div>
			<div class="sales-contents">
				<center>
					<table class="tb-stocks">
						<tr></tr>
					</table>
				</center>
			</div>
					
		</div>
		<div class="machine stock">
			<div class="title">자판기 음료 판매 그래프</div>
			<div class="stock-contents">
				<div id="chart_div"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>