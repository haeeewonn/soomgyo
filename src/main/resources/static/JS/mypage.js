const tabList = document.querySelectorAll('.tab_menu .list li');
const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

for(var i = 0; i < tabList.length; i++){
  tabList[i].querySelector('.btn').addEventListener('click', function(e){
    e.preventDefault();
    for(var j = 0; j < tabList.length; j++){
      // 나머지 버튼 클래스 제거
      tabList[j].classList.remove('is_on');

      // 나머지 컨텐츠 display:none 처리
      contents[j].style.display = 'none';
    }

    // 버튼 관련 이벤트
    this.parentNode.classList.add('is_on');

    // 버튼 클릭시 컨텐츠 전환
    activeCont = this.getAttribute('href');
    document.querySelector(activeCont).style.display = 'block';
  });
}

function pwck() {
        let pw = $("#password").val();
        let number = pw.search(/[0-9]/ig);
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
		if($("#password").val() == $("#pwd_check").val()){
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

function modify(){
  var java = document.getElementById("JAVA") 
  var Cc = document.getElementById("Cc") 
  var Clag = document.getElementById("JavaScript") 
  var Python= document.getElementById("Python") 
  var Oracle = document.getElementById("Oracle") 
  
  var pwd = $("#password").val();
  var pwdcheck = $("#pwd_check").val();
  if(pwd==""){
	alert("비밀번호를 입력해주세요")
	return false;

  }
	if(pwdcheck==""){
		alert("비밀번호를 다시 한번 확인해주세요")
		return false;
	}
  if(!(java.checked || Cc.checked || Clag.checked|| Python.checked|| Oracle.checked )){
     alert("관심 분야를 체크해주세요.")
     return false;
  }
  alert("회원정보수정이 완료되었습니다!")
}

function user_delete(){
	var id=$("#userid").val();
	console.log("탈퇴");
	$.ajax({
		type:"DELETE",
		url:"/api/info/"+id,
		dataType:"json"
	}).done(function(resp){
			alert("이용해주셔서 감사합니다");
			location.href="";
	}).fail(function(error){
			alert(JSON.stringify(error));
	});
}


  	function counsel(){
  		var TId=$("#teacherId").val();
  		var SId=$("#studentId").val();
  		var role=$("#loginRole").val();
 
  		if(role=="TEACHER"){
  			alert('학생이 아니시군요!');
  			
  		}
  		else{
  		
  			$.ajax({
  				
  				type:"POST",
  				url:"/counselck/"+SId+"/"+TId,
  				contentType:"application/json; charset=utf-8",
  				dataType:"json"
  			}).done(function(resp){
				
  				
  				if(resp){
  				
  					alert('이미 신청하셨네요');
  				}
  				else{
  				
  					$.ajax({
	  	  				type:"POST",
	  	  				url:"/counsel/"+SId+"/"+TId,
	  	  				contentType:"application/json; charset=utf-8",
	  	  				dataType:"json"
	  	  			}).done(function(resp){
	  	  				alert("신청이 완료되었습니다");
	  	  				
	  	  			}).fail(function(error){
	  	  				alert(JSON.stringify(error));
	  	  			});
  					
  				}
  			
  		
  		}).fail(function(error){
  				alert('오류!')
  			});
  			}
  		}
  	