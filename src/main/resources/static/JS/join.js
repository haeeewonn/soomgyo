function allck(){
	var result=1;
	if ($("#name").val() == "") {
		$(".blankname").css("display","inline");
		$(".redname").css("display","none");
		$(".greenname").css("display","none");
		$("#name").focus();
		result=0;
	
	}
	if ($("#name").val().length <= 1) {
		$(".blankname").css("display","inline");
		$(".redname").css("display","none");
		$(".greenname").css("display","none");
		$("#name").focus();
		result=0;
	
	}
	for (var i=0; i<$("#name").val().length; i++)  { 
	    var chk = $("#name").val().substring(i,i+1); 
	
	    if(chk.match(/[0-9]/)) { 
	
	    		$(".blankname").hide();
				$(".redname").show();
				$(".greenname").hide();
				$("#name").focus();
				result=0;
	
	       
	
	    }
	
	    if(chk.match(/([^가-힣a-zA-Z\x20])/i)){
	
    		$(".blankname").hide();
			$(".redname").show();
			$(".greenname").hide();
			$("#name").focus();
			result=0;

	        
	
	    }
	
	    if($("#name").val() == " "){
	
	    	$(".blankname").hide();
			$(".redname").show();
			$(".greenname").hide();
			$("#name").focus();
			result=0;
	        
	
	    }
	
	}
	
    var id=$("#userid").val();

    //특수문자가 있는지 확인
    var spe = id.match(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let eng = id.match(/[A-Z]/g);
    var korean = id.match(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi);
    if ((id.length < 5) || (id.length > 20)) {
 
      $(".idLength").show();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").hide();
      $("#userid").focus();
	  result=0;
     
    }
    if (id.match( /[\s]/g)) {
      $(".idLength").hide();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").show();
      $("#userid").focus();
	  result=0;
    }
    if (spe || korean || eng) {
      $(".idLength").show();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").hide();
      $("#userid").focus();
	  result=0;
    }
     $.ajax({
		url : "/auth/idCheck.do/"+$("#userid").val(),
		type : "post",
		dataType : 'json',
		success : function(result){
			if(result){
				$(".idOverlap").show();
				$(".idtrue").hide();
				$(".idLength").hide();
			      $(".idBlank").hide();
			      result=0;
				
			} 
		},
		error : function(){
			
		}
	})
    
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
            $("#pwd").focus();
	  		result=0;
        } else if (pw.search(/\s/) != -1) {
            $(".pwdblank").show();
            $(".pwdmsg").hide();
            $(".pwdmix").hide();
            $(".pwdsame").hide();
            $(".pwdid").hide();
            $(".redlock").show();
            $(".bluelock").hide();
            $("#pwd").focus();
	  		result=0;
        } else if (number < 0 || english < 0 || spece < 0) {
             $(".pwdmix").show();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".pwdsame").hide();
             $(".pwdid").hide();
             $(".redlock").show();
            $(".bluelock").hide();
           $("#pwd").focus();
	  		result=0;}
          else if (/(\w)\1\1\1/.test(pw)) {
            $(".pwdsame").show();
             $(".pwdid").hide();
             $(".pwdmix").hide();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".redlock").show();
            $(".bluelock").hide();
           $("#pwd").focus();
	  		result=0;
	  		}

        console.log('이메일')
  	if($('#useremail').val()==""){
	result=0;
    }
    if($('#reid').val()==""){
	result=0;
    }
    
    

	if(result==0){
		
		return;
	}
	else{
		save();
	}
   
}
function allck2(){
	var result=1;
	if ($("#name").val() == "") {
		$(".blankname").css("display","inline");
		$(".redname").css("display","none");
		$(".greenname").css("display","none");
		$("#name").focus();
		result=0;
	
	}
	if ($("#name").val().length <= 1) {
		$(".blankname").css("display","inline");
		$(".redname").css("display","none");
		$(".greenname").css("display","none");
		$("#name").focus();
		result=0;
	
	}
	for (var i=0; i<$("#name").val().length; i++)  { 
	    var chk = $("#name").val().substring(i,i+1); 
	
	    if(chk.match(/[0-9]/)) { 
	
	    		$(".blankname").hide();
				$(".redname").show();
				$(".greenname").hide();
				$("#name").focus();
				result=0;
	
	       
	
	    }
	
	    if(chk.match(/([^가-힣a-zA-Z\x20])/i)){
	
    		$(".blankname").hide();
			$(".redname").show();
			$(".greenname").hide();
			$("#name").focus();
			result=0;

	        
	
	    }
	
	    if($("#name").val() == " "){
	
	    	$(".blankname").hide();
			$(".redname").show();
			$(".greenname").hide();
			$("#name").focus();
			result=0;
	        
	
	    }
	
	}
	
    var id=$("#userid").val();

    //특수문자가 있는지 확인
    var spe = id.match(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let eng = id.match(/[A-Z]/g);
    var korean = id.match(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi);
    if ((id.length < 5) || (id.length > 20)) {
 
      $(".idLength").show();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").hide();
      $("#userid").focus();
	  result=0;
     
    }
    if (id.match( /[\s]/g)) {
      $(".idLength").hide();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").show();
      $("#userid").focus();
	  result=0;
    }
    if (spe || korean || eng) {
      $(".idLength").show();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").hide();
      $("#userid").focus();
	  result=0;
    }
     $.ajax({
		url : "/auth/idCheck.do/"+$("#userid").val(),
		type : "post",
		dataType : 'json',
		success : function(result){
			if(result){
				$(".idOverlap").show();
				$(".idtrue").hide();
				$(".idLength").hide();
			      $(".idBlank").hide();
			      result=0;
				
			} 
		},
		error : function(){
			
		}
	})
    
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
            $("#pwd").focus();
	  		result=0;
        } else if (pw.search(/\s/) != -1) {
            $(".pwdblank").show();
            $(".pwdmsg").hide();
            $(".pwdmix").hide();
            $(".pwdsame").hide();
            $(".pwdid").hide();
            $(".redlock").show();
            $(".bluelock").hide();
            $("#pwd").focus();
	  		result=0;
        } else if (number < 0 || english < 0 || spece < 0) {
             $(".pwdmix").show();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".pwdsame").hide();
             $(".pwdid").hide();
             $(".redlock").show();
            $(".bluelock").hide();
           $("#pwd").focus();
	  		result=0;}
          else if (/(\w)\1\1\1/.test(pw)) {
            $(".pwdsame").show();
             $(".pwdid").hide();
             $(".pwdmix").hide();
             $(".pwdmsg").hide();
             $(".pwdblank").hide();
             $(".redlock").show();
            $(".bluelock").hide();
           $("#pwd").focus();
	  		result=0;
	  		}

        console.log('이메일')
  	if($('#useremail').val()==""){
	result=0;
    }
    if($('#reid').val()==""){
	result=0;
    }
    
    

	if(result==0){
		
		return;
	}
	else{
		save2();
	}
   
}
	


	




