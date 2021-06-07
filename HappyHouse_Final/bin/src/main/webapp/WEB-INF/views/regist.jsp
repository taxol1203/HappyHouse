<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssafy</title>
<style>
label {
	display: inline-block;
	width: 80px;
}

</style>
</head>
<body>
<%@ include file="/include/header.jsp"%>

  <div class="container">
  <div class="col-md-12">
<!-- main_notice 로 action 전달 post방식  -->
<form action="main_notice" method="post">
<div class="form-group">
	<fieldset>
	<legend></legend>
	<h1>공지를 등록 해 주세요.</h1>
	<!-- hidden타입으로 화면에 표시하지 않고 regist 값으로 전달 -->
	<input type="hidden" name="action" value="regist">

	<label for="num">공지번호: </label>
	<input type="text" id="num" name="num" value="1" class="form-control"><br>
	
	<label for="title">공지명: </label>
	<input type="text" id="title" name="title" value="알립니다." class="form-control"><br>
	
	<label for="writer">작성자: </label>
	<input type="text"id="writer" name="writer" value="홍길동" class="form-control"><br>
	
	<label for="des">내용: </label>
	<textarea id="des" name="des" class="form-control">입력...</textarea><br>
	
	<input type="submit" value="저장" >
	<input type="reset" value="취소" >
	</fieldset>
	</div>
</form>

</div>
</div>

</body>
</html>