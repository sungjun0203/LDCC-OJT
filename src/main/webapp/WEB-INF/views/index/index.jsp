<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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

</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->
		
		<!-- 작성자: 박성준 -->
		<!-- 관리자 로그인 -->
		<div class="container" style="margin-top:70px">
			<div class="row" >
				<div class="col-sm-1 col-md-1 col-md-offset-1" ></div>
		        <div class="col-sm-6 col-md-4 col-md-offset-4">
		            <div class="account-wall" style="height:334px">
		                <div id="my-tab-content" class="tab-content col-sm-12" >
								<div class="tab-pane active" id="login" >
			               		    <img class="profile-img" src="http://image.ajunews.com/content/image/2014/05/21/20140521120738155878.png" alt="">
			               			<form class="form-iignIn" action="" id="loginForm" name="loginForm" method="POST" style="width:100%;">
			               				<input type="text" style="margin-top:60px"class="form-control" placeholder="ID" id="userId" name="userId" required autofocus>
			               				<input type="password" style="font-family:arial; margin-top:5px" class="form-control" placeholder="Password" id="userPw" name="userPw" required>
			               				<input type="button" style="width:100%; margin-bottom:5px; margin-top:40px" class="btn btn-primary" onClick="login();" value="LOGIN" />
			               			</form>
								</div>
		            	</div>
		        	</div>
	    		</div>
	    		<div class="col-sm-5 col-md-7 col-md-offset-7" >
	    			<img class="left-img" src="http://dimg.donga.com/egc/CDB/SHINDONGA/Article/14/90/86/14/1490861426859.jpg">
	    		</div>
			</div>
	<!-- 푸터 -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 끝 -->
		</div>
	</body>
</html>


<script>
function login(){
	
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
	
	$.ajax({
		url : "/admin/loginCheck",
		dataType : "text",
		type : "POST",
		data : {
			"adminId" : userId,
			"adminPw" : userPw
		},
		success : function(data) {
			
			if(data=="success"){
				location.href = "/main/main";
			}
			
			else{
				swal({
					  type: 'error',
					  title: '관리자만 접근가능',
					  text: '아이디와 비밀번호를 확인해주세요',
					})
			}
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
	
	
}
</script>