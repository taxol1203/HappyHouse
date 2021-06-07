<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />

<%@ include file="/WEB-INF/views/in_right/header.jsp"%>

<style>
.area_select {
    position: relative;
    height: 51px;
    line-height: 51px;
    background: #f0f1ff;
    overflow: hidden;
    margin-top: 1em;
    margin-left: 1em; 
    margin-bottom: 1em; 
}
</style>

<div class= "area_select" >
	hello friend
</div>

<div class="list-group" id="list-tab" role="tablist" style="margin-left: 1em">
	<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Home</a>
	<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
	<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>
	<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
</div>

<script type="text/javascript">
	
</script>

