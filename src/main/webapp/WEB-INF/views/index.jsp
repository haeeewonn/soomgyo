<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="layout/link.jsp"%>
<link rel="stylesheet" href="/css/index.css">
<%@ include file="layout/header.jsp"%>

<div id="banner_image_cotainer">
	<div class="banner_img">
		<img src="/img/찐한 보라색 ad.jpg">
	</div>
</div>
<div id="container">
	<div id="related_video">
		<!--관련동영상 큰 박스-->
		<div class="related_video-font">
			<!--"관련동영상"이라고 써있는 글씨 박스-->
			<a href="#"><h3>관련 동영상</h3></a>
		</div>
		<div class="related_video_big-box">
			<c:forEach var="youtube" items="${youtube}">
				<!--동영상이 들어갈 부분 큰 박스-->
				<div class="video-box">
					<a href="/youtube/${youtube.id}">
						<div class="youtube">
							<img src="${youtube.thumbnail}">
						</div>
						<div class="youbube-title">${youtube.title}</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div id="container2">
	<div id="ad">
		<img src="/img/강사찾기.jpg">
	</div>
</div>
<div id="container3">
	<div id="find_teacher">
		<!--강사찾기 큰 박스-->
		<div class="find_teacher-font">
			<!--"강사찾기"라고 써있는 글씨 박스-->
			<h3>강사 찾기</h3>
		</div>
		<div class="find_teacher_bog-box">

			<c:forEach var="teacher" items="${teacher.content}">
				<a href="/auth/FindTeacher/${teacher.id}">
					<div class="teacher-box">
						<div class="teacher">
							<img src="/auth/Timages?filename=${teacher.filename}">
						</div>
						<div class="teacher-title">
							<p>${teacher.title}</p>
						</div>
					</div>
				</a>
			</c:forEach>

		</div>
	</div>
	<div id="final">
		<!--커뮤니티 공지사항 큰 박스-->
		<div class="community-box">
			<!--커뮤니티 박스-->
			<div class="community-font-box">
				<div class="community-font">
					<h3>커뮤니티</h3>
				</div>
				<div class="see-more">
					<a href="#"><i class="fa-solid fa-plus"></i></a>
				</div>
			</div>
			<div class="board-box">
				<c:forEach var="community" items="${community1.content}">
					<a href="auth/community/${community.id}">
						<div class="board-detail-box">
							<div class="category">
								<p>${community.category}</p>
							</div>
							<div class="content-box">
								<div class="title">
									<p>${community.title}</p>
									<br>
									<p>
										<fmt:formatDate pattern="MM/dd HH:mm"
											value="${community.createDate}" />
									</p>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="notice-box">
			<!--공지사항 박스-->
			<div class="notice-font-box">
				<div class="notice-font">
					<h3>공지사항</h3>
				</div>
				<div class="see-more">
					<a href="#"><i class="fa-solid fa-plus"></i></a>
				</div>
			</div>
			<div class="board-box">
				<c:forEach var="community" items="${community2.content}">
					<a href="auth/community/${community.id}">
						<div class="board-detail-box">
							<div class="order">
								<p>sdasdasd</p>
							</div>
							<div class="content-box">
								<div class="title">
									<p>${community.title}</p>
									<br>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/JS/test.js"></script>
<%@ include file="layout/footer.jsp"%>