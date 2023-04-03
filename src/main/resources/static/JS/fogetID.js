
 function fogetId(){
	let email = $("#useremail").val();
	
	console.log(email);
	if(email==""){alert('이메일을 입력하셨나요?')}
	else{
  $.ajax({
		url : "/auth/fogetid/"+email,
		type : "post",
		dataType : 'json',
		success : function(result){
			
			if(result.data != null){
				$("#ck_num").show();
				$(".noEmail").hide();
				$(".hide1").hide();
				$("#useremail").attr("readonly",true);
				$('input[name=re_id]').attr('value',result.data);
				mailnum();
			} else{
				$(".noEmail").show();
				
			} 
		},
		error : function(){
			alert("서버요청실패");
		}
	})
	}
	}


function chkEmailConfirm(data){
		
		$("#ck_number").on("keyup", function(){
			
			
			if (data != $("#ck_number").val()) { //
				$("#mail-check-span").text('잘못된 인증 번호입니다.');
				
			} else {
				
				isRunning = false;
				$("input[name=ck_id]").attr("value",$("#re_id").val());
				$("#hide_last").hide();
				$("#ck_id").show();
				
				}
			
		})
	}
	
	function mailnum() {
	var email=$("#useremail").val()
	var count=30;
	var display=$("#timer2");
   $.ajax({
			type : 'GET',
			url : '/auth/mailConfirm?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			
      success : function(data){
		
         alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
         startTimer(count, display);
         chkEmailConfirm(data);
         $(".send_mail2").hide();
 
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

	$(".send_mail2").attr("disabled",true);
	
	 isRunning = false;}
	 if(isRunning){}
	 else{
      clearInterval(timer);
      display.html("시간 초과");
      $(".send_mail2").attr("disabled",false);
      $(".send_mail2").show();
      
  
     }
     
    
  }, 1000);
  isRunning = true;
}