function nameck(){
	
	if ($("#name").val() == "") {
		$(".blankname").css("display","inline");
		$(".redname").css("display","none");
		$(".greenname").css("display","none");
	
		return false;
	
	}
	/* 2글자 미만 사용 금지 */
	
	if ($("#name").val().length <= 1) {
		$(".blankname").css("display","inline");
		$(".redname").css("display","none");
		$(".greenname").css("display","none");
		return false;
	
	}
	for (var i=0; i<$("#name").val().length; i++)  { 
	
	    var chk = $("#name").val().substring(i,i+1); 
	
	    if(chk.match(/[0-9]/)) { 
	
	    		$(".blankname").hide();
				$(".redname").show();
				$(".greenname").hide();
	
	        return false;
	
	    }
	
	    if(chk.match(/([^가-힣a-zA-Z\x20])/i)){
	
    		$(".blankname").hide();
			$(".redname").show();
			$(".greenname").hide();

	        return false;
	
	    }
	
	    if($("#name").val() == " "){
	
	    	$(".blankname").hide();
			$(".redname").show();
			$(".greenname").hide();
	        return false;
	
	    }
	
	}
		$(".blankname").hide();
		$(".redname").hide();
		$(".greenname").show();
		
};


	
	
		
		 

	

function idck() {
	
if($("#userid").val()!=""){
	var id=$("#userid").val();
for(let i=0; i<=1; i++){
 	
 	console.log(id)
    //특수문자가 있는지 확인
    var spe = id.match(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let english = id.match(/[A-Z]/g);
    // 한글이 있는지 확인
    var korean = id.match(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi);
    console.log(english) 
    if ((id.length < 5) || (id.length > 20)) {
 
      $(".idLength").show();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").hide();
      break;
 
    }
    if (id.match( /[\s]/g)) {
      $(".idLength").hide();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").show();
      break;
    
    }
    if (spe || korean || english) {
      $(".idLength").show();
      $(".idOverlap").hide();
      $(".idtrue").hide();
      $(".idBlank").hide();
      break;
 
    }
    $.ajax({
		url : "/auth/idCheck.do/"+$("#userid").val(),
		type : "post",
		dataType : 'json',
		success : function(result){
			if(result){
				$(".idOverlap").show();
				$(".idtrue").hide();
				$(".idLength").hide();
			      $(".idBlank").hide();
				
			} else{
				$(".idOverlap").hide();
				 $(".idLength").hide();
			      $(".idOverlap").hide();
			      $(".idtrue").show();
			      $(".idBlank").hide();
			      $('input[name=reid]').attr('value',$("#userid").val());
			     
				
			} 
		},
		error : function(){
			alert("서버요청실패");
		}
	})
	 
 
}
}
};

function pwck() {
        let id = $("#username").val();
        let pw = $("#pwd").val();
        let pw2 =$("#pwd_check").val();
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
            
        }



    };
    
 function pwdcheck(){
	if( $("#pwd_check").val() == ""){
		$(".ckfalse").show();
		$(".cktrue").hide();
	}
	else{
		if($("#pwd").val() == $("#pwd_check").val()){
		$(".ckfalse").hide();
		$(".cktrue").show();
		return;
	}
	else{
		$(".ckfalse").show();
		$(".cktrue").hide();
	
		return false;
	}
	}
	
};

