/**
 * 
 */
 function createroom(){
	let data={
		name: "123123123"
	}
	$.ajax({ 
			type:"POST",
			url:"/chat",
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
				console.log(resp.roomId)
		}).fail(function(error){
			alert(JSON.stringify(error));
	
		});
}