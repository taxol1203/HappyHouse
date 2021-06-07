<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAPPY HOUSE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- bootstrap을 위한 js & css 등록 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		html,
		body {
	        width: 100%;
	        height: 100%;
	     }
		.row{
			width: 100%;
        	height: 100%;
		}
	</style>
</head>
<body>
<!-- 만든 헤더 적용 -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%-- <%@ include file="/WEB-INF/views/include/image.jsp"%>
<%@ include file="/WEB-INF/views/include/map.jsp"%> --%>
	<div class='row'>
	  	<div class='col-sm-9'>
	  		<%@ include file="/WEB-INF/views/include/map.jsp"%>
	  	</div>
	  	<div class='col-sm-3' style="border-left : 1px solid #eee;">
	  		<%@ include file="/WEB-INF/views/in_right/right.jsp"%>
	  	</div>
	</div>
	
	<!-- 공지 -->
	<div class="list-group list-group-horizontal">
	<!-- 상품  -->
	<a href="${root}/house/list" class="list-group-item">건물 목록</a>
	<!-- 공지사항 -->
	<a href="${root}/notice/list" class="list-group-item">공지사항</a>
	<!-- 환경정보  -->
	<a href="${root}/enviro/list" class="list-group-item">환경정보</a>
	</div>
</body>
</html>