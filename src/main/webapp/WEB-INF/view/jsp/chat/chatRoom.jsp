<%--
  Created by IntelliJ IDEA.
  User: KTJ
  Date: 2024-04-15
  Time: 오후 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>채팅방</title>
</head>
<body>

<h2>채팅방 ${chatRoomNo}</h2>

<%-- 채팅 메시지 목록 출력 --%>
<ul>
    <c:forEach items="${list}" var="message">
        <li>${message.senderName} (${message.createDate}): ${message.message}</li>
    </c:forEach>
</ul>

<%-- 여기에 메시지를 입력하는 폼을 추가할 수 있습니다. --%>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/socket/socket.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    const memberNO = "${loginMember.memberNO}";
    const memberName = "${loginMember.memberName}";
    const contextPath = "${contextPath}";
    const chatRoomNO = "${loginMember.chatRoomNO}";

    let chattingSock = new SockJS(contextPath+"/chat");
    document.getElementById("send").addEventListener("click", sendMessage);

    function sendMessage(){
        const myChat = document.getElementById("myChat");

        if(myChat.value.trim().length == 0){
            alert("채팅을 입력해주세요");

            myChat.value = "";
            myChat.focus();
        }//if
        else{
            const chatMessage = {
                "memberNO" : memberNO,
                "memberName" : memberName,
                "chatRoomNo" : chatRoomNO,
                "message" : myChat.value
            };
        }//else
    }
</script>
</body>
</html>
