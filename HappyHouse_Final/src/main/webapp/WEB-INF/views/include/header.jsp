<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="${root}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${root}/resources/css/business-frontpage.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
	max-width: auto;
	max-height: 600px;
	overflow: hidden;
}
</style>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${root}/" onclick="javascript:gohome();">HAPPY
			HOUSE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="user-info">
			<div class="collapse navbar-collapse status-logout"
				id="navbarResponsive">
				<c:if test="${empty userinfo}">
					<ul class="navbar-nav ml-auto" id="header_nav_confirm_off">
						<li class="nav-item active"><a class="nav-link"
							href="${root }/">Home <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#login-modal">Login</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#sign-up-modal">SignUp</a></li>

						<!-- Dropdown -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> 사이트 맵 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${root}/resources/board.html">QnA</a> <a
									class="dropdown-item" href="${root}/notice/list">공지
									목록</a>
							</div></li>

					</ul>
				</c:if>
				<c:if test="${!empty userinfo}">
					<ul class="navbar-nav ml-auto" id="header_nav_confirm_on">
						<li class="nav-item active"><a class="nav-link"
							href="${root }/">Home <span class="sr-only"> (current)
							</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal">${userinfo.name} 님 반갑습니다.</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#info-modal">회원 정보 </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${root}/logout"> Logout </a></li>
						<!-- Dropdown -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> 사이트 맵 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${root}/resources/board.html">QnA</a> 
								<a class="dropdown-item" href="${root}/notice/list">공지 목록</a>
							</div>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</nav>

<!-- 로그인 Modal(로그아웃 상태) -->
<div class="modal" id="login-modal">
	<form action="${root}/login" method="post">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label for="id">아이디:</label> <input class="form-control"
							type="text" name="id" value="ssafy" placeholder="아이디 입력"
							id="login-id">
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호:</label> <input type="password"
							class="form-control" type="password" name="pass" value="1234"
							placeholder="비밀번호 입력" id="login-pw">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="로그인">
				</div>

			</div>
		</div>
	</form>
</div>

<!-- 회원가입 Modal(로그아웃 상태) -->
<div class="modal" id="sign-up-modal">
	<form action="${root}/join" method="post">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원가입</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label for="id">아이디:</label> <input type="text"
							class="form-control" placeholder="ID" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pass">비밀번호:</label> <input type="password"
							class="form-control" placeholder="Password" id="pass" name="pass">
					</div>
					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" placeholder="User Name" id="name"
							name="name">
					</div>
					<div class="form-group">
						<label for="adrr">이메일:</label> <input type="email"
							class="form-control" placeholder="E-mail address" id="email"
							name="addr">
					</div>
					<div class="form-group">
						<label for="phone">전화번호:</label> <input type="text"
							class="form-control" placeholder="Phone Number" id="phone"
							name="phone">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="가입하기">
				</div>

			</div>
		</div>
	</form>
</div>

<!-- 회원정보 Modal(로그인 상태) -->
<div class="modal" id="info-modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container">
					<table class="table table-bordered">
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
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button id="confirmBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">확인</button>
				<button id="modifyBtn" type="button" class="btn btn-info"
					data-dismiss="modal" data-toggle="modal"
					data-target="#modify-modal">수정</button>
				<button id="removeBtn" type="button" class="btn btn-danger"
					data-dismiss="modal" data-toggle="modal"
					data-target="#remove-modal">삭제</button>
			</div>

		</div>
	</div>
</div>

<!-- 회원정보수정 Modal(로그인 상태) -->
<div class="modal" id="modify-modal">
	<form action="${root}/modify" method="post">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원정보수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>정보명</th>
									<th>회원정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type="text" id="id" name="id"
										value="${userinfo.id}" readonly></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="text" id="pass" name="pass"
										value="${userinfo.pass}"></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" id="name" name="name"
										value="${userinfo.name}"></td>
								</tr>
								<tr>
									<td>메일주소</td>
									<td><input type="text" id="addr" name="addr"
										value="${userinfo.addr}"></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" id="phone" name="phone"
										value="${userinfo.phone}"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="수정완료">
				</div>

			</div>
		</div>
	</form>
</div>

<!-- 회원탈퇴 Modal(로그인 상태) -->
<div class="modal" id="remove-modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원탈퇴</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">정말로 탈퇴하시겠습니까?</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<a href="${root}/delete?id=${userinfo.id}">회원탈퇴</a>
			</div>

		</div>
	</div>
</div>

<script>
	let msg = "${msg}";
	if (msg)
		alert(msg);
</script>