function mailck() {
  // 이메일 검증 스크립트 작성
  var emailVal = $("#email").val();

  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  // 검증에 사용할 정규식 변수 regExp에 저장

  if (emailVal.match(regExp) != null) {
	$.ajax({
		url : "/auth/emailCheck.do/"+$("#email").val(),
		type : "post",
		dataType : 'json',
		success : function(result){
			if(result){
				$('.mailOverlap').show();
				$(".mailmsg").hide();
				return true;
				
			} else{
				  $(".mailmsg").hide();
				  $('.mailOverlap').hide();

    			return false;
				
			} 
		},
		error : function(){
			alert("서버요청실패");
		}
	})
  }
  else {
    $(".mailmsg").show();
    $('.mailOverlap').hide();

    return false;
  }
};


	function save(){
		//alert('user의 save함수 호출됨');
		var admin=$("#admin").val();
		let role=$("#role").val();
		if(admin ==="admin"){
			role="ADMIN";
		}
		
		let data={
			userid: $("#reid").val(),
			name: $("#name").val(),
			password: $("#pwd").val(),
			email: $("#useremail").val(),
			phone: $("#phone").val(),
			category: sub
			
		};
		
		
		$.ajax({ 
			type:"POST",
			url:"/auth/joinProc/"+role,
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("회원가입이 완료되었습니다.");
			location.href="/";
	
		}).fail(function(error){
			alert(JSON.stringify(error));
	
		});
	
	}
		function save2(){
		//alert('user의 save함수 호출됨');
		let data={
			userid: $("#userid").val(),
			adr1: $("#adr1").val(),
			adr2: $("#adr2").val(),
			category: sub,
			name: $("#name").val(),
			password: $("#pwd").val(),
			email: $("#useremail").val(),
			phone: $("#phone").val()
		};
		let role=$("#role").val();
		//console.log(data); 자바스크립트 오브젝트
		//console.log(JSON.stringfy(data)) json 오브젝트
		//ajax호출시 디폴트가 비동기 호출
		//ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환
		$.ajax({ 
			//회원가입 수행 요청 
			//(100초라 가정한다면 도중에 done이나 fail 실행 )
			type:"POST",
			url:"/auth/joinProc/"+role,
			data:JSON.stringify(data), //http body 데이터
			contentType:"application/json; charset=utf-8",
			dataType:"json" //자동으로 변환해주기 때문에 생략 가능
			//응답의 결과가 문자열이 아닌 json으로 변환
		}).done(function(resp){
			alert("회원가입이 완료되었습니다.");
			location.href="/";
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
			//응답이 비정상
		});
		//ajax통신을 이용해서 3개의 데이터를 json으로 변경하여 insert요청!!
	}
	
