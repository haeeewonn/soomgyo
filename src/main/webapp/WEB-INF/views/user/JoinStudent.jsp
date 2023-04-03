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
    <title>숨교:학생 회원가입</title>
</head>
<body>
    <div id="join_student_container2">
        <div id="container1">
        	<a href="/" onclick="return test1()"><h1>SoomGyo</h1></a>
            <a href="/auth/join" onclick="return test2()"><h1>과목 선택</h1></a>
            <div class="sub_checkbox">
                <div class="sub_checkbox_box">
                    <label for="JAVA">JAVA</label>
                    <input type="checkbox"  value="JAVA" name="subject" id="JAVA" class="btn_check">
                </div>
                <div class="sub_checkbox_box">
                    <label for="JavaScript">JavaScript</label>
                    <input type="checkbox" value="JavaScript" name="subject" id="JavaScript" class="btn_check">
                </div>
                <div class="sub_checkbox_box">
                    <label for="Cc">C</label>
                    <input type="checkbox" value="C" name="subject" id="Cc" class="btn_check">
                </div>
                <div class="sub_checkbox_box">
                    <label for="Python">Python</label>
                    <input type="checkbox" value="Python" id="Python" name="subject" class="btn_check">
                </div>
                <div class="sub_checkbox_box">
                    <label for="Oracle">Oracle</label>
                    <input type="checkbox" value="Oracle" id="Oracle" name="subject" class="btn_check">
                </div>
            </div>
                <div class="join_input2">
                    <input type="submit" value="다음으로" onclick="nextJoin()">
                </div>
        </div>
        <!--LOGO-->
        <div id="container2">
        <a href="/" onclick="return test1()"><h1 class="join_h1 join_h1_padding">SoomGyo</h1></a>
        <a href="/auth/join" onclick="return test2()"><h1 class="join_h1">학생 가입</h1></a>
        <!--회원가입 Form-->
            <!--이름-->
            <div class="join_input">
            	<input type="hidden" id="role" value="student">
                <label for="name">이름</label><br>
                <input type="text" name="name" size="20" placeholder="이름를 입력해 주세요" id="name" onblur="nameck()" maxlength="10"><br>
            </div>
                <div class="msg redfont blankname">이름을 입력해주세요 </div>
                <div class="msg redfont redname">한글과 영문 대 소문자를 사용해주세요. (특수기호, 공백 사용 불가) </div>
                <div class="msg greenfont greenname">좋은 이름이네요! </div>
            <!--아이디-->
            <div class="join_input">
                <label for="userid">아이디</label><br>
                <input type="text" name="userid" size="20" placeholder="아이디를 입력해 주세요" onkeyup="idck()" id="userid" maxlength="20">
                <input type="hidden" name="reid" size="20" id="reid"><br>
            </div>
                <div class="msg redfont idLength">5~20자의 영문 소문자, 숫자만 사용 가능합니다!! </div>
                <div class="msg redfont idOverlap">아쉽네요 이미 사용중인 아이디입니다! </div>
                
                <div class="msg redfont idBlank">공백없이 입력해주세요! </div>
                <div class="msg greenfont idtrue">멋진 아이디네요!</div>
                <span id="olmessage"></span>
            <!--비밀번호-->
            <div class="join_input">
                <label for="pwd">비밀번호</label><br>
                <input type="password" name="pwd" size="20" placeholder="비밀번호를 입력해 주세요" id="pwd" onkeyup="pwck()" onblur="pwdcheck()"maxlength="16" ><br>
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
            <!--이메일-->
            <div class="join_input">
                <label for="email">이메일</label><br>
                <input type="text" name="email" size="20" placeholder="이메일를 입력해 주세요" id="email" onkeyup="mailck()" maxlength="30"><br>
                <button class="send_mail" style="background-color:transparent;">인증받기</button>
                <input type="hidden" id="useremail" name="useremail">
                
               
                <input type="text" placeholder="인증번호 입력" id="ck_mail"  maxlength="8"><span id="timer"></span>
             
                <span id="mail-check-span"></span>
            </div>
            <div class="msg redfont mailOverlap">중복 이메일이네요! </div>
             <div class="msg redfont mailmsg">지금 이메일이 정확한가요? </div>
            <!--전화번호-->
            <div class="join_input">
                <label for="phone">전화번호 (선택)</label><br>
                <input type="text" name="phone" id="phone" size="20" placeholder="전화번호를 입력해 주세요"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /maxlength="11"><br>
                <div class="msg redfont">전화번호를 확인해주세요!</div>
            </div>
            <!--가입하기-->
            

        <div class="join_input">
                <input type="submit" value="가입하기" onclick="allck();" >
                <input type="text" value="" id="admin">
            </div>
         </div>
    </div>
    <script type="text/javascript" src="/JS/join.js"></script> 
</html>