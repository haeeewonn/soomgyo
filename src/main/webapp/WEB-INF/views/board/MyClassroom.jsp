<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../layout/link.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="principal" />
<link rel="stylesheet" href="/css/MyClassroom.css">
<link rel="stylesheet" href="/css/swiper.css">
<%@ include file="../layout/header.jsp"%>

<div id="myclassContainer">
	<div class="video_font">
		<h2>내 강의실</h2>
	</div>
	
	<div class="video_list">	
		<c:forEach var="myvideo" items="${myclass.content}" varStatus="status">						
			<div class="first_video_box">
				<a href="/video/${myvideo.youtube.id}">
				<input type="hidden" class="${status.index}" value="${myvideo.youtube.id}"> 				
					<div class="video_thumbnail">
						<img src="${myvideo.youtube.thumbnail}">
					</div>
					<div class="video_title">
						<p>${myvideo.youtube.title}</p>
					</div>
						
				</a>
				<div class="heartimg">
					<c:if test="${!(myvideo.likes == null)}">
						<input type="hidden" id="f${status.index}" value="true">
						<img alt="heart" src="img/1.png" class="javascript"
							onclick="like(this.id)" id="${status.index}">
					</c:if>
			</div>
			</div>
			</c:forEach>
      </div>
 		
</div>
	

<%@ include file="../layout/footer.jsp"%>
<script type="text/javascript" src="/JS/utube.js"></script>