var test=[];
var sub;
function nextJoin() {
  
  var java = document.getElementById("JAVA") 
  var Cc = document.getElementById("Cc") 
  var Clag = document.getElementById("JavaScript") 
  var Python= document.getElementById("Python") 
  var Oracle = document.getElementById("Oracle") 
  if(!(java.checked || Cc.checked || Clag.checked|| Python.checked|| Oracle.checked )){
     alert("체크를 해주세요.")
     return false;
  }
  else{
	$("#container1").hide();
	$("#container2").show();
	$("input[name=subject]:checked").each(function() {
	  test.push ($(this).val());
		sub=test.join();  

	  
	})

	
	}
	
}
function nextJoin2() {
  var adrnum=$("#adr_number").val();
  var adr1=$("#adr1").val();
  var adr2=$("#adr2").val();
  var result1=0;
  var result2=0;
  if(adrnum==""){
	$(".adrnum").show();
		result1=1;
	}
	else{
		$(".adrnum").hide();
		result1=0;
	}
  if(adr2==""){
	$(".adr2").show();
	result2=1;
	
	}
	else{
		$(".adr2").hide();
		result=0;
	}
	if(result1==1||result2==1){
		return false;
	}
	else{
		$("#container2").hide();
		$("#container3").show();
	}
 


	
}

function test2() {
        if (!confirm("회원 선택 페이지로 돌아가시겠습니까?")) {
            return false;
        } else {
            return true;
        }
    }
function test1() {
    if (!confirm("메인 페이지로 돌아가시겠습니까?")) {
        return false;
    } else {
        return true;
    }
}
 
 
 

$(".send_mail").click(function() {

	var email=$("#email").val()
	if(email==""){alert('메일을 입력해주세영')}
	else{
	var count=30;
	var display=$("#timer");
   $.ajax({
			type : 'GET',
			url : '/auth/mailConfirm?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			
      success : function(data){
		console.log('실행중22')
		startTimer(count, display);
         alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
         $(".send_mail").css('display','none');
         $(".send_mail").text('재인증');
         $("#ck_mail").attr('readonly',false);
         chkEmailConfirm(data);
      },
      error : function(){
			alert("서버요청실패");
		}
      
   })
   

	}
})

	// 이메일 인증번호 체크 함수
	function chkEmailConfirm(data,mailck){

		$("#ck_mail").on("keyup", function(){
			
	
			if (data != $("#ck_mail").val()) { //
				$("#mail-check-span").text('잘못된 인증 번호입니다.');
				emconfirmchk = false;
				
			} else {
				emconfirmchk = true;
				$("#mail-check-span").css('color','rgba(0, 128, 0, 0.5)');
				$("#mail-check-span").text('인증 완료 되었습니다.');
				$("#ck_mail").attr("readonly",true);
				$("#email").attr("readonly",true);
				$(".send_mail").attr("disabled",true);
				$('input[name=useremail]').attr('value',$("#email").val());
				isRunning = false;
				$(".send_mail").css('display','none');
				$("#timer").css('display','none');
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
	console.log('timer');
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
      var ck= $('#useremail').val();
      $("#ck_mail").attr('readonly',true);
      if(ck=="")
      {$(".send_mail").css('display','inline');}
      else{
	$(".send_mail").css('display','inline');
}
      }
     
    
  }, 1000);
  isRunning = true;
}


 
