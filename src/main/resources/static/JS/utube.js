/**
 * 
 */
function search1(){
	console.log('실행중')
$.ajax({
		type : "GET",
		dataType : "json",
		url : "https://www.googleapis.com/youtube/v3/search?q=자바강의&key=AIzaSyC__XjgtHRF3Qpq15asUfYKOwMWx9K99BA&part=id,snippet&type=video&maxResults=20",
		contentType: 'application/json',
		success : function(data) {
			for(var i=0; i<20; i++){
				let save={
				videoUrl: "https://www.youtube.com/embed/"+data.items[i].id.videoId,
				title: data.items[i].snippet.title,
				thumbnail: "https://img.youtube.com/vi/"+data.items[i].id.videoId+"/0.jpg",
				category: "JAVA"
				}
				$.ajax({
				type : "post",
				dataType : "json",
				contentType: 'application/json',
				data:JSON.stringify(save), 
				url : "/auth/updatevideo",
				success : function(data) {
				
				console.log("저장완료");

				}
				})
				
				
				
			}
			
		},
		complete : function(data) {},
		error : function(xhr, status, error) {} 
	});
	}
	function search2(){
	console.log('실행중')
$.ajax({
		type : "GET",
		dataType : "json",
		url : "https://www.googleapis.com/youtube/v3/search?q=C언어강의&key=AIzaSyC__XjgtHRF3Qpq15asUfYKOwMWx9K99BA&part=id,snippet&type=video&maxResults=20",
		contentType: 'application/json',
		success : function(data) {
			for(var i=0; i<20; i++){
				let save={
				videoUrl: "https://www.youtube.com/embed/"+data.items[i].id.videoId,
				title: data.items[i].snippet.title,
				thumbnail: "https://img.youtube.com/vi/"+data.items[i].id.videoId+"/0.jpg",
				category: "Cc"
				}
				$.ajax({
				type : "post",
				dataType : "json",
				contentType: 'application/json',
				data:JSON.stringify(save), 
				url : "/auth/updatevideo",
				success : function(data) {
				
				console.log("저장완료");

				}
				})
				
				
				
			}
			
		},
		complete : function(data) {},
		error : function(xhr, status, error) {} 
	});
	}
	function search3(){
	console.log('실행중')
$.ajax({
		type : "GET",
		dataType : "json",
		url : "https://www.googleapis.com/youtube/v3/search?q=자바스크립트강의&key=AIzaSyC__XjgtHRF3Qpq15asUfYKOwMWx9K99BA&part=id,snippet&type=video&maxResults=20",
		contentType: 'application/json',
		success : function(data) {
			for(var i=0; i<20; i++){
				let save={
				videoUrl: "https://www.youtube.com/embed/"+data.items[i].id.videoId,
				title: data.items[i].snippet.title,
				thumbnail: "https://img.youtube.com/vi/"+data.items[i].id.videoId+"/0.jpg",
				category: "JavaScript"
				}
				$.ajax({
				type : "post",
				dataType : "json",
				contentType: 'application/json',
				data:JSON.stringify(save), 
				url : "/auth/updatevideo",
				success : function(data) {
				
				console.log("저장완료");

				}
				})
				
				
				
			}
			
		},
		complete : function(data) {},
		error : function(xhr, status, error) {} 
	});
	}
	function search4(){
	console.log('실행중')
$.ajax({
		type : "GET",
		dataType : "json",
		url : "https://www.googleapis.com/youtube/v3/search?q=오라클 강의&key=AIzaSyC__XjgtHRF3Qpq15asUfYKOwMWx9K99BA&part=id,snippet&type=video&maxResults=20",
		contentType: 'application/json',
		success : function(data) {
			for(var i=0; i<20; i++){
				let save={
				videoUrl: "https://www.youtube.com/embed/"+data.items[i].id.videoId,
				title: data.items[i].snippet.title,
				thumbnail: "https://img.youtube.com/vi/"+data.items[i].id.videoId+"/0.jpg",
				category: "Oracle"
				}
				$.ajax({
				type : "post",
				dataType : "json",
				contentType: 'application/json',
				data:JSON.stringify(save), 
				url : "/auth/updatevideo",
				success : function(data) {
				
				console.log("저장완료");

				}
				})
				
				
				
			}
			
		},
		complete : function(data) {},
		error : function(xhr, status, error) {} 
	});
	}
	function search5(){
	console.log('실행중')
$.ajax({
		type : "GET",
		dataType : "json",
		url : "https://www.googleapis.com/youtube/v3/search?q=파이썬 강의&key=AIzaSyC__XjgtHRF3Qpq15asUfYKOwMWx9K99BA&part=id,snippet&type=video&maxResults=20",
		contentType: 'application/json',
		success : function(data) {
			for(var i=0; i<20; i++){
				let save={
				videoUrl: "https://www.youtube.com/embed/"+data.items[i].id.videoId,
				title: data.items[i].snippet.title,
				thumbnail: "https://img.youtube.com/vi/"+data.items[i].id.videoId+"/0.jpg",
				category: "Python"
				}
				$.ajax({
				type : "post",
				dataType : "json",
				contentType: 'application/json',
				data:JSON.stringify(save), 
				url : "/auth/updatevideo",
				success : function(data) {
				
				console.log("저장완료");

				}
				})
				
				
				
			}
			
		},
		complete : function(data) {},
		error : function(xhr, status, error) {} 
	});
	}
	
	function savememo(){
		console.log('ㄴㅁㅇㄻ')
		let userid=$("#userid").val();
		let youtube=$("#youtubeid").val();
		let memo = $("#memo").val();
		let data= {
			memo: memo
		}
		
		$.ajax({ 
			type:"POST",
			url:"/ckmemo/"+youtube,
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
		
				if(resp){
					$.ajax({ 
					type:"PUT",
					url:"/updatememo/"+youtube,
					data:JSON.stringify(data), 
					contentType:"application/json; charset=utf-8",
					dataType:"json" 
					}).done(function(resp){
						alert('메모저장이 완료되었습니다. 업데이트');
				
					}).fail(function(error){
						alert(JSON.stringify(error));
		
					});
					
				}
				else{
					$.ajax({ 
						type:"POST",
						url:"/savememo/"+youtube,
						data:JSON.stringify(data), 
						contentType:"application/json; charset=utf-8",
						dataType:"json" 
					}).done(function(resp){
						alert('메모저장이 완료되었습니다. 세이브');
					
					}).fail(function(error){
							alert(JSON.stringify(error));
						
					});
						
				}
				
			
	
		}).fail(function(error){
				
			alert("실패했습니다.")
		
	
		});
		}
	
		function like(uid){
			var youtubeid=$("."+uid).val();
			let data={
				youtube: youtubeid
			}
			var ck=$("#f"+uid).val();
			console.log(ck);
				if(ck != "false"){
				$("#"+uid).attr("src","/img/0.png")
				$.ajax({ 
				type:"DELETE",
				url:"/deletelike/"+youtubeid,
				data:JSON.stringify(data), 
				contentType:"application/json; charset=utf-8",
				dataType:"json" 
				}).done(function(resp){
					
					$("#f"+uid).attr("value","false")
					
			
				}).fail(function(error){
					alert(JSON.stringify(error));
	
				});
					
				}
				else{
					$("#"+uid).attr("src","/img/1.png")
					$.ajax({ 
						type:"POST",
						url:"/savelike/"+youtubeid,
						data:JSON.stringify(data), 
						contentType:"application/json; charset=utf-8",
						dataType:"json" 
					}).done(function(resp){
						
						$("#f"+uid).attr("value","true")
					
					}).fail(function(error){
							alert(JSON.stringify(error));
						
					});
						
				}

		
		
	}
	