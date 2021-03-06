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
							data-toggle="dropdown"> ????????? ??? </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${root}/house/list">?????? ??????</a> <a
									class="dropdown-item" href="${root}/notice/list">??????
									??????</a>
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
							data-toggle="modal">${userinfo.name} ??? ???????????????.</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#info-modal">?????? ?????? </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${root}/logout"> Logout </a></li>
						<li class="nav-item"><a class="nav-link" href="${root }/resources/board.html">QnA</a></li>	
						<li class="nav-item"><a class="nav-link" href="${root }/region/list">?????? ??????</a></li>
						<!-- Dropdown -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> ????????? ??? </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${root}/house/list">?????? ??????</a> <a
									class="dropdown-item" href="${root}/notice/list">??????
									??????</a>
							</div></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</nav>

<!-- ????????? Modal(???????????? ??????) -->
<div class="modal" id="login-modal">
	<form action="${root}/login" method="post">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">?????????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label for="id">?????????:</label> <input class="form-control"
							type="text" name="id" value="ssafy" placeholder="????????? ??????"
							id="login-id">
					</div>
					<div class="form-group">
						<label for="pwd">????????????:</label> <input type="password"
							class="form-control" type="password" name="pass" value="1234"
							placeholder="???????????? ??????" id="login-pw">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="?????????">
				</div>

			</div>
		</div>
	</form>
</div>

<!-- ???????????? Modal(???????????? ??????) -->
<div class="modal" id="sign-up-modal">
	<form action="${root}/join" method="post">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">????????????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label for="id">?????????:</label> <input type="text"
							class="form-control" placeholder="ID" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pass">????????????:</label> <input type="text"
							class="form-control" placeholder="Password" id="pass" name="pass">
					</div>
					<div class="form-group">
						<label for="name">??????:</label> <input type="text"
							class="form-control" placeholder="User Name" id="name"
							name="name">
					</div>
					<div class="form-group">
						<label for="adrr">?????????:</label> <input type="text"
							class="form-control" placeholder="E-mail address" id="email"
							name="addr">
					</div>
					<div class="form-group">
						<label for="phone">????????????:</label> <input type="text"
							class="form-control" placeholder="Phone Number" id="phone"
							name="phone">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="????????????">
				</div>

			</div>
		</div>
	</form>
</div>

<!-- ???????????? Modal(????????? ??????) -->
<div class="modal" id="info-modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">????????????</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>?????????</th>
								<th>????????????</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>?????????</td>
								<td>${userinfo.id}</td>
							</tr>
							<tr>
								<td>????????????</td>
								<td>${userinfo.pass}</td>
							</tr>
							<tr>
								<td>??????</td>
								<td>${userinfo.name}</td>
							</tr>
							<tr>
								<td>????????????</td>
								<td>${userinfo.addr}</td>
							</tr>
							<tr>
								<td>????????????</td>
								<td>${userinfo.phone}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button id="confirmBtn" type="button" class="btn btn-primary"
					data-dismiss="modal">??????</button>
				<button id="modifyBtn" type="button" class="btn btn-info"
					data-dismiss="modal" data-toggle="modal"
					data-target="#modify-modal">??????</button>
				<button id="removeBtn" type="button" class="btn btn-danger"
					data-dismiss="modal" data-toggle="modal"
					data-target="#remove-modal">??????</button>
			</div>

		</div>
	</div>
</div>

<!-- ?????????????????? Modal(????????? ??????) -->
<div class="modal" id="modify-modal">
	<form action="${root}/modify" method="post">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">??????????????????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>?????????</th>
									<th>????????????</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>?????????</td>
									<td><input type="text" id="id" name="id"
										value="${userinfo.id}" readonly></td>
								</tr>
								<tr>
									<td>????????????</td>
									<td><input type="text" id="pass" name="pass"
										value="${userinfo.pass}"></td>
								</tr>
								<tr>
									<td>??????</td>
									<td><input type="text" id="name" name="name"
										value="${userinfo.name}"></td>
								</tr>
								<tr>
									<td>????????????</td>
									<td><input type="text" id="addr" name="addr"
										value="${userinfo.addr}"></td>
								</tr>
								<tr>
									<td>????????????</td>
									<td><input type="text" id="phone" name="phone"
										value="${userinfo.phone}"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" value="????????????">
				</div>

			</div>
		</div>
	</form>
</div>

<!-- ???????????? Modal(????????? ??????) -->
<div class="modal" id="remove-modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">????????????</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">????????? ?????????????????????????</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<a href="${root}/delete?id=${userinfo.id}">????????????</a>
			</div>

		</div>
	</div>
</div>

<script>
	let msg = "${msg}";
	if (msg)
		alert(msg);
</script>