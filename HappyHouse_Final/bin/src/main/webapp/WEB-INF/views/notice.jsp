<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 목록</title>
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
<h1>공지사항</h1>
<!-- 리스트 목록을 받아야함 -->

<!-- 건물 목록 -->
<table class="table table-dark table-striped">
	<thead>	
		<tr>
		<th>번호</th>
		<th>제목</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="notice" items="${notices}" varStatus="vs">
			<tr>
			<td>${vs.count}</td>
			<td><a href="${root}/notice/view/${notice.num}"> ${notice.title}</a> </td>
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