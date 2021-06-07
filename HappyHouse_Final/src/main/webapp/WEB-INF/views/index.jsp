<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAPPY HOUSE</title>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- bootstrap을 위한 js & css 등록 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- 템플릿 적용 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${root}/resources/assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${root}/resources/css/styles.css" rel="stylesheet" />
    
    <!-- 로그인 모달창 -->
    <script src="${root}/resources/js/jquery.min.js"></script>
    <script src="${root}/resources/js/popper.js"></script>
    <script src="${root}/resources/js/bootstrap.min.js"></script>
    <script src="${root}/resources/js/main.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="${root}/resources/css/ionicons.min.css">
	<link rel="stylesheet" href="${root}/resources/css/style.css">
    
    <!-- 공짓 -->
    
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
		.col-sm-9{
			height : 700px;
		}
		.col-sm-3{
			height : 700px;
			overflow: auto;
		}
		#about{
			width: 100%;
			height : 1000px;
		}
		.svg-inline--fa.fa-stack-2x {
            height: 1em;
            width: 1em;
        }
		.center_modal {
		  position: absolute;
		  left: 20%;
		  
		}
		
		
		
	</style>
</head>

	<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="${root}/">Happy House</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                	<c:if test="${empty userinfo}">
	                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
	                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#about">Search</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#portfolio">Additional</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#contact">LOGIN</a></li>
	                    </ul>
                    </c:if>
                    <c:if test="${!empty userinfo}">
                    	<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
	                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#about">Search</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#portfolio">Additional</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
	                        <li class="nav-item" style="border: 1px solid white; width: 0.1px; height: 40px"></li>
	                        <li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#info-modal">${userinfo.name}님 환영합니다.</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${root}/logout">LOGOUT</a></li>
	                    </ul>
                    </c:if>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
            	<div style="background-color: rgba( 180, 180, 180, 0.5 );border-radius: 2em; border-top-left-radius: 2em;
						border-top-right-radius: 2em; border-bottom-left-radius: 2em; border-bottom-right-radius: 2em;">
	                <div class="masthead-subheading">Welcome To Happy House!</div>
	                <div class="masthead-heading text-uppercase">안락한 집을 쉽고 편하게 구해보세요</div>
                </div>
                <c:if test="${empty userinfo}">
                	<a class="btn btn-success btn-xl text-uppercase" href="#contact">시작하기</a>
            	</c:if>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">HAPPY HOUSE는 다음과 같은 서비스를 제공하고 있습니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-map-marked-alt fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">지도 API</h4>
                        <!-- <p class="text-muted">카카오 지도 API를 활용하여 사용자가 원하는 동네의 집 매물 현황을 지도에 마커로 나타낸다. 클러스터링 처리 및 지하철역의 중심으로부터 가까운 반경을 원으로 표시해주고 원하는 집을 검색하면 가까운 지하철역과 학교를 지도에 표시한다.</p> -->
                        <p class="text-muted">지도를 사용하여 원하는 지역의 <br>아파트 매물을 확인하세요</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-chart-bar fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">최근 거래가 차트</h4>
                        <p class="text-muted">고객이 찾고자 하는 건물의 <br>상세정보 및 최근 거래 내역 차트를 제공합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-home fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">관심 주택 사용</h4>
                        <p class="text-muted">고객이 등록한 관심지역으로 <br>간편하게 매물을 확인하세요</p>
                    </div>
                </div>
            </div>
        </section>
        <c:if test="${!empty userinfo}">
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">SEARCH</h2>
                    <h3 class="section-subheading text-muted">나에게 알맞는 집을 지도에서 찾아보세요.</h3>
                </div>
                <div class='row'>
					<div class='col-sm-9'>
						<!-- <div style="border-bottom : 2px solid #eee; height: 50px; background: #eee"></div> -->
						<%@ include file="/WEB-INF/views/include/map.jsp"%>
					</div>
					<div class='col-sm-3' style="border-left : 1px solid #eee;  padding-left: 0px; padding-right: 0px;">
						<%@ include file="/WEB-INF/views/in_right/right.jsp"%>
				  	</div>
				</div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">ADDITIONAL</h2>
                    <h3 class="section-subheading text-muted">저희 웹 사이트에서 제공하는 추가 기능들 입니다.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                    <!-- 모달을 호출하는 곳 -->
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${root}/resources/assets/img/portfolio/qna.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Q & A</div>
                                <div class="portfolio-caption-subheading text-muted">서비스에 질문이 있으면 알려주세요.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2" onclick="getNotice()">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${root}/resources/assets/img/portfolio/notice.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Notice</div>
                                <div class="portfolio-caption-subheading text-muted">알려드립니다!</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3" onclick="getInterest()">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="${root}/resources/assets/img/portfolio/interest-building.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Building of interest</div>
                                <div class="portfolio-caption-subheading text-muted">나의 관심주택을 확인해보세요.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">사이트 제작에 도움주신 분들</h3>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${root}/resources/assets/img/team/팀장_김선홍.jpg" alt="..." />
                            <h4>김선홍</h4>
                            <p class="text-muted">팀장</p>
                            <a class="btn btn-dark btn-social mx-2" href="https://github.com"><i class="fab fa-github"></i></a>
                        	<a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
                        	<a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${root}/resources/assets/img/team/팀원_한주연.jpg" alt="..." />
                            <h4>한주연</h4>
                            <p class="text-muted">팀원</p>
                            <a class="btn btn-dark btn-social mx-2" href="https://github.com"><i class="fab fa-github"></i></a>
                        	<a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
                        	<a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">사이트 이용 중 불편한 점은 언제든지 Q&ampA 게시판이나 저희 팀에게 문의 주시면 됩니다^^</p>
                    <p class="large text-muted">항상 최선을 다하겠습니다. 감사합니다!</p></div>
                </div>
            </div>
        </section>
        </c:if>
        <!-- Clients-->
        <div class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="https://www.ssafy.com"><img class="img-fluid img-brand d-block mx-auto" src="${root}/resources/assets/img/logos/ssafy_logo.png" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="https://www.samsung.com"><img class="img-fluid img-brand d-block mx-auto" src="${root}/resources/assets/img/logos/sumsung_logo.jpg" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="https://www.kakaocorp.com"><img class="img-fluid img-brand d-block mx-auto" src="${root}/resources/assets/img/logos/kakao_logo.png" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="https://github.com"><img class="img-fluid img-brand d-block mx-auto" src="${root}/resources/assets/img/logos/github_logo.png" alt="..." /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact(로그인)-->
        <c:if test="${empty userinfo}">
	        <section class="page-section" id="contact">
	            <div class="container">
	                <div class="text-center">
	                    <h2 class="section-heading text-uppercase">Happy House</h2>
	                    <h3 class="section-subheading text-muted">가입하신 아이디와 비밀번호를 입력해주세요.</h3>
	                </div>
	                <form id="contactForm" action="${root}/login" method="post" style="margin-left:400px">
	                	
	                    <div class="row align-items-stretch mb-5 text-center">
	                        <div>
	                            <div class="form-group" >
	                                <input class="form-control" name="id" value="ssafy" type="text" placeholder="Your ID *" required="required"/>
	                                <p class="help-block text-danger"></p>
	                            </div>
	                            <div class="form-group">
	                                <input class="form-control" name="pass" value="1234" type="password" placeholder="Your Password *" required="required" />
	                                <p class="help-block text-danger"></p>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div style="margin-left:70px">
	                        <div id="success"></div>
	                        <button class="btn btn-primary btn-xl text-uppercase" id="sendMessageButton" type="submit">LOGIN</button>
	                        <button type="button" class="btn btn-success btn-xl text-uppercase" data-toggle="modal" data-target="#exampleModalCenter">SIGN UP</button>
	                    </div>
	                </form>
	            </div>
	        </section>
        </c:if>
        
	    <!-- 회원가입 모달 -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close d-flex align-items-center justify-content-center"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true" class="ion-ios-close"></span>
						</button>
					</div>
					<div class="modal-body p-4 py-5 p-md-5">
						<h3 class="text-center mb-3">Create Your Account</h3>
						<ul class="ftco-footer-social p-0 text-center">
							<li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter">
							<span class="ion-logo-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#" data-toggle="tooltip"
								data-placement="top" title="Facebook"><span
									class="ion-logo-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#" data-toggle="tooltip"
								data-placement="top" title="Instagram"><span
									class="ion-logo-instagram"></span></a></li>
						</ul>
						<form action="${root}/join" method="post" class="signup-form">
							<div class="form-group mb-2">
								<label for="name">ID</label> <input type="text"
									class="form-control" placeholder="ID" id="id" name="id">
							</div>
							<div class="form-group mb-2">
								<label for="pass">Password</label> <input type="password"
									class="form-control" placeholder="Password" id="pass" name="pass">
							</div>
							<div class="form-group mb-2">
								<label for="name">Name:</label> <input type="text"
									class="form-control" placeholder="User Name" id="name"
									name="name">
							</div>
							<div class="form-group mb-2">
								<label for="adrr">이메일:</label> <input type="email"
									class="form-control" placeholder="E-mail address" id="email"
									name="addr">
							</div>
							<div class="form-group mb-2">
								<label for="phone">전화번호:</label> <input type="text"
									class="form-control" placeholder="Phone Number" id="phone"
									name="phone">
							</div>
							<div class="form-group mb-2">
								<button type="submit"
									class="form-control btn btn-primary rounded submit px-3">Sign
									Up</button>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-100 text-center">
									<a href="#" class="forgot">I'm already a member</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 회원 정보 보기 모달 -->
		<div class="modal fade" id="info-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close d-flex align-items-center justify-content-center"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true" class="ion-ios-close"></span>
						</button>
					</div>
					<div class="modal-body p-4 py-5 p-md-5">
						<h3 class="text-center mb-3">User Account</h3>
						
						<div class="form-group mb-2">
							<label for="name">ID</label> <input type="text"
								class="form-control" value="${userinfo.id}" id="id" name="id" readonly>
						</div>
						<div class="form-group mb-2">
							<label for="pass">Password</label> <input type="password"
								class="form-control" value="${userinfo.pass}" id="pass" name="pass" readonly>
						</div>
						<div class="form-group mb-2">
							<label for="name">Name:</label> <input type="text"
								class="form-control" value="${userinfo.name}" id="name"
								name="name" readonly>
						</div>
						<div class="form-group mb-2">
							<label for="adrr">이메일:</label> <input type="email"
								class="form-control" value="${userinfo.addr}" id="email"
								name="addr" readonly>
						</div>
						<div class="form-group mb-2">
							<label for="phone">전화번호:</label> <input type="text"
								class="form-control" value="${userinfo.phone}" id="phone"
								name="phone" readonly>
						</div>
						
					</div>
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
		
		<!-- 회원 정보 수정 모달 -->
		<div class="modal fade" id="modify-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close d-flex align-items-center justify-content-center"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true" class="ion-ios-close"></span>
						</button>
					</div>
					<div class="modal-body p-4 py-5 p-md-5">
						<h3 class="text-center mb-3">Update Your Account</h3>
						
						<form action="${root}/modify" method="post" class="signup-form">
							<div class="form-group mb-2">
								<label for="name">ID</label> <input type="text"
									class="form-control" value="${userinfo.id}" id="id" name="id" readonly>
							</div>
							<div class="form-group mb-2">
								<label for="pass">Password</label> <input type="password"
									class="form-control" value="${userinfo.pass}" id="pass" name="pass">
							</div>
							<div class="form-group mb-2">
								<label for="name">Name:</label> <input type="text"
									class="form-control" value="${userinfo.name}" id="name"
									name="name">
							</div>
							<div class="form-group mb-2">
								<label for="adrr">이메일:</label> <input type="email"
									class="form-control" value="${userinfo.addr}" id="email"
									name="addr">
							</div>
							<div class="form-group mb-2">
								<label for="phone">전화번호:</label> <input type="text"
									class="form-control" value="${userinfo.phone}" id="phone"
									name="phone">
							</div>
							<div class="form-group mb-2">
								<button type="submit"
									class="form-control btn btn-primary rounded submit px-3">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 회원탈퇴 Modal(로그인 상태) -->
		<div class="modal fade" id="remove-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body p-4 py-5 p-md-5">
						<h3 class="text-center mb-3">회원탈퇴</h3>
						<h6 class="text-center mb-3">정말로 탈퇴하시겠습니까?</h6>
					</div>
					<div class="modal-footer">
						<a href="${root}/delete?id=${userinfo.id}">회원탈퇴</a>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">
                        Copyright &copy; Taxol, Kim Seonhong
                        <!-- This script automatically adds the current year to your website footer-->
                        <!-- (credit: https://updateyourfooter.com/)-->
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                    </div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="https://github.com"><i class="fab fa-github"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com"><i class="fab fa-instagram"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Portfolio Modals-->
        <!-- Portfolio item 1 modal popup-->
         <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content center_modal" style="height:700px; width:60%">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <div class="modal-body" style="height:600px;">                           
                                   	<%@ include file="/resources/board.html" %>
                                </div>
                                <div class = "modal-footer" >
	                                  <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
	                                     <i class="fas fa-times me-1"></i>
	                                     Close
	                                 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 2 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content center_modal" style="height:600px; width:60%">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="${root}/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body" style="height:500px;">
                                    <%-- <%@ include file="/resources/notice.html" %> --%>
                                    <h3 class="text-uppercase">공지사항</h3>
                                    <%@ include file="/WEB-INF/views/notice_include.jsp"%>
                                    
                                </div>
                                <div class = "modal-footer" >
                                <c:if test="${userinfo.id == 'ssafy'}">
                                	 <button class="btn btn-primary btn-xl text-uppercase"  data-toggle="modal" data-target="#ModalExample">
	                                     <i class="fas fa-times me-1"></i>
	                                     	공지사항 등록
	                                 </button>
	                                </c:if>
                                     <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
	                                     <i class="fas fa-times me-1"></i>
	                                     Close
	                                 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 3 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog"> 
                <div class="modal-content center_modal" style="height:600px; width:60%">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="${root}/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body"  style="height:500px;">
                                    <!-- Project details-->
                                    <h4 class="text-uppercase">관심주택 목록</h4>
                                    <!-- <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p> -->
									
									<table class="table table-hover">
										<thead>
											<tr>											  
								            	<th scope="col">번호</th>
								            	<th scope="col">아파트 이름</th>
										    	<th scope="col">동</th>
										    	<th scope="col">등록일</th>
										    	<th scope="col" style="color: red;">삭제</th>
								            </tr>
										</thead>
										<tbody id="seeInterest_table">
         								</tbody>
									</table>
                                </div>
                                <div class = "modal-footer" >
                                     <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
	                                     <i class="fas fa-times me-1"></i>
	                                     Close
	                                 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root}/resources/js/scripts.js"></script>
        
    </body>
	<script>
		var subwayOb = new Object();
		var subwayName = [];
		var subwayDis = [];
		
		var schoolOb = new Object();
		var schoolName = [];
		var schoolDis = [];
		
	    window.onload = function() {
		}
	    
	    function getInterest(){
	    	$.ajax({
				url : "${root}/house/interest/" + '${userinfo.id}',
				type : "get",
				success : function(data) {
					// 아파트 이름을 통하여 데이터를 가져왔을 때
					$("#seeInterest_table").empty();
					// 표 만들기
					let count = 0;
					$.each(data, function(idx, apt){
						let date = apt.regtime.substring(0,10);
						count = count + 1;
						$("#seeInterest_table").append(`
							<tr onclick="openRow('\${apt.aptName}')">
								<td>\${count}</td>
								<td>\${apt.aptName}</td>
								<td>\${apt.dong}</td>
								<td>\${date}</td>
								<td><span onclick="deleteRow('\${apt.aptName}')">
								<img src="${root}/resources/assets/img/delete_icon.png" style="width: 20px; height: 20px">
								</span></td>
						    </tr>
					    `);
					});
				},
				error : function(xhr,status,msg) {
					alert("요청 실패");
				}
			});
	    }
	    
	    function deleteRow(aptName){
	    	$.ajax({
				url : "${root}/house/interest_del/" + '${userinfo.id}' + "/" + aptName,
				type : "get",
				success : function(data) {
					alert("삭제 성공");
					getInterest();
				},
				error : function(xhr,status,msg) {
					alert("요청 실패");
				}
			});
	    }
	    
	    function openRow(aptName){
	    	getAptDist(aptName);
	    	getAptData(aptName);
	    	$('#selectApt').modal('show');
	    	$('#portfolioModal3').modal("hide");
	    }
	</script>

</html>