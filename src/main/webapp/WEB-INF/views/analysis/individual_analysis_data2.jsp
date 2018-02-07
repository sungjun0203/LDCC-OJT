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




    
</head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	function getDrinkRanking(id){
		location.href="${pageContext.request.contextPath}/analysis/getIndividualAnalysisData.do?vendingId="+id;
	}
	function getAgeAndGender(drinkId, vendingId){
		location.href="${pageContext.request.contextPath}/analysis/getIndividualAnalysisData_test.do?vendingId="+vendingId+"&drinkId="+drinkId;
	}

    
</script>

   <script type="text/javascript">
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawStuff);
  
  

  function drawStuff() {

	  var drinkName='${drinkName}';
    var data = new google.visualization.arrayToDataTable([
    	 ['', 'Male', 'Female'],
    	
       	<c:forEach var="ageAndGenderList" items="${ageAndGenderList}">
  	 	 	["${ageAndGenderList.customerAge}",${ageAndGenderList.maleCount}, ${ageAndGenderList.femaleCount}],
		</c:forEach>
  

    ]);
    var options = {
    		width: 800,

      bars: 'horizontal', // Required for Material Bar Charts.
      backgroundColor: 'transparent',
      fontName:'Noto Sans KR',
		fontSize:'13',
		showRowNumber: true, width: '100%', height: '100%'
    };

  var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
  chart.draw(data, options);
};
  </script> 
 <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Time(H)');
      data.addColumn('number', '${drinkSalesGraphInfoByTimeList[0].drink1Name}');
      data.addRows([

		<c:forEach var="drinkSalesGraphInfoByTimeList" items="${drinkSalesGraphInfoByTimeList}">
	 	 	[${drinkSalesGraphInfoByTimeList.sellDate}, ${drinkSalesGraphInfoByTimeList.drink1}],
		</c:forEach>

      ]);

      var options = {

        width: 900,
        height: 500,
        axes: {
          x: {
            0: {side: 'bottom'}
          }
        }, backgroundColor: 'transparent',
        fontName:'Noto Sans KR',
		fontSize:'13',
		showRowNumber: true, width: '100%', height: '100%'
      };

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, options);
    }
  </script>
      
       <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Month');
      data.addColumn('number', '${drinkSalesGraphInfoByMonthList[0].drink1Name}');
      data.addRows([

		<c:forEach var="drinkSalesGraphInfoByMonth" items="${drinkSalesGraphInfoByMonthList}">
	 	 	[${drinkSalesGraphInfoByMonth.sellDate}, ${drinkSalesGraphInfoByMonth.drink1}],
		</c:forEach>

      ]);

      var options = {
        width: 900,
        height: 500,
        axes: {
          x: {
            0: {side: 'bottom'}
          }
        },
        backgroundColor: 'transparent',
        fontName:'Noto Sans KR',
		fontSize:'13',
		showRowNumber: true, width: '100%', height: '100%'
      };

      var chart = new google.charts.Line(document.getElementById('line_top_y'));

      chart.draw(data, options);
    }
  </script>
      
<body>
    <div id="wrapper">
         <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="/resources/assets/img/lotte-logo.png" alt="lotte logo" align="middle" style="width:50px;position: relative;top: 50%;transform:translateY(-50%);"/></a> 
            </div>
 
  <div style="color: white;padding: 15px 50px 5px 50px;float: left;font-size: 16px; position: relative;top: 50%;">
            <span style="color:#ED3A2E; font-size:30pt; font-weight:600;">L.SMO</span>
      </div>     
        </nav>   
  
  
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation" >
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					
                    <li>
                        <a class="active-menu"  onclick="moveHome(this.id)" id="navi1"><i class="fa fa-home fa-3x"></i> <br>Home</a>
                    </li>
                     <li>
                        <a  class="text-center" onclick="moveMember(this.id)" id="navi2"><i class="fa fa-users fa-3x"></i> <br>Member</a>
                    </li>
                     <li>
                        <a  class="text-center" onclick="moveMachine()" id="navi3"><i class="fa fa-calculator fa-3x"></i> <br>Machine</a>
                    </li>
						   <li  >
						   <a  class="text-center"  onclick="moveAnalysis()"><i class="fa fa-chart-pie fa-3x"></i> <br>Analysis</a>
                    </li>	
                    
                    <li><a class="text-center" onclick="moveRank()"><i
						class="fa fa-chart-bar fa-3x" ></i> <br>Rank</a></li>
                </ul>
            </div>
        </nav>  
        <!-- /. NAV SIDE  -->
        	<div id="page-wrapper">
			<div id="page-inner">
			
				<div class="row">
				<div class="col-md-12">
					<h2>분석</h2>
					<h5>칠성에서 음료 개발 및 마케팅 정보로 활용할 수 있는 자판기 판매 분석 랭킹 보는곳이라는 말을 예쁘게 고쳐주세요.</h5>
				</div>
				</div>
				
				
				
				
				<hr/>
				<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="panel panel-back noti-box" style="height: 600px;">
						<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
						<div class="text-box">
							<p class="main-text">자판기 판매 순위</p>
							<hr />
							<div class="row">
								<div style="height: 500px; overflow-y: scroll;">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>자판기ID</th>
												<th>판매량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${vmRankingList}" var="vendingDto"
												varStatus="status">
												<tr id="${vendingDto.vendingId}"
													onclick="getDrinkRanking(this.id)">
													<td>${vendingDto.vendingId}</td>
													<td>${vendingDto.sales}</td>
												</tr>

											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
							<!-- <p class="text-muted">Messages</p>-->
						</div>

					</div>
				</div>
				
				
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="panel panel-back noti-box" style="height: 600px;">
						<div class="text-box">
							<p class="main-text">자판기 번호 : ${vendingId} / 음료 판매 순위</p>
							<hr />
							<div class="row">
								<div style="height: 500px; overflow-y: scroll;">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>음료</th>
												<th>판매량</th>
											</tr>
										</thead>
										<tbody id="drinksRanking">
											<c:if test="${drinkRankingList != null}">
												<c:forEach items="${drinkRankingList}" var="drinkRank"
													varStatus="status">
													<tr id="${drinkRank.drinkId}"
														onclick="getAgeAndGender(this.id,${vendingId})">
														<td>${drinkRank.drinkName}</td>
														<td>${drinkRank.sales}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<!-- <p class="text-muted">Messages</p>-->
						</div>
						</div>
						</div>

		</div>	
				<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-back noti-box">
				<div class="text-box">
							<p class="main-text">
								 ${drinkName}   /  성별,나이 분석
							</p>
							<hr/>
				<div id="dual_x_div" >
				</div>
				</div>
				</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-back noti-box">
				<div class="text-box">
							<p class="main-text">
								 ${drinkName}   /  시간 별 판매량
							</p>
							<hr/>
							<div id="line_top_x" ></div>
							</div>
							</div>
						</div>
						</div>
						<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-back noti-box">
						<div class="text-box">
							<p class="main-text">
								 ${drinkName}   /  월 별 판매량
							</p>
							<hr/>
							<div id="line_top_y" ></div>
							</div>
							</div>
						</div>
						</div> <!-- row -->
	</div> <!-- inner -->
</div>
    
   
</body>

</html>

