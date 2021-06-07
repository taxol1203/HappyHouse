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
<form action="main" method="post">
<h1>회원 정보 수정</h1>
<input type="hidden" name="action" value="modify">
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
			<td><input type="text" id="id" name="id" value="${userinfo.id}" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" id="pass" name="pass" value="${userinfo.pass}"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${userinfo.name}"></td>
		</tr>
		<tr>
			<td>메일주소</td>
			<td><input type="text" id="addr" name="addr" value="${userinfo.addr}"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" id="phone" name="phone" value="${userinfo.phone}"></td>
		</tr>
	</tbody>
</table>
	<input type="submit" value="수정완료">
	<a href="index.jsp">메인으로</a>
	</form>
</body>
</html>