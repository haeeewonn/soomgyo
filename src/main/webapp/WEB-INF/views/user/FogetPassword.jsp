<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/joinStudent.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <title>숨교:비밀번호 찾기</title>
    
</head>
<body>
    <div id="join_student_container">
        <!--LOGO-->
        <a href="/"><h1 class="join_h1">SoomGyo</h1></a>
        <!--회원가입 Form-->
         <div id="hide_last">
        <span>찾고싶은 아이디를 입력해주세요!</span>
            <div class="join_input">
                <input type="text" name="userid" size="20" placeholder="아이디를 입력해 주세요" id="userid">
            </div>
            <div class="hide1">
            	<div class="msg redfont noID">아이디가 없는걸요?</div>
	            <div class="join_input">
	                <input type="submit" value="비밀번호 찾기" onclick="idck()">
	            </div>
	            <div class="atag_color">
	                <a href="/auth/searchid" >아이디를 잊어먹었다면?!</a>
	            </div>
            </div>
            	<div id="email_box">
              	<div class="join_input">
              		<label for="useremail">이메일 본인 인증</label>
                	<input type="email" name="useremail" size="20" placeholder="이메일을 입력해 주세요" id="useremail">
                	<input type="hidden" name="re_email" id="re_email" readonly>
            	</div>
            	<div class="msg redfont noEmail">요 이메일이 맞을까요?</div>
            	<div class="join_input">
	                <input type="submit" value="인증 받기" id="ck_mail">
	            </div>
	            </div>
	         <div id="ck_num">
                <div class="join_input">
                    <label for="ck_number">인증 번호</label><br>
                    <input type="text" name="ck_number" size="20" placeholder="인증 번호를 입력해주세요" id="ck_number">
                     <span id="timer2"></span>
                    <input type="hidden" name="reid" size="20"><br>
                </div>
                <div class="join_input">
                    <input type="submit" value="인증번호 확인">
                </div>
            </div>
        </div>
        <div id="re_password">
        	<h1>비밀번호 재설정</h1>
        	 <div class="join_input">
                <label for="pwd">비밀번호</label><br>
                <input type="password" name="pwd" size="20" placeholder="비밀번호를 입력해 주세요" id="pwd" onkeyup="pwck()" maxlength="16" ><br>
                <img alt="lock" src="/img/bluelock.png" class="lock bluelock">
                <img alt="lock" src="/img/redlock.png" class="lock redlock">
            </div>
            	<div class="msg redfont pwdmsg">8~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요~</div>
            	<div class="msg redfont pwdblank">공백없이 입력해주세요!</div>
            	<div class="msg redfont pwdmix">영문,숫자,특수문자를 혼합하여 입력해주세요.</div>
            	<div class="msg redfont pwdsame">같은 문자를 4번 이상 사용하실 수 없습니다.</div>
         
            <!--비밀번호 확인-->
            <div class="join_input">
                <label for="pwdcheck">비밀번호 확인</label><br>
                <input type="password" name="pwd_check" size="20" placeholder="비밀번호를 다시 한번 입력해 주세요" id="pwd_check" onkeyup="pwdcheck()" maxlength="16"><br>
            </div>
           		<div class="msg redfont ckfalse">비밀번호가 맞지 않습니다! </div>
               	<div class="msg greenfont cktrue">비밀번호가 정확히 맞습니다! </div>
               	<div class="join_input">
                    <input type="submit" value="비밀번호 재설정" onclick="savepwd();">
        		</div>
        </div>
      
    </div>

<script type="text/javascript" src="/JS/fogetPwd.js"></script> 
<%@ include file="../layout/footer.jsp" %>
