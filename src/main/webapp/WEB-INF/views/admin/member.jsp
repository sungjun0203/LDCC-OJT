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



<script>
function memberSubmit(){
	
	var asName = $("#asName").val();
	var asPhone = $("#asPhone").val();
	var asLocation = $("#asLocation").val();
	
	if(asName.length==0 || asPhone.length==0 || asLocation.length==0){
		swal({
			  type: 'error',
			  title: '에러',
			  text: '모든값을 입력해주세요',
			})
		
	}
	else{
		
		$.ajax({
			url : "/member/add",
			dataType : "text",
			type : "POST",
			data : $("#memberAdd").serialize(),
			success : function(data) {
				
				$('#myModal').modal('hide');
				$("#memberTable").load(window.location.href + " #memberTable");
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
}

function memberDelete(id){
	
	$.ajax({
		url : "/member/delete",
		dataType : "text",
		type : "POST",
		data : {"asId":id},
		success : function(data) {
			
			$("#memberTable").load(window.location.href + " #memberTable");
			
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
	
	
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
            <div>
  
 
  <div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px; position: relative;top: 50%;">
            <a href ="#">
          <i class="fa fa-bell fa-2x"style ="position: relative;top: 50%;transform:translateY(25%); color:#424242" ></i><span class="notice-badge badge">3</span></a>
          <span style="margin:3px;"></span>
      <img src="/resources/assets/img/profile.jpg" style="width:50px; height:50px; border-radius:50%; "/>
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
                        <a  class="active-menu" onclick="moveMember(this.id)" id="navi2"><i class="fa fa-users fa-3x"></i> <br>Member</a>
                    </li>
                     <li>
                        <a  class="text-center" onclick="moveHome()" id="navi3"><i class="fa fa-calculator fa-3x"></i> <br>Machine</a>
                    </li>
						   <li  >
                        <a  class="text-center" onclick="moveHome()" id="navi4"><i class="fa fa-chart-pie fa-3x"></i> <br>Analysis</a>
                    </li>
                     <li><a class="text-center" onclick="moveRank()"><i
						class="fa fa-chart-bar fa-3x" ></i> <br>Rank</a></li>
                      <li  >
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
						<h2>직원 목록</h2>
						<h5>직원 리스트입니다.</h5>
						<!--button row-->
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<button type="button" class="btn btn-default"
									style="margin-bottom: 20px; margin-right: 10px; float: right; background-color: #EDEDED" data-toggle="modal" data-target="#myModal">추가</button>
									
									
							</div>
							<div class="col-md-1"></div>
						</div>
						
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">직원 추가</h4>
						      </div>
						      <div class="modal-body">
						        <form id="memberAdd">
								  <div class="form-group">
								    <label for="exampleInputPassword1">이름</label>
								    <input type="text" class="form-control" id="asName" name="asName" placeholder="이름">
								  </div>
								  
								  <div class="form-group">
								    <label for="exampleInputPassword1">연락처</label>
								    <input type="text" class="form-control" id="asPhone" name="asPhone" placeholder="연락처">
								  </div>
								  
								  <div class="form-group">
								    <label for="exampleInputPassword1">관리구역</label>
								    <input type="text" class="form-control" id="asLocation" name="asLocation" placeholder="관리구역">
								  </div>
								  
								</form>
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-primary" onclick="memberSubmit()">저장</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						
						<div class="row" id="memberTable">
							<div class="col-md-1"></div>
							<div class="col-md-10" style="height: 650px; overflow-y: scroll;">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>사번</th>
											<th>이름</th>
											<th>연락처</th>
											<th>관리구역</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${memberList}">

											<tr>
												<td>${member.asId}</td>
												<td>${member.asName}</td>
												<td>${member.asPhone}</td>
												<td>${member.asLocation}</td>
												<td><a onclick="memberDelete(${member.asId})"><i class="fa fa-trash-alt fa-2x" style="width:15px; height:15px; position:relative;transform:translateY(-25%);"></i></a></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
								<div class="col-md-1"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />

			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->

</body>

</html>

