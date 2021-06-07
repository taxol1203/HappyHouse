<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건물등록</title>
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
<form action="main_list" method="post">
<div class="form-group">
	<fieldset>
	<legend></legend>
	<h1>수정할 내용을 입력해주세요.</h1>
	<!-- hidden타입으로 화면에 표시하지 않고 regist 값으로 전달 -->
	<input type="hidden" name="action" value="update">

	<label for="dong">동: </label>
	<input type="text" id="dong" name="dong"  class="form-control" value="${house.dong}"><br>
	
	<label for="name">건물명: </label>
	<input type="text" id="name" name="name"  class="form-control" value="${house.name}"><br>
	
	<label for="code">코드: </label>
	<input type="text"id="code" name="code" class="form-control" value="${house.code}"><br>
	
	<label for="price">가격: </label>
	<input type="text"id="price" name="price"  class="form-control" value="${house.price}"><br>
	
	<label for="year">건설년도: </label>
	<input type="text"id="year" name="year" class="form-control" value="${house.year}"><br>
	
	<label for="area">면적: </label>
	<input type="text"id="area" name="area"  class="form-control" value="${house.area}"><br>
	
	<label for="jibun">지번: </label>
	<input type="text"id="jibun" name="jibun"  class="form-control" value="${house.jibun}"><br>
	
	<label for="floor">층수: </label>
	<input type="text"id="floor" name="floor"  class="form-control" value="${house.floor}"><br>
	
	<input type="submit" value="저장" >
	<input type="reset" value="취소" >
	</fieldset>
	</div>
</form>

</div>
</div>

</body>
</html>