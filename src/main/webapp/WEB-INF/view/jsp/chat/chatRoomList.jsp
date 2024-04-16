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
                <a href="<c:url value='/chat/chatRoom/${chatRoom.chatRoomNo}' />">${chatRoom.title}</a>
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
            <input type="text" id="userId" value="${sessionScope.UserDTO.getUserId}">
            <button type="button" class="createChatBtn">
                채팅방 생성
            </button>
        </h2>
    </div>
</div>
<script>
    var contextPath = "<%= request.getContextPath() %>";
</script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
    $(document).ready(function() {
        $('.createChatBtn').on('click', function() {
            var title = prompt("채팅방 제목을 입력하세요:");
            if (title !== null && title.trim() !== "") {
                console.log("전달된 제목:", title); // 콘솔에 제목 값 출력
                var encodedTitle = encodeURIComponent(title);
                // contextPath 변수를 사용하여 URL 구성
                var url = contextPath + '/chat/openChatRoom?title=' + encodedTitle;
                $.ajax({
                    method: 'GET',
                    url: url,
                    success: function(response) {
                        if (response.success) {
                            // 채팅방 번호를 받아옵니다.
                            var chatRoomNo = response.chatRoomNo;
                            // 생성된 채팅방으로 이동합니다.
                            location.href = '/chat/chatRoom' + chatRoomNo;
                        } else {
                            alert('실패');

                        }
                    },
                    error: function(xhr, status, error) {
                        alert('서버 오류가 발생했습니다.');
                    }
                });
            } else {
                alert("채팅방 제목을 입력해주세요.");
            }
        });
    });
</script>
</body>
</html>