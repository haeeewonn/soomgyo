<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="link.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<link rel="stylesheet" href="/css/header.css">
</head>
<body>
	<div id="main_container">
		<div id="header_wrap">
			<div id="top">
				<div class="logo2">
					<a href="/"><h1>SoomGyo</h1></a>
				</div>
				<div class="search">
					<form class="search_form">
						<input type="text" name="search"> <i
							class="fa-solid fa-magnifying-glass"></i>
					</form>
				</div>
				<div class="sub_package">
					<c:choose>
						<c:when test="${empty principal}">
							<ul>
								<li><a href="/auth/login">로그인</a></li>
								<li><a href="/auth/join">회원가입</a></li>
							</ul>
						</c:when>
						<c:when test="${principal.user.roles == 'ADMIN'}">
						<ul>
							<li><a href="/logout">로그아웃</a></li>
							<li><a href="/admin">관리페이지</a></li>
						</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<li><a href="/logout">로그아웃</a></li>
								<li><a href="/mypage">마이 페이지</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mobile_tap">
					<input type="checkbox" id="menuicon"> <label for="menuicon">
						<span></span> <span></span> <span></span>
					</label>
					<div class="sidebar">
						<div class="mobile_search">
							<form class="search_form">
								<input type="text" name="search"> <i
									class="fa-solid fa-magnifying-glass"></i>
							</form>
						</div>
						<div class="mobile_login">
							<c:choose>
								<c:when test="${empty principal}">
									<ul>
										<li><a href="/auth/login">로그인</a></li>
										<li><a href="/auth/join">회원가입</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul>
										<li><a href="/logout">로그아웃</a></li>
										<li><a href="/mypage">마이 페이지</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="mobile_menu">
							<ul>
								<li><a href="/videoCategory">관련 동영상</a></li>
								<li><a href="#">내 강의실</a></li>
								<li><a href="/auth/FindTeacher">강사찾기</a></li>
								<li><a href="/auth/community">커뮤니티</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="middle">
				<div class="logo">
					<a href="/"><h1>SoomGyo</h1></a>
				</div>
				<div class="middle_box middle_box1">
					<a href="/videoCategory">관련 동영상</a>
				</div>
				<div class="middle_box middle_box2">
					<a href="/MyClassroom">내 강의실</a>
				</div>
				<div class="middle_box middle_box3">
					<a href="/auth/FindTeacher">강사찾기</a>
				</div>
				<div class="middle_box middle_box4">
					<a href="/auth/community">커뮤니티</a>
				</div>
			</div>
		</div>
	</div>