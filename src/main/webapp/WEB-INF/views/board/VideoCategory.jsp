<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../layout/link.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="principal" />

<link rel="stylesheet" href="/css/VideoCategory.css">
<link rel="stylesheet" href="/css/swiper.css">
<style>
.youtube {
	height: 200px;
}

.youtube img {
	width: 100%;
}

.youbube-title {
	width: 300px;
	height: 55px;
	margin-top: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.swiper {
	height: 50%;
}

.swiper-wrapper {
	height:;
}

.swiper-pagination {
	
}

#T_find_main_container {
	margin-top: 100px;
}

.pc_slide_big_box {
	height: 100%;
	margin-bottom: 50px;
}

.heartimg {
	width: 30px;
	height: 30px;
	position: absolute;
	bottom: 40px;
	right: 46%;
	cursor: pointer;
	position: absolute;
}

.youbube-title {
	height: 100px;
	position: relative;
}
</style>
<%@ include file="../layout/header.jsp"%>
<div id="T_find_main_container">

	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'JAVA'}">
			<div class="pc_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>자바</h2>
					<br> <br>
					<hr>
				</div>

				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'JAVA'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>

									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'JavaScript'}">
			<div class="pc_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>자바스크립트</h2>
					<br> <br>
					<hr>

				</div>
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">

						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'JavaScript'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>

				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'C'}">
			<div class="pc_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>C언어</h2>
					<br> <br>
					<hr>
				</div>

				<div class="swiper mySwiper">
					<div class="swiper-wrapper">

						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'Cc'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'Python'}">
			<div class="pc_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>파이썬</h2>
					<br> <br>
					<hr>
				</div>
				<div class="pc_slide_big_box">
					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<c:forEach var="youtube" items="${youtube}" varStatus="status">
								<c:if test="${youtube.category eq 'Python'}">
									<div class="swiper-slide">
										<div class="video-box">
											<input type="hidden" class="${status.index}"
												value="${youtube.id}"> <a
												href="/video/${youtube.id}">
												<div class="youtube">
													<img src="${youtube.thumbnail}">
												</div>
											</a>
											<div class="youbube-title">${youtube.title}</div>
											<div class="heartimg">
												<c:if test="${youtube.likes == null}">
													<input type="hidden" id="f${status.index}" value="false">
													<img alt="heart" src="img/0.png" class="javascript"
														onclick="like(this.id)" id="${status.index}">
												</c:if>
												<c:if test="${!(youtube.likes == null)}">
													<input type="hidden" id="f${status.index}" value="true">
													<img alt="heart" src="img/1.png" class="javascript"
														onclick="like(this.id)" id="${status.index}">
												</c:if>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'Oracle'}">
			<div class="pc_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>오라클</h2>
					<br> <br>
					<hr>
				</div>
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'Oracle'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>



	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 3,
			spaceBetween : 20,
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
</div>

	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'JAVA'}">
			<div class="mobile_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>자바</h2>
					<br> <br>
					<hr>
				</div>

				<div class="swiper mySwiper2">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'JAVA'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>

									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'JavaScript'}">
			<div class="mobile_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>자바스크립트</h2>
					<br> <br>
					<hr>

				</div>
				<div class="swiper mySwiper2">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'JavaScript'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>

				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'C'}">
			<div class="mobile_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>C언어</h2>
					<br> <br>
					<hr>
				</div>
				<div class="swiper mySwiper2">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'Cc'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'Python'}">
			<div class="mobile_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>파이썬</h2>
					<br> <br>
					<hr>
				</div>
				<div class="swiper mySwiper2">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'Python'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<c:forEach var="category" items="${fn:split(category, ',')}">
		<c:if test="${category == 'Oracle'}">
			<div class="mobile_slide_big_box">
				<div class="pri_T_bold_font">
					<h2>오라클</h2>
					<br> <br>
					<hr>
				</div>
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<c:forEach var="youtube" items="${youtube}" varStatus="status">
							<c:if test="${youtube.category eq 'Oracle'}">
								<div class="swiper-slide">
									<div class="video-box">
										<input type="hidden" class="${status.index}"
											value="${youtube.id}"> <a href="/video/${youtube.id}">
											<div class="youtube">
												<img src="${youtube.thumbnail}">
											</div>
										</a>
										<div class="youbube-title">${youtube.title}</div>
										<div class="heartimg">
											<c:if test="${youtube.likes == null}">
												<input type="hidden" id="f${status.index}" value="false">
												<img alt="heart" src="img/0.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
											<c:if test="${!(youtube.likes == null)}">
												<input type="hidden" id="f${status.index}" value="true">
												<img alt="heart" src="img/1.png" class="javascript"
													onclick="like(this.id)" id="${status.index}">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</c:if>
	</c:forEach>

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper2", {
			slidesPerView : 1,
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


<%@ include file="../layout/footer.jsp"%>
<script type="text/javascript" src="/JS/utube.js"></script>


