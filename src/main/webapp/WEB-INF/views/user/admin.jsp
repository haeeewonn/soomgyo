<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp"%>
<link rel="stylesheet" href="/css/mypage.css">
 <link rel="stylesheet" href="/css/CommunitySaveForm.css">
<%@ include file="../layout/header.jsp"%>
<div id="container">
	<div class="wrap">
		<div class="tab_menu">
			<ul class="list">
				<li class="is_on"><a href="#tab1" class="btn">공지사항</a></li>
				<li><a href="#tab2" class="btn">프리미엄 강사</a></li>
			</ul>
			<div class="cont_area">
				<div id="tab1" class="cont" style="display: block;">
					<div class="board_box" style="margin:0 auto">
						<form name="CommuSaveForm" action="/notice" method="post"
							id="saveForm" enctype="multipart/form-data">
							<div class=form-group>
								<br> <input type="hidden" value="공지사항" id="category">
							</div>
							<div class="form-group">
								<label for="title">Title</label><br> <input type="text"
									class="form-control" placeholder="Enter title" name="title"
									id="title">
							</div>

							<div class="form-group">
								<label for="content">Content:</label><br>
								<textarea class="form-control summernote" name="content"
									id="content"></textarea>
							</div>
							<div class="form-group">
								<label for="file">File</label><br> <input type="file" 
									name="file" class="form-control" id="file" multiple="multiple">
							</div>
							<div id="btn_div">
								<button type="submit">저장</button>
							</div>
						</form>
					</div>
				</div>

				<div id="tab2" class="cont">
					<h1 class="newstu">프리미엄 신청교수</h1>
					<c:forEach var="pre" items="${pre}">
						
							<a href="/auth/FindTeacher/${pre.id}">${pre.title}</a>
							<button onclick="premiumOk(${pre.id})">승인</button>
							<button onclick="premiumNo(${pre.id})">거부</button>
							<br>
							<br>
							<br>
							<hr>
						
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
				function premiumOk(pre) {
						console.log(pre)
						$.ajax({
							url: "/premiumOk/"+pre,
							type: "post",
							dataType: 'json',
							done: function (result) {
								console.log('성공')
							},
							fail: function () {
								alert("서버요청실패");
							}
						})


					}
					function premiumNo(pre) {
						$.ajax({
							url: "/premiumNo/"+pre,
							type: "post",
							dataType: 'json',
							done: function (result) {
								console.log('성공')
							},
							fail: function () {
								alert("서버요청실패");
							}
						})

					}
			</script>
<script type="text/javascript" src="/JS/mypage.js"></script>
<%@ include file="../layout/footer.jsp"%>