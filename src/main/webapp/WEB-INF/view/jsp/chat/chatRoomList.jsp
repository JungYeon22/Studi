<%--
  Created by IntelliJ IDEA.
  User: KTJ
  Date: 2024-04-15
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>채팅방 목록</title>
</head>
<body>

<h1>채팅방 목록</h1>

<c:if test="${not empty chatRoomList}">
    <ul>
        <c:forEach var="chatRoom" items="${chatRoomList}">
            <li>
                <a href="/chat/room/${chatRoom.chatRoomNo}">${chatRoom.title}</a>
                <!-- 각 채팅방의 제목과 해당 채팅방에 입장할 수 있는 링크를 제공 -->
            </li>
        </c:forEach>
    </ul>
</c:if>

<c:if test="${empty chatRoomList}">
    <p>현재 생성된 채팅방이 없습니다.</p>
    <!-- 채팅방이 없는 경우 해당 메시지를 표시 -->
</c:if>
<div class="border border-primary-subtle rounded p-3">
    <div>
        <h2 class="accordion-header">
            <button type="button" id="createChatBtn">
                채팅방 생성
            </button>
        </h2>

    </div>
<script>
    const button = document.querySelector('#createChatBtn');
    button.addEventListener('click', function() {
        // 이동할 URL 지정
        const url = '/openChatRoom';

        // 지정된 URL로 이동
        location.href = url;
    });
</script>
</body>
</html>