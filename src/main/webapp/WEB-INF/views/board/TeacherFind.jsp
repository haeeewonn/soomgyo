<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp"%>
<link rel="stylesheet" href="/css/Teacherfind.css">
<link rel="stylesheet" href="/css/swiper.css">
<!-- Link Swiper's CSS -->

<%@ include file="../layout/header.jsp"%>
<div id="T_find_main_container">
	<div class="pc_slide_big_box">
		<div class="pri_T_bold_font">
			<h2>프리미엄 강사</h2>
		</div>
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<c:forEach var="T" items="${teacher.content}">
					<c:if test="${T.premium eq 2}">

						<div class="swiper-slide">
							<div class="primium_T_img">
								<a href="/auth/FindTeacher/${T.id}"> <img
									src="/auth/Timages?filename=${T.filename}">
								</a>
							</div>
							<div class="primium_t_title">
								<pre>${T.title}</pre>
							</div>
							<div class="primium_t_content">
								<pre>${T.introduce}</pre>
							</div>
						</div>

					</c:if>
				</c:forEach>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 3,
			spaceBetween : 30,
			slidesPerGroup : 3,
			loop : true,
			loopFillGroupWithBlank : true,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>


	<div class="mobile_slide_big_box">
		<div class="pri_T_bold_font">
			<h2>프리미엄 강사</h2>
		</div>
		<div class="swiper mySwiper2">
			<div class="swiper-wrapper">
				<c:forEach var="T" items="${teacher.content}">
					<c:if test="${T.premium eq 2}">

						<div class="swiper-slide">
							<div class="primium_T_img">
								<a href="/auth/FindTeacher/${T.id}"> <img
									src="/auth/Timages?filename=${T.filename}">
								</a>
							</div>
							<div class="primium_t_title">
								<pre>${T.title}</pre>
							</div>
							<div class="primium_t_content">
								<pre>${T.introduce}</pre>
							</div>
						</div>

					</c:if>
				</c:forEach>
			</div>
			<div class="swiper-pagination"></div>
		</div>

		<!-- Swiper JS -->
		<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper(".mySwiper2", {
				slidesPerView : 2,
				spaceBetween : 10,
				slidesPerGroup : 2,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
			});
		</script>
	</div>

	<!--일반 강사찾기-->
	<div class="normal_big_box">
		<div class="find_teacher_big_font">
			<h2>강사 찾기</h2>
		</div>

		<div class="T_list">
			<c:forEach var="T" items="${teacher.content}">
				<a href="/auth/FindTeacher/${T.id}">
					<div class="first_T_box">
						<div class="normal_Teacher_img">
							<img src="/auth/Timages?filename=${T.filename}">
						</div>
						<div class="normal_Teacher_contentbox">
							<div id="normal_title">
								<p>
								<pre>${T.title}</pre>
								</p>
							</div>
							<div id="normal_contents">
								<p>
								<pre>${T.introduce}</pre>
								</p>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</div>
</div>
<%@ include file="../layout/footer.jsp"%>