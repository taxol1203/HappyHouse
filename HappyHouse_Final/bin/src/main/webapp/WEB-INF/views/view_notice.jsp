<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 조회</title>
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
<h1>공지 내용</h1>
<c:if test="${!empty notice}">	
	<table class="table table-dark table-striped">
	<thead>
		<tr><th> 항목</th><th> 내용</th><tr>
	<tbody>
		<tr><td> 공지번호</td><td>${notice.num}</td></tr>
		<tr><td> 공지명</td><td>${notice.title}</td></tr>
		<tr><td> 작성자</td><td>${notice.writer}</td></tr>
		<tr><td> 내용</td><td>${notice.des}</td></tr>
	</tbody>
	</table>
</c:if>
<c:if test="${empty notice}">
	<p>조회된 공지가 없습니다.</p>
</c:if>

<div class="list-group list-group-horizontal">
<%-- <a href="regist.jsp" class="list-group-item">추가 등록</a>
<a href="./main_notice?action=dele&num=${notice.num}" class="list-group-item">삭제하기</a> --%>

<a href="${root }/" class="list-group-item">메인 으로</a>

</div>
</div>
</div>

</body>
</html>