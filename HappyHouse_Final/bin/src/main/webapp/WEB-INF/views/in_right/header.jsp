<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />

<div class="input-group" style="margin: 1em;">
  <input type="search" class="form-control rounded" placeholder="원하는 아파트, 원룸을 검색해 주세요" aria-label="Search"
    aria-describedby="search-addon"/>
  <button type="button" class="btn btn-outline-primary">검색</button>
</div>

