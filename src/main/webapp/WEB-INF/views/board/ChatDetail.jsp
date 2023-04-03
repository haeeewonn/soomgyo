
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숨교</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

        <div class="container">
            <div class="col-6">
                <h1>[[${room.name}]]</h1>
            </div>
            <div>
                <div id="msgArea" class="col"></div>
                <div class="col-6">
                    <div class="input-group mb-3">
                        <input type="text" id="msg" class="form-control">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">ì ì¡</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6"></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        
</body>
</html>
        <script th:inline="javascript">
            $(document).ready(function(){

                var roomName = [[${room.name}]];
                var roomId = [[${room.roomId}]];
                var username = [[${#authentication.principal.username}]];

                console.log(roomName + ", " + roomId + ", " + username);

                var sockJs = new SockJS("/stomp/chat");
                //1. SockJSë¥¼ ë´ë¶ì ë¤ê³ ìë stompë¥¼ ë´ì´ì¤
                var stomp = Stomp.over(sockJs);

                //2. connectionì´ ë§ºì´ì§ë©´ ì¤í
                stomp.connect({}, function (){
                   console.log("STOMP Connection")

                   //4. subscribe(path, callback)ì¼ë¡ ë©ì¸ì§ë¥¼ ë°ì ì ìì
                   stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                       var content = JSON.parse(chat.body);

                       var writer = content.writer;
                       var str = '';

                       if(writer === username){
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-secondary'>";
                           str += "<b>" + writer + " : " + message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }
                       else{
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-warning'>";
                           str += "<b>" + writer + " : " + message + "</b>";
                           str += "</div></div>";
                           $("#msgArea").append(str);
                       }

                       $("#msgArea").append(str);
                   });

                   //3. send(path, header, message)ë¡ ë©ì¸ì§ë¥¼ ë³´ë¼ ì ìì
                   stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
                });

                $("#button-send").on("click", function(e){
                    var msg = document.getElementById("msg");

                    console.log(username + ":" + msg.value);
                    stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
                    msg.value = '';
                });
            });
        </script>