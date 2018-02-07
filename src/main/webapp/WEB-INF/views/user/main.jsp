<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>
<jsp:include page="../common/common.jsp"></jsp:include>

</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->
		
		<!-- 작성자: 박성준 -->
		<!-- 관리자 로그인 -->
		<div class="container" >
		
		<div class="progress">
		  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
		</div>
		
		<div class="col-lg-2" style="margin-top:40px"></div>
		<div class="col-lg-8" onclick="faceUse()">
			<div class="card text-white bg-primary">
			  <div class="card-header">얼굴인식 이용한 자판기 결제</div>
			  <div class="card-body">
				    <p class="card-text"> 사용자의 성별과 나이를 분석합니다. <br><br> 많이 사용하면 과금되기 때문에 <br> 롯데 회원만 사용 가능합니다.</p>
				    <p class="card-text" style="font-size:7px; color:red">  LOTTE Infinity는 데이터 분석 및 음료 추천을 위하여 개인정보를 처리합니다.  &nbsp; 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지
											않습니다.</p>
			  </div>
			</div>
		</div>
		<div class="col-lg-2" style="margin-bottom:30px"></div>
		
		<div class="col-lg-2"></div>
		<div class="col-lg-8" onclick="faceNotUse()">
		<div class="card text-white bg-info ">
		  <div class="card-header">일반 자판기 결제</div>
		  <div class="card-body">
		    <p class="card-text">얼굴인식을 했다는 가정하에 <br>데이터를 직접 입력 후 자판기를 이용합니다.</p>
		  </div>
		</div>
		<div class="col-lg-2"></div>
	<!-- 푸터 -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 끝 -->
		</div>
	</body>
</html>


<script>


function faceUse(){
	
	location.href="/user/login"
	
}

function faceNotUse(){
	location.href="/user/input"
}



</script>


