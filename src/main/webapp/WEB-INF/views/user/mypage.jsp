<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp"%>
<link rel="stylesheet" href="/css/mypage.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ include file="../layout/header.jsp"%>

<div id="container">

	<div class="member">
		<div class="picture">
			<c:choose>
				<c:when test="${principal.user.profilefilename != null}">
					<img src="/auth/img?filename=${principal.user.profilefilename}">
				</c:when>
				<c:otherwise>
					<img src="/auth/img?filename=default.png">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="info">
			<div class="info_box">
				<p>
					<b>${principal.user.userid}</b>
				</p>
				<br>
				<p>${principal.user.name}고객님,안녕하세요!</p>
			</div>
		</div>
	</div>

	<div class="wrap">
		<div class="tab_menu">
			<ul class="list">
				<li class="is_on"><a href="#tab1" class="btn">회원정보수정</a></li>
				<li><a href="#tab2" class="btn">매칭정보</a></li>
				<li><a href="#tab3" class="btn">계정탈퇴</a></li>
				<c:if test="${principal.user.roles eq 'TEACHER'}">
					<li><a href="#tab4" class="btn">교수정보등록</a></li>
				</c:if>
				<c:if test="${principal.user.roles eq 'STUDENT'}">
					<li><a href="#tab4" class="btn">내글목록</a></li>
				</c:if>

			</ul>


			<div class="cont_area">
				<div id="tab1" class="cont" style="display: block;">
					<div class="member_modify_box">
						<div class="join_modify">
							<form action="/InfoModify" method="post"
								enctype="multipart/form-data" name="join_frm">
								<!--아이디-->
								<div class="join_input">
									<label for="userid">아이디</label><br> <input type="text"
										name="userid" size="20" value="${principal.user.userid}"
										readonly="readonly"> <input type="hidden" name="reid"
										size="20"><br>
								</div>
								<!--비밀번호-->
								<div class="join_input">
									<label for="password">비밀번호</label><br> <input
										type="password" name="password" size="20"
										placeholder="비밀번호를 입력해 주세요" id="password" onkeyup="pwck()"
										onblur="pwdcheck()" maxlength="16"><br>
								</div>
								<div class="msg redfont pwdmsg">8~16자 영문 대 소문자, 숫자, 특수문자를
									사용해주세요~</div>
								<div class="msg redfont pwdblank">공백없이 입력해주세요!</div>
								<div class="msg redfont pwdmix">영문,숫자,특수문자를 혼합하여 입력해주세요.</div>
								<div class="msg redfont pwdsame">같은 문자를 4번 이상 사용하실 수 없습니다.</div>

								<!--비밀번호 확인-->
								<div class="join_input">
									<label for="pwdcheck">비밀번호 확인</label><br> <input
										type="password" name="pwd_check" size="20"
										placeholder="비밀번호를 다시 한번 입력해 주세요" id="pwd_check"
										onkeyup="pwdcheck()" maxlength="16"><br>
								</div>
								<div class="msg redfont ckfalse">비밀번호가 맞지 않습니다!</div>
								<div class="msg greenfont cktrue">비밀번호가 정확히 맞습니다!</div>
								<!--전화번호-->
								<div class="join_input">
									<label for="phone">전화번호 (선택)</label><br> <input
										type="text" name="phone" size="20"
										value="${principal.user.phone}"><br>
								</div>
								<!-- 프로필 사진 -->
								<div class="join_input">
									<label for="profileImg">프로필 사진 (선택)</label><br> <br>
									<input type="file" name="file">
								</div>
						</div>
						<div class="sub_checkbox">
							<div class="sub_checkbox_box">
								<label for="JAVA">JAVA</label> <input type="checkbox"
									value="JAVA" name="category" id="JAVA" class="btn_check">
							</div>
							<div class="sub_checkbox_box">
								<label for="JavaScript">JavaScript</label> <input
									type="checkbox" value="JavaScript" name="category"
									id="JavaScript" class="btn_check">
							</div>
							<div class="sub_checkbox_box">
								<label for="Cc">C</label> <input type="checkbox" value="C"
									name="category" id="Cc" class="btn_check">
							</div>
							<div class="sub_checkbox_box">
								<label for="Python">Python</label> <input type="checkbox"
									value="Python" id="Python" name="category" class="btn_check">
							</div>
							<div class="sub_checkbox_box">
								<label for="Oracle">Oracle</label> <input type="checkbox"
									value="Oracle" id="Oracle" name="category" class="btn_check">
							</div>
						</div>
					</div>
					<div class="button_box">
						<button onclick="return modify()">수정하기</button>
					</div>
					</form>
				</div>
				<c:if test="${principal.user.roles eq 'STUDENT'}">
					<div id="tab2" class="cont">
						<h1 class="newstu">상담 신청한 교수</h1>
						<c:forEach var="lesson" items="${lesson}">
							<div class="matching_teacher">
								<div class="matching_box">
									<div class="teacher_img">
										<c:choose>
												<c:when test="${lesson.student.profilefilename != null}">
													<img
														src="/auth/img?filename=${lesson.teacher.profilefilename}">
												</c:when>
												<c:otherwise>
													<img src="/auth/img?filename=default.png">
												</c:otherwise>
											</c:choose>
									</div>
									<div class="teacher_info">
										<p>이름 : ${lesson.teacher.name}</p>
										<p>연락처 : ${lesson.teacher.phone}</p>
										<p>전문분야 : ${lesson.teacher.category}</p>
									</div>
									<div class="btn">
										<button  class="btn_chat" onclick="window.open('/chat/${lesson.id}','채팅','width=550,height=540,location=no,status=no,scrollbars=yes');">채팅</button>
										<form action="/member/lessonNo/${lesson.teacher.id}/${principal.user.id}" method="post">
											<button class="btn_x" >취소</button>
										</form>
								</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${principal.user.roles eq 'TEACHER'}">
					<div id="tab2" class="cont">
						<h1 class="newstu">새로운 학생!</h1>

						<div class="matching_teacher">
							<c:forEach var="lesson" items="${lesson}">
								<c:if test="${lesson.lesson eq 0}">
									<div class="matching_box">
										<div class="teacher_img">
											<c:choose>
												<c:when test="${lesson.student.profilefilename != null}">
													<img
														src="/auth/img?filename=${lesson.student.profilefilename}">
												</c:when>
												<c:otherwise>
													<img src="/auth/img?filename=default.png">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="teacher_info">
											<p>이름 : ${lesson.student.name}</p>
											<p>연락처 : ${lesson.student.phone}</p>
											<p>관심분야 : ${lesson.student.category}</p>
										</div>
										<div class="btn">
												<button  class="btn_chat" onclick="window.open('/chat/${lesson.id}','채팅','width=550,height=540,location=no,status=no,scrollbars=yes');">채팅</button>
												<form action="/member/lessonOk/${principal.user.id}/${lesson.student.id}" method="post">
													<button class="btn_o">수락</button>
												</form>
												<form action="/member/lessonNo/${principal.user.id}/${lesson.student.id}" method="post">
													<button class="btn_x" >거절</button>
												</form>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<h1 class="newstu" style="margin-top: 50px;">교육중인 학생!</h1>
						<div class="matching_teacher">
							<c:forEach var="lesson" items="${lesson}">
								<c:if test="${lesson.lesson eq 1}">
									<div class="matching_box">
										<div class="teacher_img">
											<c:choose>
												<c:when test="${lesson.student.profilefilename != null}">
													<img
														src="/auth/img?filename=${lesson.student.profilefilename}">
												</c:when>
												<c:otherwise>
													<img src="/auth/img?filename=default.png">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="teacher_info">
											<p>이름 : ${lesson.student.name}</p>
											<p>연락처 : ${lesson.student.phone}</p>
											<p>관심분야 : ${lesson.student.category}</p>

										</div>
										<div class="btn">
											<button  class="btn_chat" onclick="window.open('/chat/${lesson.id}','채팅','width=550,height=520,location=no,status=no,scrollbars=yes');">채팅</button>
											<form action="/member/lessonNo/${principal.user.id}/${lesson.student.id}" method="post">
												<button class="btn_o">교육종료</button>
											</form>

										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<div id="tab3" class="cont">
					<div class="delete_info">
						<form action="/member/delete/${principal.user.id}" method="post"
							name="delete_form">
							<!--비밀번호-->
							<div class="join_input">
								<label for="password">비밀번호</label><br> <input type="hidden"
									name="userid" id="userid" value="${prinpical.user.id}">
								<input type="password" name="password" id="pwd" size="20"
									placeholder="비밀번호를 입력해 주세요" id="password" onkeyup="pwck()"
									onblur="pwdcheck()" maxlength="16">
							</div>
							<!--비밀번호 확인-->
							<div class="join_input">
								<label for="pwd_check">비밀번호 확인</label><br> <input
									type="password" name="pwd_check" id="pwd_ck" size="20"
									placeholder="비밀번호를 다시 한번 입력해 주세요"><br>
							</div>
							<!--탈퇴하기-->
							<div class="join_input">
								<input type="submit" value="탈퇴하기">
							</div>
						</form>

					</div>
				</div>
				<c:if test="${principal.user.roles eq 'TEACHER'}">
					<div id="tab4" class="cont">
						<div class="teacher_upload">
							<form action="/findTeacher" method="post"
								enctype="multipart/form-data">
								<!--제목-->
								<div class="T_upload_input">
									<label for="title">제목</label> <input type="text" name="title"
										value="${info.title}">
								</div>
								<!--본인 소개-->
								<div class="T_upload_input">
									<label for="introduce">본인 소개</label><br> <br>
									<textarea cols="75" rows="10" name="introduce">${info.introduce}</textarea>
									<p>본인 소개를 최대한 상세하게 적어주세요.</p>
								</div>
								<!--수업 정보-->
								<div class="T_upload_input">
									<label for="class_info">수업 정보</label><br> <br>
									<textarea cols="75" rows="10" name="lessoninfo" required
										wrap="hard" autofocus>${info.lessoninfo}</textarea>
									<p>수업 방식과 관련 내용을 상세하게 적어주세요.</p>
								</div>
								<!--첨부파일-->
								<div class="T_upload_input">
									<label for="addfile">첨부 파일</label><br> <br> <input
										type="file" id="file" name="file" multiple="multiple">
								</div>
								<div class="T_upload_input">
									<label for="premium">프리미엄 등록</label>
									<input type="checkbox" value="1" name="premium">
									<br>
								</div>
								
								
								<!--제출하기 버튼-->
								<div class="T_upload_btn">
									<button>제출하기</button>
								</div>
								</form>
								
							
						</div>
					</div>
				</c:if>
				<c:if test="${principal.user.roles eq 'STUDENT'}">
					<div id="tab4" class="cont">
						<div style="width: 50%; margin: 0 auto;">
							<c:forEach var="commu" items="${community}">
								<ul class="comm_board_ul"
									style="padding-top: 50px; padding-bottom: 10px; border-bottom: 1px solid #ccc; width: 100%">
									<a href="/auth/community/${commu.id}">
										<li class="comm_board_box">
											<div class="comm_board_text">
												<p class="comm_category" style="font-size: 1rem">${commu.category}</p>
												<p class="comm_title" style="font-size: 2rem">${commu.title}</p>
												<p class="comm_content"></p>

											</div>
									</li>
									</a>
								</ul>

							</c:forEach>
						</div>
					</div>
				</c:if>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/JS/mypage.js"></script>
<%@ include file="../layout/footer.jsp"%>