<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-04-05
  Time: 오후 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅 폼
    </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }

        .chat-container {
            width: 630px;
            height: 570px;
            /* margin: 50px auto; */
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .chat-header {
            padding: 15px;
            border-bottom: 1px solid #eee;
            background-color: #2c3398;
            color: white;
            font-size: 18px;
            text-align: center;
        }

        .chat-messages {
            padding: 20px;
            height: 380px;
            overflow-y: scroll;
            background-color: #b0d1ec;
        }

        .message {
            margin-bottom: 15px;
            max-width: 70%;
            display: inline-block;
            padding: 10px 15px;
            border-radius: 10px;
            font-size: 16px;
        }

        .message.sent {
            background-color: #DCF8C6;
            float: right;
        }

        .message.received {
            background-color: #EAEAEA;
            float: left;
        }

        .message p {
            margin: 5px 0;
        }

        .chat-input {
            padding: 15px;
            border-top: 1px solid #e0e2f7;
            background-color: #b0d1ec;
            width: 630px;
        }

        .chat-input input[type="text"] {
            width: calc(100% - 50px);
            padding: 10px;
            border: 1px solid #ffffff;
            border-radius: 20px;
            outline: none;
        }

        .chat-input button {
            width: 50px;
            height: 50px;
            background-color: #f6ff00;
            color: black;
            border: none;

            cursor: pointer;
            margin-left: 10px;
        }
        #message-input{
            width: 500px;
            height: 25px;
        }

        span{
            font-size: 2em;
        }
        #messageBtn{
            margin-top: 5px;
        }
        #message-input{
            height: 40px;
        }
    </style>
</head>
<body>
<div class="chat-container">
    <div class="chat-header">교순씨의 은밀한 채팅방</div>
    <div class="chat-messages" id="chat-messages">
        <!-- 채팅 메시지가 여기에 추가됩니다. -->
    </div>
    <div  class="chat-input">
        <input type="text" id="message-input" placeholder="메시지를 입력하세요...">
        <button id="messageBtn" onclick="sendMessage()"><span>▶</span></button>
    </div>
</div>

<script>
    function sendMessage() {
        var messageInput = document.getElementById('message-input');
        var message = messageInput.value.trim();

        if (message !== '') {
            var chatMessages = document.getElementById('chat-messages');
            var messageElement = document.createElement('div');
            messageElement.classList.add('message', 'sent');
            messageElement.innerHTML = '<p>' + message + '</p>';
            chatMessages.appendChild(messageElement);

            // 메시지 전송 후 입력창 초기화
            messageInput.value = '';

            // 채팅창을 항상 가장 아래로 스크롤
            // chatMessages.scrollTop = chatMessages.scrollHeight;

            // 상대방이 답장하도록 하는 예시
            setTimeout(function() {
                var replyMessageElement = document.createElement('div');
                replyMessageElement.classList.add('message', 'received');
                replyMessageElement.innerHTML = '<p>최교슌....박정연의 러브스토리....</p>';
                chatMessages.appendChild(replyMessageElement);
                chatMessages.scrollTop = chatMessages.scrollHeight;
            }, 1000);
        }
    }
</script>
</body>
</html>
