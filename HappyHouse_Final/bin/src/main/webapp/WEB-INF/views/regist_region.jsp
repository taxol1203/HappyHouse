<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>happyhouse</title>
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
	<h1>관심지역 등록</h1>
	<!-- hidden타입으로 화면에 표시하지 않고 regist 값으로 전달 -->
	<input type="hidden" name="action" value="regist_region">

	<label for="num">사용자 ID: </label>
	<input type="text" id="num" name="num" class="form-control" value="${userinfo.id}" readonly><br>

	<label for="num">도시 입력: </label>
	<input type="text" id="num" name="num" value="서울특별시" class="form-control"><br>
	
	<label for="title">구(군) 입력: </label>
	<input type="text" id="title" name="title" value="종로구" class="form-control"><br>
	
	<label for="writer">동 입력: </label>
	<input type="text"id="writer" name="writer" value="청운동" class="form-control"><br>
	
	<input type="submit" value="저장" >
	<input type="reset" value="취소" >
	</fieldset>
	</div>
</form>

</div>
</div>

</body>
</html>