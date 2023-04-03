<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp"%>
<link rel="stylesheet" href="/css/TeacherFindDetail.css">
<%@ include file="../layout/header.jsp"%>
<div id="T_find_detail_container">
	<div class="T_main_box">
		<!--강사 메인 사진-->
		<div class="first_row_box">
			<div class="T_profile_img">
				<img src="/auth/Timages?filename=${teacher.filename}"
					onclick="window.open(this.src)">
			</div>
			<div class="T_profile_text">
				<p>${teacher.users.name}</p>
				<p>과목 : ${teacher.users.category}</p>
				<p>지역 : ${teacher.users.adr1}</p>
				<input type="hidden" value="${teacher.users.id}" id="teacherId">
				<input type="hidden" value="${principal.user.id}" id="studentId">
				<input type="hidden" value="${principal.user.roles}" id="loginRole">

			</div>
		</div>

	</div>
	<div id="T_info_box">
		<div class="T_info_first_box">
			<div class="teacher_info_font">
				<h3>강사 정보</h3>
			</div>
			<div class="teacher_infomation_text">
				<p>
				<pre>${teacher.introduce}</pre>
				</p>
			</div>
		</div>
		<div class="T_info_second_box">
			<div class="survice_detail_font">
				<h3>수업 정보</h3>
			</div>
			<div class="survice_detail_text">
				<p>
				<pre>${teacher.lessoninfo}</pre>
				</p>
			</div>
		</div>
	</div>
	<div id="counsel_box">
		<div class="count_content">
			<div class="employee_font">
				<P>고용 : 13건</P>
			</div>
		</div>
		<div class="consel_btn_box">
			<button onclick="counsel()">상담하기</button>
		</div>
	</div>
</div>
<script type="text/javascript" src="/JS/mypage.js"></script>

<%@ include file="../layout/footer.jsp"%>