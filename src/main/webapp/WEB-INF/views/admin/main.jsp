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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		  div { font-family: 'Noto Sans KR'; }
		  p {font-family: 'Noto Sans KR';}
		  h2 {font-family: 'Noto Sans KR'; }
		  h5 {font-family: 'Noto Sans KR'; }
</style>

<script>

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['정상',    ${vendingCount.normalVendingCount} ],
    ['에러',    ${vendingCount.errVendingCount}   ],
  ]);
  
  // ${vendingCount.normalVendingCount}
  // ${vendingCount.errVendingCount}

  var options = {
          pieHole: 0.7,
          pieSliceText : 'none',
          slices: {
                0: { color: '#292c44' },
                1: { color: '#ff5349' }
          },
      	fontName:'Noto Sans KR',
    	fontSize:17,
          chartArea:{width:'100%',height:'100%'},
          legend: 'none',
          backgroundColor : 'transparent'
   };
  
  

  var chart = new google.visualization.PieChart(document.getElementById('nowVendingStatus'));
  chart.draw(data, options);
}
</script>

<script>
function getTodayLabel() { 
	var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'); 
	var today = new Date().getDay(); 
	var todayLabel = week[today]; 
	return todayLabel; 
}

</script>

 <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['weekDay', '일 매출'],
          
          <c:forEach var="allSalesInfo" items="${allSalesInfo}">
          
        	["${allSalesInfo.date}", ${allSalesInfo.price}],

      	   </c:forEach>
        ]);

        var options = {
        backgroundColor: 'transparent',
        colors: ['#292c44']
        };

        var chart = new google.visualization.AreaChart(document.getElementById('allSalesStatus'));
        chart.draw(data, options);
      }
      
      
     function moveToMachine(no){
    	// alert(no);
    	$(location).attr("href","/vending?machineNum="+no);
     }
   </script>

</head>

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
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>자판기 정보 한눈에 보기</h2>   
                        <h5>자판기 관련 정보를 한 눈에 볼 수 있는 페이지 입니다. </h5>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
<!--                    upper row
-->                <div class="col-md-6 col-sm-12 col-xs-12">           
			<div class="panel panel-back noti-box" style="height:300px;">
                <div class="text-box" >
                    <p class="main-text">실시간 자판기 총현황</p>
                    <hr />
                   <!-- <p class="text-muted">Messages</p>-->
                </div>
                <div>
                    <div class="col-md-5 col-sm-12 col-xs-12" style="padding:10px 10px 0px 10px;">
                    	<div id="nowVendingStatus" style="height:200px;" ></div>
   	  	                    <div style="text-align: center; z-index:10; position:relative;transform:translateY(-220%); font-size:30pt; font-weight:600;color:#292c44;">${vendingCount.normalVendingCount/vendingCount.allVendingCount*100}%       	</div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6" style="transform:translateY(100%);">
                    	<p><text style="font-size:15pt; font-weight:500;">정상 작동</text></p>
                    	<p><text style="font-size:35pt; font-weight:700; color:#5E5D5C;">${vendingCount.normalVendingCount}/</text>
                    	     <text style="font-size:20pt; font-weight:700; color:#5E5D5C;">${vendingCount.allVendingCount}대</text></p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6" style="transform:translateY(100%);">
                      	<p><text style="font-size:15pt; font-weight:500;">결함 발견</text></p>
                      	<p><text style="font-size:35pt; font-weight:700; color:#E20411;">${vendingCount.errVendingCount}</text>
	                      	<text style="font-size:20pt; font-weight:700; color:#E20411;">대</text></p>
					</div>
                </div>
             </div>
		     </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">           
			<div class="panel panel-back noti-box">
			<div>
                    <p class="main-text">실시간 이상 작동 현황</p>
                    <hr/>
                    </div>
                    <div style="height:220px; overflow-y:scroll;">
                    <table class="table table-hover col-md-12 col-sm-12 col-xs-12">
                        <thead><tr>
    <th>기기 번호</th>
    <th>이상 코드</th>
    <th>관리자</th>
    <th>연락처</th>
  </tr>
  </thead>
  <tbody >
  
  	<c:forEach var="problem" items="${problemVending}">
  	
  	<tr onclick="moveToMachine(${problem.vending_id})" id="${problem.vending_id}">
	    <td>${problem.vending_id}</td>
	    <td>${problem.state}</td>
	    <td>${problem.as_name}</td>
	    <td>${problem.as_phone}</td>
	  </tr>

	</c:forEach>
  
  </tbody>
                    </table></div>
                </div>
             </div>
		     </div>
                                 <!-- /. ROW  -->
                                 <hr/>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-back noti-box" style="min-height: 380px;">
						<div class="text-box">
							<p class="main-text">총 매출 현황</p>
							<hr />

							<div id="allSalesStatus" style="width: 100%; height: 400px;"></div>


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

