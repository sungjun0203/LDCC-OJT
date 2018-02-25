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

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../fuji/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->


	<div class="container">
	
	
	

		<table class="table table-hover">
			<thead>
				<tr class="table-info" style="text-align: center">
					<th scope="col" style="width: 5%">번호</th>
					<th scope="col" style="width: 15%">담당</th>
					<th scope="col" style="width: 10%">전화번호</th>
					<th scope="col" style="width: 10%">이름</th>
					<th scope="col" style="width: 50%">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-light" style="text-align: center">
					<th scope="row" style="width: 5%">1</th>
					<td style="width: 15%">크로마키 담당</td>
					<td style="width: 10%">031-651-8891</td>
					<td style="width: 10%">박성준</td>
					<td style="width: 50%">안녕하세요</td>
				</tr>
			</tbody>
		</table>

		<!-- 푸터 -->
		<jsp:include page="../fuji/footer.jsp"></jsp:include>
		<!-- 푸터 끝 -->
	</div>
</body>



<script>
	</script>

</html>


