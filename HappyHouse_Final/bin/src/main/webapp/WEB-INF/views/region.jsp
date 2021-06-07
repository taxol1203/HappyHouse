<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>happyhouse</title>
<style type="text/css">
table{
	border-collapse: collapse;
	width:100%;
}
td,th{
	border: 1px solid black;
}
th:nth-child(1) {
	width: 100px;	
}
</style>

</head>
<body>
<!-- 만들어둔 헤더 적용 -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<form action="main_notice" method="post">
  <div class="container">
  <div class="col-md-12">
<h1>${userinfo.name}님의 관심지역</h1>
<!-- 리스트 목록을 받아야함 -->

<table class="table table-dark table-striped">
	<thead>	
		<tr>
		<th>시</th>
		<th>구(군)</th>
		<th>동</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="region" items="${regions}" varStatus="vs">
			<tr>
			<td>${region.city}</td>
			<td>${region.gugun}</td>
			<td>${region.dong}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</div>
<div class="list-group list-group-horizontal">
<!-- <a href="regist_region.jsp" class="list-group-item">관심지역 추가</a> -->
<a href="${root }/" class="list-group-item">메인으로</a>
</div>
</div>
</form>
</body>
</html>