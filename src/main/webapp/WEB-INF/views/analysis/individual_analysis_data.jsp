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
<script type="text/javascript">
	function getDrinkRanking(id){
		$.ajax({
			url : "${pageContext.request.contextPath}/analysis/getDrinkRankingByVendingId.do",
			data : "vendingId="+id,
			success : function(data){
				//var drink=JSON.stringify(data);
				var table = $("#drinksRanking");
				var html="";
				$.each(data,function(key,value) {
					alert('key:'+key+', value:'+value.drinkName+', sales:'+value.sales);
					html+=("<tr id="+key+" onclick=getAgeAndGenderAnalysis(this.id,"+id+")><td>"+value.drinkName+"</td>"
							+"<td>"+value.sales+"</td></tr>");
				});
				table.html(html);
			}
		});
	}
	
	function getAgeAndGenderAnalysis(drinkId,vendingId){
		alert(drinkId+"     "+vendingId);
		$.ajax({
			url : "${pageContext.request.contextPath}/analysis/getAgeAndGenderAnalysis.do",
			data : "vendingId="+vendingId+"&drinkId="+drinkId,
			success : function(data){
				alert(1);
			}
		});
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
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					
                    <li>
                        <a class="active-menu"  href="index.html" ><i class="fa fa-home fa-3x"></i> <br>Home</a>
                    </li>
                     <li>
                        <a  class="text-center" href="ui.html"><i class="fa fa-users fa-3x"></i> <br>Member</a>
                    </li>
                     <li>
                        <a  class="text-center" href="tab-panel.html"><i class="fa fa-calculator fa-3x"></i> <br>Machine</a>
                    </li>
						   <li  >
						    <a  class="text-center" href="${pageContext.request.contextPath}/analysis/getIndividualAnalysisData.do"><i class="fa fa-chart-pie fa-3x"></i> <br>Analysis</a>
                    </li>	
                      <li  >
                        <a  class="text-center" href="table.html"><i class="fa fa-chart-line fa-3x"></i> <br>Sales</a>
                    </li>
                    <li  >
                        <a  class="text-center" href="form.html"><i class="fa fa-bullhorn fa-3x"></i> <br>Notice </a>
                    </li>				
					
					                   
                    <!--<li>
                        <a  class="text-center" href="#"><i class="fa fa-sitemap fa-3x"></i> <br>Multi-Level Dropdown<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>
                               
                            </li>
                        </ul>
                      </li>  
                  <li  >
                        <a   class="text-center" href="blank.html"><i class="fa fa-square-o fa-3x"></i> <br>Blank Page</a>
                    </li>		-->
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                
                
                		<div class="row" id="memberTable">
							<div class="col-md-1"></div>
							<div class="col-md-10" style="height: 650px; overflow-y: scroll;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>자판기ID</th>
											<th>매출액</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${vmRankingList}" var="vendingDto" varStatus="status">
											<tr id="${vendingDto.vendingId}" onclick="getDrinkRanking(this.id)">
												<td>${vendingDto.vendingId}</td>
												<td>${vendingDto.sales}</td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
								<div class="col-md-1" style="height: 650px; overflow-y: scroll;">
									<table class="table table-hover">
										<thead>
											<tr>
												<td>음료</td>
												<td>매출</td>
											</tr>
										</thead>
										<tbody id="drinksRanking"></tbody>
									</table>
								</div>
							</div>
						</div>
                
                	<div id="drinkRanking"> </div>
                </div>              
                 <!-- /. ROW  -->
                <hr />                
                <div class="row"> 
                    
                      
                               <div class="col-md-9 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
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
    
   
</body>

</html>

