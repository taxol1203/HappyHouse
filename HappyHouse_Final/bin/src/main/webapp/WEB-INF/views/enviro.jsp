<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환경 정보</title>
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

<form action="main_environ" method="post">
  <div class="container">
  <div class="col-md-12">
<h1>환경정보</h1>
	<!-- 선택 검색 영역 -->
  <div class="form-group">
	<form action="enviro" method="get">
	<input type="hidden" name="action" value="list">
		<input type="text" name="searchText" value="${searchText}">
		<input type="submit" value="검색">
	</form>
	</div>
<!-- 환경정보 테이블 -->
	<table class="table table-dark table-striped">
		<thead>	
			<tr>
			<th>번호</th>
			<th>업체명</th>
			<th>업종명</th>
			<th>점검일자</th>
			<th>점검결과</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="env" items="${environs}" varStatus="vs">
				<tr>
				<td> ${vs.count} </td>
				<td> ${env.cname} </td>
				<td>  ${env.wname} </td>
				<td>  ${env.date} </td>
				<td>  ${env.aans} </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
<div class="list-group list-group-horizontal">
<!-- <a href="regist.jsp" class="list-group-item">추가 등록</a> -->
<a href="${root }/" class="list-group-item">메인 으로</a>
</div>
</div>
</form>
</body>
</html>