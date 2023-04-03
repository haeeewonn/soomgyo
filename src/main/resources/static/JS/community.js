function hide1(){
	$(".comm_board1").show();
	$(".comm_board2").hide();
	$(".comm_board3").hide();
	$(".comm_board4").hide();
	$(".comm_board5").hide();
	$(".menu1").css("background-color", "#ecd3ce");
		
	
	$(".menu2").css("background-color", "");
		
	
	$(".menu3").css("background-color", "");
		

	$(".menu4").css("background-color", "");
		
	
	$(".menu5").css("background-color", "");
}
function hide2(){
	$(".comm_board1").hide();
	$(".comm_board2").show();
	$(".comm_board3").hide();
	$(".comm_board4").hide();
	$(".comm_board5").hide();
	
	$(".menu1").css("background-color", "");

	$(".menu2").css("background-color", "#ecd3ce");
		
	$(".menu3").css("background-color", "");
		
	$(".menu4").css("background-color", "");
		
	$(".menu5").css("background-color", "");
		
	
	
}
function hide3(){
	$(".comm_board1").hide();
	$(".comm_board2").hide();
	$(".comm_board3").show();
	$(".comm_board4").hide();
	$(".comm_board5").hide();
	$(".menu1").css("background-color", "");
		
	
	$(".menu2").css("background-color", "");
		
	
	$(".menu3").css("background-color", "#ecd3ce");
		

	$(".menu4").css("background-color", "");
		
	
	$(".menu5").css("background-color", "");
}
function hide4(){
	$(".comm_board1").hide();
	$(".comm_board2").hide();
	$(".comm_board3").hide();
	$(".comm_board4").show();
	$(".comm_board5").hide();
	$(".menu1").css("background-color", "");
		
	
	$(".menu2").css("background-color", "");
		
	
	$(".menu3").css("background-color", "");
		

	$(".menu4").css("background-color", "#ecd3ce");
		
	
	$(".menu5").css("background-color", "");
	
}
function hide5(){
	$(".comm_board1").hide();
	$(".comm_board2").hide();
	$(".comm_board3").hide();
	$(".comm_board4").hide();
	$(".comm_board5").show();
	$(".menu1").css("background-color", "");
		
	
	$(".menu2").css("background-color", "");
		
	
	$(".menu3").css("background-color", "");
		

	$(".menu4").css("background-color", "");
		
	
	$(".menu5").css("background-color", "#ecd3ce");
}

let index = {
	init: function(){
		$("#btn-save").on("click",()=>{
			if(this.SelectCheck()){
				this.save();
			}
		});
		$("#btn-delete").on("click",()=>{
			if(confirm("게시물을 삭제하시겠습니까?")){
				this.deleteById();	
			}
		});
		$("#btn-update").on("click",()=>{
			if(this.SelectCheck()){
				this.update();
			}
		});
	},
	
	SelectCheck(){
	var select = document.CommuSaveForm;
		if(select.category.value == ""){
			alert('카테고리를 선택해주세요');
			select.category.focus();
			return false;
		}
		return true;
	},
	save: function(){	
		let formData = new FormData();
		
		$.ajax({
			type:"POST",
			enctype:'multipart/form-data',
			url:"/api/board",
			data:formData,
			processData:false,
		    contentType:false,
		    cache:false,
			dataType:"json"
		}).done(function(resp){
			location.href="/auth/community";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function(){
		var id=$("#id").text();
		console.log("삭제");
		$.ajax({
			type:"DELETE",
			url:"/api/board/"+id,
			dataType:"json"
		}).done(function(resp){
			location.href="/auth/community";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	/*
	update: function(){
		let id=$("#id").val();
		let data={
			category: $("#category").val(),
			title: $("#title").val(),
			content: $("#content").val()
		};
		console.log("수정");
		$.ajax({
			type:"PUT",
			url:"/api/board/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("수정이 완료되었습니다");
			location.href="/auth/community";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	*/
}
index.init();