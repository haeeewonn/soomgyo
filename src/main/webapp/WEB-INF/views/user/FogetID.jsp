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
    <title>숨교:아이디 찾기</title>
</head>
<body>
    <div id="join_student_container">
        <!--LOGO-->
       	
	        <a href="/"><h1 class="join_h1">SoomGyo</h1></a>
	        <!--회원가입 Form-->
	        <div id="hide_last">
	        <span>찾으실 아이디에 이메일을 입력해주세요~!</span>
	       
            <div class="join_input">
            	<button class="send_mail2" style="background-color:transparent; display:none; disabled:true;" onclick="mailnum()" >인증받기</button>
                <input type="email" name="useremail" size="20" placeholder="이메일을 입력해 주세요" id="useremail">
                
               
            </div>
             <div class="msg redfont noEmail">요 이메일이 맞을까요?</div>
             <div class="hide1">
	            <div class="join_input">
	                <input type="submit" value="아이디 찾기" onclick="fogetId()">
	            </div>
	            <div class="atag_color">
	                <a href="/auth/searchpwd" >비밀번호를 잊어버리셨나요?</a>
	            </div>
            </div>
            <div id="ck_num">
                <div class="join_input">
                    <label for="ck_number">인증번호</label><br>
                    <input type="text" name="ck_number" size="20" placeholder="인증 번호를 입력해주세요" id="ck_number" >
                    
                    <span id="timer2"></span>
                    <span id="mail-check-span"></span>
                </div>
            </div>
         </div>
            <div id="ck_id">
                <div class="join_input">
                    <label for="ck_number">찾으시는 아이디 입니다~</label><br>
                    <input type="text" name="ck_id" size="20"  readonly>
                    <input type="hidden" name="re_id" id="re_id">
                </div>
                <div class="join_input">
	                <input type="submit" value="로그인 페이지 가기" onclick="location.href='/auth/login';">
	            </div>
	            <div class="atag_color">
	                <a href="/auth/searchpwd" >비밀번호도 기억이 안난다면?</a>
	            </div>
            </div>
    </div>

    <script type="text/javascript" src="/JS/fogetID.js"></script> 
<%@ include file="../layout/footer.jsp" %>