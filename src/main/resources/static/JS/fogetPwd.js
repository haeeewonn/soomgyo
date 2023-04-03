function idck(){
	var userid= $("#userid").val();
	if(userid ==""){
		alert('아이디를 입력해주세요.')
	}
	else{
	$.ajax({
		url : "/auth/fogetpwd/"+userid,
		type : "post",
		dataType : 'json',
		success : function(result){
			var data = result.data
			if(data != null){
				$(".hide1").hide();
				$("#email_box").show();
				$(".noID").hide();
				$("#userid").attr("readonly","true");
				
				fogetId(data);
				
			} else{
				$(".noID").show();
				
			} 
		},
		error : function(){
			alert("서버요청실패");
		}
	})
	}
}


 function fogetId(data){
	$("#ck_mail").click(function() {

	
	var email =$("#useremail").val();
	if(email != ""){
		if(email == data){
		var count=30;
		var display=$("#timer2");
	   $.ajax({
				type : 'GET',
				url : '/auth/mailConfirm?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				
	      success : function(data){
			startTimer(count, display);
	         alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
	         $(".noEmail").hide();
	         $("#ck_num").show();
	         chkEmailConfirm(data);
	         $("#ck_mail").attr("type","hidden"); 
	         $("#useremail").attr("readonly","true"); 
	         
	      }
	      
	   })
   }
   else{
	$(".noEmail").show();
	
	}
			

	}
	else{alert('이메일을 입력해주세요!');}
	})
}

function chkEmailConfirm(data){
		
		$("#ck_number").on("keyup", function(){
			
			
			if (data != $("#ck_number").val()) { //
				$("#mail-check-span").text('잘못된 인증 번호입니다.');
				
			} else {
				
				isRunning = false;
				$("#hide_last").hide();
				$("#re_password").show();
				$("input[name=re_email]").attr("value",$("#useremail").val());
				$("#ck_mail").attr("type","submit");
				}
			
		})
	}



var timer = null;
var isRunning = false;

    
function startTimer(count, display) {  

  var minutes, seconds;
  timer = setInterval(function () {
    minutes = parseInt(count / 60, 10);
    seconds = parseInt(count % 60, 10);
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    display.html(minutes + "분 " + seconds+"초");

    // 타이머 끝
    if (--count < 0) {
	
	 isRunning = false;}
	 if(isRunning){}
	 else{
      clearInterval(timer);
      display.html("시간 초과");
    
     
      
  
     }
     
    
  }, 1000);
  isRunning = true;
}


function savepwd(){
	var ck_email = $("#re_email").val();
	if(ck_email == ""){
		alert('이메일 인증을 안하셨군요? 하고오세여~');
	}
	
	else{
		if(pwck()){
			if(pwdcheck()){
				let data={
				password: $("#pwd").val(),
				email: ck_email
			};
			$.ajax({ 
				type:"PUT",
				url:"/auth/repassword",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType:"json"
			}).done(function(resp){
				alert("비밀번호 재설정이 완료되었습니다.");
				location.href="/auth/login";
				//응답이 정상
			}).fail(function(error){
				alert(JSON.stringify(error));
				//응답이 비정상
			});
			}
			else{alert('비밀번호를 확인해주세요')}
		}
		else{alert('비밀번호를 확인해주세요')}
	
		}
		
    }
    
    
    
    function pwck() {
        let pw = $("#pwd").val();
        let number = pw.search(/[0-9]/g);
        let english = pw.search(/[a-z]/ig);
        let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
        

        if (pw.length < 8 || pw.length > 20) {
            $(".pwdmsg").show();
            $(".pwdblank").hide();
            $(".pwdmix").hide();
            $(".pwdsame").hide();
            $(".pwdid").hide();
            $(".redlock").show();
            $(".bluelock").hide();
            return false;

        } else if (pw.search(/\s/) != -1) {
            $(".pwdblank").show();
            $(".pwdmsg").hide();
            $(".pwdmix").hide();
            $(".pwdsame").hide();
            $(".pwdid").hide();
            $(".redlock").show();
            $(".bluelock").hide();
            return false;

        } else if (number < 0 || english < 0 || spece < 0) {
             $(".pwdmix").show();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".pwdsame").hide();
             $(".pwdid").hide();
             $(".redlock").show();
            $(".bluelock").hide();
           return false;

        } 
          else if (/(\w)\1\1\1/.test(pw)) {
            $(".pwdsame").show();
             $(".pwdid").hide();
             $(".pwdmix").hide();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".redlock").show();
            $(".bluelock").hide();
           return false;

        
        } else {
             $(".pwdid").hide();
             $(".pwdmix").hide();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".pwdsame").hide();
             $(".redlock").hide();
            $(".bluelock").show();
            return true;
            
        }



    };
    
 function pwdcheck(){
	if( $("#pwd_check").val() == ""){
		$(".ckfalse").show();
		$(".cktrue").hide();
		return false;
	}	
	else{
		if($("#pwd").val() == $("#pwd_check").val()){
		$(".ckfalse").hide();
		$(".cktrue").show();
		return true;
	}
	else{
		$(".ckfalse").show();
		$(".cktrue").hide();
	
		return false;
	}
	}
	
};
