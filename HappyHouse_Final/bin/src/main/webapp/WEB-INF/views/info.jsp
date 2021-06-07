<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<style>
table {
	border-collapse: collapse;
	width: 30%;
}

th, td {
	border: 1px solid black;
}

th:nth-child(1) {
	width: 100px;
}
</style>
</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<h1>회원 정보</h1>
	<table>
		<thead>
			<tr>
				<th>정보명</th>
				<th>회원정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td>${userinfo.id}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${userinfo.pass}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${userinfo.name}</td>
			</tr>
			<tr>
				<td>메일주소</td>
				<td>${userinfo.addr}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${userinfo.phone}</td>
			</tr>
		</tbody>
	</table>
	<a href="modify.jsp">정보수정</a>
	<a href="./main?action=delinfo&id=${userinfo.id}">회원탈퇴</a>
	<a href="index.jsp">메인으로</a>
</body>
</html>