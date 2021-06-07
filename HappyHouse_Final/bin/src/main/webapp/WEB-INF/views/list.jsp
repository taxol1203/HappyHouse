<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건물 목록</title>
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

  <div class="container">
  <div class="col-md-12">
	<h1>건물 목록</h1>
	<!-- 선택 검색 영역 -->
  <div class="form-group">
	<form action="${root }/house/list" method="get">
	<input type="hidden" name="action" value="list">
		<!-- 드래그드롭리스트 -->
		<select name="searchField">
			<option value="LIST">전체</option>
			<option value="NAME"
				<c:if test="${searchField=='NAME' }">selected</c:if>>
				건물명</option>
			<option value="DONG"
				<c:if test="${searchField=='DONG' }">selected</c:if>>
				동명</option>
			<option value="PRICE"
				<c:if test="${searchField=='PRICE' }">selected</c:if>>
				가격</option>
		</select>
		<input type="text" name="searchText" value="${searchText}">
		<input type="submit" value="검색">
	</form>
	</div>
	<!-- 건물 목록 -->
	<table class="table table-dark table-striped">
		<thead>	
			<tr>
			<th>번호</th>
			<th>동명</th>
			<th>건물명</th>
			<th>가격</th>
			<th>년도</th>
			<th>면적</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="house" items="${houses}" varStatus="vs">
				<tr>
				<td> ${vs.count} </td>
				<td> ${house.dong} </td>
				<td><a href="${root}/house/view/${house.no}"> ${house.aptName}</a> </td>
				<td>  ${house.dealAmount} </td>
				<td>  ${house.buildYear} </td>
				<td>  ${house.area} </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 선택항목 -->
<div class="list-group list-group-horizontal">
<a href="${root}/house/insert_house.jsp" class="list-group-item">추가 등록</a>

<a href="${root}/" class="list-group-item">메인 으로</a>

</div>

</div>
</body>
</html>