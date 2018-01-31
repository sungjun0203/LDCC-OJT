<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<div class="container">
	
	<H1>얼굴인식 테스트</H1>
	
	<form id="machineForm" name="machineForm"  action="/abcd" enctype="multipart/form-data"  method="POST">
		<div class="form-group">
	      <label for="exampleInputFile">File input</label>
	      <input type="file" id="file" name="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
	      <small id="fileHelp" class="form-text text-muted">LOTTE FACE API</small>
	    </div>
	    
	    <button class="btn btn-primary" type="submit" onclick="submitMachine()">테스트</button>
    
    </form>
    
    
    
	<!-- 헤더 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 헤더 끝 -->



</body>
</html>

<script>

function submitMachine(){
	alert();
	
	
}



</script>