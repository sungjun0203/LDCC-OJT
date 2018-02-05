<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>Insert title here</title>

<!-- 템플릿 공통 -->
<jsp:include page="../common/template_common.jsp"></jsp:include>
<!-- 템플릿 공통 끝 -->

<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="/resources/sweetalert/sweetalert.js"></script>

</head>

<body>
    <div class="row" id="vmbgimg" style="overflow-x:hidden; background-color: #018226;">
        <div style="display:block;background-color:#fff; border-radius:12px; width:80%; height:1000px;margin-left:10%; margin-top:35px;">
        <!--<img src="assets/img_mobile/bg_vm.png" style="position:absolute; left:0px; top:0px; width:100%; height:218.5%;z-index:1;">-->
        <div class="row" style="height:160px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">
                <img src="/resources/assets/img_mobile/isis.png" style="width:12%; margin-left:12%;">
                <img src="/resources/assets/img_mobile/dusan.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/trevi.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/epro.png" style="width:12%;margin-left:9%;">
        </div>
        <div clss="row" style="background-color:#092382;height:20px;width:100%;font-color:transparent;"> </div>
        <div clss="row" style="background-color:#fff;height:40px;width:100%;font-color:transparent;">
            <label class="switch" style="margin-left:9%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
        </div>
        <div style="background-color:#999999; opacity:0.3; height:5px;width:100%; filter: blur(1px);"></div>
        
        <div class="row" style="height:130px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">
                <img src="/resources/assets/img_mobile/eproaqua.png" style="width:12%; margin-left:12%;">
                <img src="/resources/assets/img_mobile/sblatte.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/sol.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/mango.png" style="width:12%;margin-left:9%;">
        </div>
        <div clss="row" style="background-color:#092382;height:20px;font-color:transparent;"> </div>
        <div clss="row" style="background-color:#fff;height:40px;font-color:transparent;">
            <label class="switch" style="margin-left:9%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
        </div>
        <div style="background-color:#999999; opacity:0.3; height:5px;width:100%; filter: blur(1px);"></div>

         <div class="row" style="height:135px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">
                <img src="/resources/assets/img_mobile/sikhye.png" style="width:12%; margin-left:12%;">
                <img src="/resources/assets/img_mobile/milk.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/cider.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/pepsi.png" style="width:12%;margin-left:9%;">
        </div>
        <div clss="row" style="background-color:#092382;height:20px;font-color:transparent;"> </div>
        <div clss="row" style="background-color:#fff;height:40px;font-color:transparent;">
            <label class="switch" style="margin-left:9%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
        </div>
        <div style="background-color:#999999; opacity:0.3; height:5px;width:100%; filter: blur(1px);"></div>

         <div class="row" style="height:135px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">
                <img src="/resources/assets/img_mobile/dew.png" style="width:12%; margin-left:12%;">
                <img src="/resources/assets/img_mobile/gatoray.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/hotsix.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/letsbe.png" style="width:12%;margin-left:9%;">
        </div>
        <div clss="row" style="background-color:#092382;height:20px;font-color:transparent;"> </div>
        <div clss="row" style="background-color:#fff;height:40px;font-color:transparent;">
            <label class="switch" style="margin-left:9%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
        </div>
        <div style="background-color:#999999; opacity:0.3; height:5px;width:100%; filter: blur(1px);"></div>

         <div class="row" style="height:135px; vertical-align: bottom; align-items: flex-end; display: flex; flex-direction: row;">
                <img src="/resources/assets/img_mobile/silklone.png" style="width:12%; margin-left:12%;">
                <img src="/resources/assets/img_mobile/lipton.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/sweetsleep.png" style="width:12%;margin-left:9%;">
                <img src="/resources/assets/img_mobile/saksak.png" style="width:12%;margin-left:9%;">
        </div>
        <div clss="row" style="background-color:#092382;height:20px;font-color:transparent;"> </div>
        <div clss="row" style="background-color:#fff;height:40px;font-color:transparent; border-radius:12px;">
            <label class="switch" style="margin-left:9%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
            <label class="switch" style="margin-left:6.5%; position: relative;top: 50%;transform:translateY(-50%);">
              <input type="checkbox">
              <span class="slider round"></span>
            </label>
        </div>

        </div>
                <div style="margin:30px;"></div>
                <div style="text-align:center;">
                    <button style="background-color:#2F2725; border: none; color: white; padding: 10px 32px; text-align: center; text-decoration: none;  display: inline-block; font-size: 16px; margin: 4px 2px; width:79%">선택제품 주문하기</button>
                </div>
                <div style="margin:20px;"></div>
                <div style="text-align:center;">
                    <img src="/resources/assets/img_mobile/cider_ad.PNG" style="width:79%;text-align: center;display: inline-block; ">
                </div>
                <div style="margin:40px;"></div>
    </div>  
</body>
</html>

<script>

$( document ).ready(function() {
	
	swal("얼굴 분석 완료", "<strong> 당신의 성별은 :  ${faceResult.gender} <br> 당신의 나이는 : ${faceResult.age}<strong>", "success");
});

</script>

