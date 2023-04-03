
function cknum(num){
	$("#re_name"+num).hide();
	$("#"+num).hide();
	$("#de_btn"+num).hide();
	$("#mo_finish_btn"+num).show();
	$("#re_modify_box"+num).show();
	
}


function final_modify(communityId,replyid,id){
	console.log(id)
	var number = $('#'+id).attr('class');
	console.log(number)
	let data={
			content: $("#re_modify_box"+number).val()
		}
		console.log(data.content);
	$.ajax({
		type:"PUT",
		url:"/api/board/"+communityId+"/reply/"+replyid,
		data:JSON.stringify(data),
		contentType:"application/json; charset=utf-8",
		dataType:"json"
	}).done(function(resp){
		location.href="";
		alert("댓글수정이 완료되었습니다");

	}).fail(function(error){
		alert(JSON.stringify(error));
	});
}

function replyDelete(communityId,replyid){
	console.log("삭제");
	$.ajax({
		type:"DELETE",
		url:"/api/board/"+communityId+"/reply/"+replyid,
		dataType:"json"
	}).done(function(resp){
		location.href="";
		alert("댓글이 삭제되었습니다");
	}).fail(function(error){
		alert(JSON.stringify(error));
	});
}


	
	
let replyIndex = {
	init: function(){
		$("#reply-btn-save").on("click",()=>{
			this.replySave();
		});
	},
	replySave: function() {
		let data={
			content: $("#comment").val(),
		}
		let communityId=$("#communityID").val();
		console.log(data);
		console.log(communityId);
		
		$.ajax({
			type:"POST",
			url:"/api/board/"+communityId+"/reply",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"text"
		}).done(function(resp){
			alert("댓글작성이 완료되었습니다");
			location.href="";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
}
replyIndex.init();