<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<table id="table" data-height="450" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th class="text-center" data-field="userNo">부서번호</th>
				<th class="text-center" data-field="userId">부서이름</th>
				<th class="text-center" data-field="userName">부서설명</th>
			</tr>
		</thead>
		<tbody id="result_tbody"></tbody>
		<c:forEach items="${departList}" var="dp"> <!-- c라고 붙은 애들은, 내부적으로 자바에서 동작하는 거임 -->
		
<%-- 		<c:if test="${dp.diNo%2 != 0 }" > --%>
			<tr onclick="goView(${dp.diNo})">
				<td>${dp.diNo}</td>
				<td>${dp.diName}</td>
				<td>${dp.diEtc}</td>
			</tr>
<%-- 		</c:if>  --%>
		</c:forEach>
	</table>	
</div>
<script>
	function goView(diNo){
		location.href="/depart/view?dino="+diNo;
	}
</script>
</body>
</html>