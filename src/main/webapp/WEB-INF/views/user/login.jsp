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

<style>
body{
    background-color:#f5f5f5;
}
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 40px;
    margin-bottom : 40px;
    padding: 40px 0px 20px 0px;
    background-color: #ffffff;
    box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.16);
}
.login-title
{
    color: #555;
    font-size: 22px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 170px;
    height: 30px;
    margin: 0 auto 10px;
    display: block;
}
.select-img
{
	border-radius: 50%;
    display: block;
    height: 75px;
    margin: 0 30px 10px;
    width: 75px;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.select-name
{
    display: block;
    margin: 30px 10px 10px;
}
.logo-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.left-img{
	width:550px;
	height:334px; 
	margin-top :40px;
}
@media (max-width: 1024px) {
	.left-img{
		display:none;
	}
}
.id-pw-find{
text-align: right;
    display: inherit;
    font-size: 10px;
    margin-top: 10px;
    color: #1b82c7;
}
</style>



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->

	<!-- 작성자: 박성준 -->
	<!-- 관리자 로그인 -->
	<div class="container">

		<div class="progress" style="margin-bottom: 40px">
			<div class="progress-bar progress-bar-striped progress-bar-animated"
				role="progressbar" aria-valuenow="50" aria-valuemin="0"
				aria-valuemax="100" style="width: 50%"></div>
		</div>

	

		<div class="row" >
		
		
		        <div class="col-sm-6 col-md-4 col-md-offset-4">
		            <div class="account-wall">
		                <div id="my-tab-content" class="tab-content col-sm-12" >
		                
		                <div class="alert alert-dismissible alert-danger"
							style="margin-bottom: 10px">
							<strong>인증번호를 입력해주세요</strong>
						</div>
								<div class="tab-pane active" id="login" >
			               			<form class="form-iignIn" action="" id="loginForm" name="loginForm" method="POST" style="width:100%;">
			               				<input type="password" style="font-family:arial; margin-top:5px" class="form-control" placeholder="Password" id="userPw" name="userPw" required>
			               				<input type="button" style="width:100%; margin-bottom:5px; margin-top:40px" class="btn btn-primary" onClick="login();" value="LOGIN" />
			               			</form>
								</div>
		            	</div>
		        	</div>
	    		</div>
	</div>
</body>
</html>


<script>
function login(){
	
	
	var userPw = $("#userPw").val();
	
	

	$.ajax({
			url : "/user/loginCheck",
			dataType : "text",
			type : "POST",
			data : {
				"pw" : userPw
			},
			success : function(data) {

				if (data == "success") {
					location.href="/user/faceAnalysis"
					

				} else {
					swal({
						type : 'error',
						title : '로그인 실패',
						text : '인증된 회원만 이용가능합니다',
					})
				}

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});

	}
</script>


