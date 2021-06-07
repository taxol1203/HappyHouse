<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<h1>회원 가입</h1>
<form action="main" method="post">
<fieldset>
<legend>회원 가입</legend>
<input type="hidden" name="action" value="join">

<label for="id">아이디</label>
<input type="text" id="id" name="id"><br>

<label for="pass">비밀번호</label>
<input type="text" id="pass" name="pass"><br>

<label for="name">이름</label>
<input type="text" id="name" name="name"><br>

<label for="addr">이메일</label>
<input type="text" id="addr" name="addr"><br>

<label for="phone">전화번호</label>
<input type="text" id="phone" name="phone"><br><br>

<input type="submit" value="등록">
<input type="reset" value="취소">
</fieldset>
</form>
</body>
</html>