<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숨교: 교수 회원가입</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/joinTeacher.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
</head>
<body>
    <div id="container">
        <div id="container1">
        	<a href="/" onclick="return test1()"><h1>SoomGyo</h1></a>
            <a href="/auth/join" onclick="return test2()"><h1>과목 선택</h1></a>
            <div class="sub_checkbox">
            <input type="hidden" id="role" value="teacher">
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
        <div id="container2">
        	<a href="/" onclick="return test1()"><h1 class="join_h1 join_h1_padding">SoomGyo</h1></a>
            <a href="/auth/join" onclick="return test2()"><h1 class="join_h1">주소</h1></a>
	        <div class="join_input">
        	<input type="text" id="adr_number" placeholder="우편번호" readonly>
        	<input type="button" onclick="sample6_execDaumPostcode()" class="adr_btn">
        	<div class="msg redfont adrnum">우편번호를 입력해주세요!</div>
        	</div>
			<div class="join_input">
			<input type="text" id="adr1"  placeholder="주소" readonly><br>
			</div>
			<div class="join_input">
			<input type="text" id="adr2" placeholder="상세주소">
			<div class="msg redfont adr2">상세주소를 입력해주세요!</div>
			</div>
			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			<div class="join_input2">
                    <input type="submit" value="다음으로" onclick="nextJoin2()">
            </div>
        </div>
        <div id="container3">
             <!--LOGO-->
        <a href="/" onclick="return test1()"><h1 class="join_h1 join_h1_padding">SoomGyo</h1></a>
        <a href="/auth/join" onclick="return test2()"><h1 class="join_h1">교수 가입</h1></a>
        <!--회원가입 Form-->
            <!--이름-->
            <div class="join_input">
            	<input type="hidden" id="role" value="teacher">
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
                <div class="msg redfont idOverlap">아쉽네요!! 이미 사용중인 아이디입니다! </div>
                <div class="msg redfont idBlank">공백없이 입력해주세요! </div>
                <div class="msg greenfont idtrue">멋진 아이디네요!</div>
              
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
                <input type="text" name="email" size="20" placeholder="이메일를 입력해 주세요" id="email" onblur="mailck()" maxlength="30"><br>
                <button class="send_mail" style="background-color:transparent;">인증받기</button>
                <input type="hidden" id="useremail" name="useremail">
                
               
                <input type="text" placeholder="인증번호 입력" id="ck_mail"  maxlength="8"><span id="timer"></span>
             
                <span id="mail-check-span"></span>
            </div>
             <div class="msg redfont mailmsg">지금 이메일이 정확한가요? </div>
            <!--전화번호-->
            <div class="join_input">
                <label for="phone">전화번호 (선택)</label><br>
                <input type="text" name="phone" id="phone" size="20" placeholder="전화번호를 입력해 주세요"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /maxlength="11"><br>
                <div class="msg redfont">전화번호를 확인해주세요!</div>
            </div>
            <!--가입하기-->
        <div class="join_input">
                <input type="submit" value="가입하기" onclick="allck2();" >
            </div>
        </div>
    </div>
 <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('adr_number').value = data.zonecode;
                document.getElementById("adr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("adr2").focus();
            }
        }).open();
    }
</script>
    <script type="text/javascript" src="/JS/join.js"></script>
</body>
</html>