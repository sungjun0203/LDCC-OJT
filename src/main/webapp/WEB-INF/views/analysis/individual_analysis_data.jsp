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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(function(){
	var loc = "";
	var field = "";
	$("#sl_fi").change(function(){
		field = $("#sl_fi option:selected").val();
		 $.ajax({
			 type:"post",
			 url: "getBev",
			 dataType:"json",
			 data : "vendingLocation="+loc+""
			 success:function(data){
				//console.log(data);
				$("#sl_fi").children().remove();
				var show_ul = "<option var='all'>전체보기</option>";
				for(var i=0; i<data.length; i++){
					show_ul += "<option var='"+data[i].vendingField+"'>"+data[i].vendingField+"</option>";
				}
				$("#sl_fi").append(show_ul);
	         }
		 });	
	});
	
	$("#sl_lo").change(function(){
		loc = $("#sl_lo option:selected").val();
		 $.ajax({
			 type:"post",
			 url: "getField",
			 dataType:"json",
			 data : "vendingLocation="+loc,
			 success:function(data){
				//console.log(data);
				$("#sl_fi").children().remove();
				var show_ul = "<option var='all'>전체보기</option>";
				for(var i=0; i<data.length; i++){
					show_ul += "<option var='"+data[i].vendingField+"'>"+data[i].vendingField+"</option>";
				}
				$("#sl_fi").append(show_ul);
	         }
		 });	
	});
});

function getDrinkRanking(id){
	location.href="${pageContext.request.contextPath}/analysis/getIndividualAnalysisData.do?vendingId="+id;
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
                <a class="navbar-brand" href="index.html"><img src="/resources/assets/img/logo-new.jpg" alt="lotte logo" align="middle" style="width:50px;position: relative;top: 50%;transform:translateY(-50%);"/></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> Last access : 30 May 2014 &nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
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
						   <a  class="active-menu"  onclick="moveAnalysis()"><i class="fa fa-chart-pie fa-3x"></i> <br>Analysis</a>
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
						<h2>분석</h2>
						<h5>칠성에서 음료 개발 및 마케팅 정보로 활용할 수 있는 자판기 판매 분석 랭킹 보는곳이라는 말을 예쁘게
							고쳐주세요.</h5>
					</div>
					</div>
                	<hr>
                	<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-back noti-box" style="height: 600px;">
							<!--     <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span>-->
							<div class="text-box">
								<p class="main-text">자판기 매출 순위</p>
								<hr />
								<div class="row">
								<div style="height: 500px; overflow-y: scroll;">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>자판기ID</th>
														<th>매출액</th>
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
					
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-back noti-box" style="height: 600px;">
							<div class="text-box">
								<p class="main-text"> ${vendingId} / 음료 매출 순위</p>
								<hr />
								<div class="row">
								<div style="height: 500px; overflow-y: scroll;">
											<table class="table table-hover">
												
											</table>
									</div>
								</div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>

						</div>
					</div>
					
					
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="panel panel-back noti-box" style="height: 600px;">
							<div class="text-box">
								<p class="main-text"> 위치 및 필드별 음료 매출 순위</p>
								<hr />
								지역 선택<select id="sl_lo">
									<option value="location">지역</option>
									<option id="all" value="all">전체보기</option>
									<c:forEach var="loc" items="${location}">
									<option value="${loc.vendingLocation}">${loc.vendingLocation}</option>
									</c:forEach>
								</select>
								필드 선택<select id="sl_fi">
									<option value="field">필드</option>
									<option id="all" value="all">전체보기</option>
								</select>
								<div class="row">
								<div style="height: 500px; overflow-y: scroll;">
											<table class="table table-hover">
												
											</table>
									</div>
								</div>
								<!-- <p class="text-muted">Messages</p>-->
							</div>

						</div>
					</div>
					
					
					
					</div>
					</div>
					
					
					
                	<%-- 	<div class="row" id="memberTable">
                		     <div class="col-md-4 col-sm-12 col-xs-12">
                         
                         			<div class="panel panel-back noti-box" style="height:680px;">
							<div class="text-box">
								<p class="main-text">자판기 매출 순위</p>
								<hr />
								<!-- <p class="text-muted">Messages</p>-->
							</div>
							<div>
								<div class="row">
									<div style="height: 550px; overflow-y: scroll;">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>자판기ID</th>
														<th>매출액</th>
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

									


																<div class="col-md-10">
																	<table class="table table-hover">
																		<thead>
																			<tr>
																				<td>음료</td>
																				<td>매출</td>
																			</tr>
																		</thead>
																		<tbody id="drinksRanking">
																			<c:if test="${drinkRankingList != null}">
																				<c:forEach items="${drinkRankingList}"
																					var="drinkRank" varStatus="status">
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
														</div>

														<div id="drinkRanking"></div>
										</div>

										<div id="dual_x_div" style="width: 900px; height: 500px;"></div>

								<!-- /. ROW  -->
								<hr />

								<!-- /. ROW  -->
							</div>
							<!-- /. PAGE INNER  -->
            </div> --%>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    
   
</body>

</html>

