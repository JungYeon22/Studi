<%--
  Created by IntelliJ IDEA.
  User: KTJ
  Date: 2024-04-11
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>doChat</title>
</head>
<body>
<input type="button" id="chatBtn" class="chatBtn" value="채팅하기" style="width: 100px; height: 50px"></input>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    // 버튼 클릭 시 파일 선택 창 열기
    document.getElementById('chatBtn').addEventListener('click', function() {
        // 페이지 이동
        window.location.href = 'http://localhost:3000';
    });

</script>
</body>
</html>