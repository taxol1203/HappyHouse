<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
<script src="//code.jquery.com/jquery-3.3.1.js"></script>

<%-- <form action="${root }/house/list" method="get"> --%>
	<div class="input-group" style="margin: 1em;">
		<!-- <input type="hidden" name="action" value="list"> -->
		<!-- 드래그드롭리스트 -->
			<%-- <select name="searchField">
				<option value="LIST">전체</option>
				<option value="NAME"
					<c:if test="${searchField=='NAME' }">selected</c:if>>
					건물명</option>
				<option value="DONG"
					<c:if test="${searchField=='DONG' }">selected</c:if>>
					동명</option>
				<option value="PRICE"
					<c:if test="${searchField=='PRICE' }">selected</c:if>>
					가격</option>
			</select> --%>
	  	<input type="search" id="searchVal" class="form-control rounded" placeholder="입력해주세요" aria-label="Search"
	    	aria-describedby="search-addon"/>
	  	<button type="button" class="btn btn-outline-primary" onclick="search_apt()">검색</button>
  	</div>
<!-- </form> -->

<script>
	function search_apt(){
		var keyword = $('#searchVal').val();
		console.log(keyword);
		$.ajax({
			url : "${root}/house/aptSearch/" + keyword,
			type : "get",
			success : function(data) {
				$("#list-tab").empty();
				$.each(data, function(idx, apt){
					$("#list-tab").append(
						`<div class="list-group-item list-group-item-action" data-toggle="list" role="tab" data-bs-toggle="modal" href="#selectApt" onclick="getAptDist('\${apt.aptName}'); getAptData('\${apt.aptName}');"">
							<p class="title">
								<span>\${apt.aptName}</span>
								<!-- <span> | 총 \${apt.count}개의 거래 내역</span> -->
							</p>
							<p class="info">
								<span>\${apt.buildYear}년 | </span>
								<span>\${apt.dong} </span>
								<span>\${apt.jibun}</span>
							</p>
						</div>
						`
					);
				});
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}

</script>



