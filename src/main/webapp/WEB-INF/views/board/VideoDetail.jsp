<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp"%>
<link rel="stylesheet" href="/css/videodetail.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<form>
		<ul>
			<li>
				<div class="youtube">
					<iframe src="${youtube.videoUrl}"></iframe>
				</div>
			</li>
			<li><span class="title">Memo</span></li>
			<li>
			<textarea name="memo" id="memo"
						style="width: 99%; height: 300px; border-radius: 5px; font-size: 1.3rem;"
						placeholder="메모 하고 싶으면 여기다가~"><c:forEach var="mv" items="${myvideo}"><c:if test="${mv.youtube.id == youtube.id}">${mv.memo}</c:if></c:forEach></textarea> <input type="hidden" id="youtubeid" value="${youtube.id}">
			</li>

		</ul>
	</form>
	<div class="btn">
		<button class="btn_list1">목록으로</button>
		<button class="btn_list" onclick="savememo()">저장하기</button>
	</div>
</div>
<script type="text/javascript" src="/JS/utube.js"></script>
<%@ include file="../layout/footer.jsp"%>