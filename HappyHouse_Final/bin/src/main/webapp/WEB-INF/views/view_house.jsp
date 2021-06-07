<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건물 조회</title>
<style>
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
<!-- 여기에 헤더 넣기 -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
  <div class="container">
  <div class="col-md-12">
<h1>건물 조회</h1>
<c:if test="${!empty house}">	
	<!-- 건물 목록 -->
	<table class="table table-dark table-striped">
		<thead>	
			<tr><th> 항목</th><th> 내용</th><tr>
		</thead>
		<tbody>
				<tr><td>동명</td><td> ${house.dong} </td></tr>
				<tr><td>건물명</td><td> ${house.aptName} </td></tr>
				<tr><td>가격</td><td>  ${house.dealAmount} </td></tr>
				<tr><td>년도</td><td>  ${house.buildYear} </td></tr>
				<tr><td>면적</td><td>  ${house.area} </td></tr>
		</tbody>
	</table>
</c:if>
<c:if test="${empty house}">
	<p>조회된 건물이 없습니다.</p>
</c:if>

<div class="list-group list-group-horizontal">
<%-- <a href="./main_list?action=delete&no=${house.no}" class="list-group-item">삭제하기</a>

<!--  수정페이지로 이동  -->
<a href="./main_list?action=update&no=${house.no}" class="list-group-item">수정하기</a> --%>

<a href="${root}/" class="list-group-item">메인 으로</a>

</div>
</div>
</div>

</body>
</html>