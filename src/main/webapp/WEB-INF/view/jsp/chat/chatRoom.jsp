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

    <style>
        * {
            box-sizing: border-box;
        }
        .msgLine {
            margin: 15px;
        }
        .msgBox {
            border: 1.5px solid black;
            background: white;
            padding: 2px 5px;
            border-radius: 10px;
        }
        .msgName{
            font-weight: bold;
            color: black;
        }
        #chatContent {
            border: 1px solid #000;
            width: 600px;
            height: 400px;
            margin-bottom: 10px;
            overflow-y: auto;
        }
        #myChat {
            width: 400px;
            height: 32px;
            border-radius: 8px;
        }
        #send {
            width: 200px;
            height: 34px;
            border-radius: 50px;
            background: black;
            color: white;
        }
    </style>
</head>
<body>

<h2>채팅방 ${title }</h2>

<%-- 채팅 메시지 목록 출력 --%>
<%--<ul>--%>
<%--    <c:forEach items="${list}" var="message">--%>
<%--        <li>${message.senderName} (${message.createDate}): ${message.message}</li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>

<%-- 여기에 메시지를 입력하는 폼을 추가할 수 있습니다. --%>
<div id="chatContent"></div>
<input id="myChat" type="text">
<button id="send">전송</button>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
    // Get contextPath for WebSocket connection
    const contextPath = '<c:url value="/" />';

    // Create a WebSocket connection to the server
    const chattingSock = new SockJS(`${contextPath}/chatRoom`);

    chattingSock.onopen = function() {
        console.log('WebSocket connection established');
    };

    // Add event listener to the "send" button
    document.getElementById("send").addEventListener("click", sendMessage);

    // Function to send a message
    function sendMessage() {
        const myChat = document.getElementById("myChat");

        if (myChat.value.trim().length === 0) {
            alert("채팅을 입력해주세요");
            myChat.value = "";
            myChat.focus();
        } else {
            // Example values for memberNO and chatRoomNO, replace them with appropriate values
            const memberNO = 123;
            const chatRoomNO = 456;

            // Create a chat message object
            const chatMessage = {
                "memberNO": memberNO,
                //"memberName": memberName,
                "chatRoomNo": chatRoomNO,
                "message": myChat.value
            };

            // Convert the chat message object to JSON string
            const jsonMessage = JSON.stringify(chatMessage);

            // Send the JSON-formatted message to the server
            chattingSock.send(jsonMessage);

            // Clear the input field after sending the message
            myChat.value = "";

            // Focus back on the input field
            myChat.focus();
        }
    }
</script>
</body>
</html>