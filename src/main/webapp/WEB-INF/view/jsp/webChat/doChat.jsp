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
    <title>Document</title>
</head>
<body>
<input type="button" value="프로젝트 팀채팅" style="width: 150px; height: 80px;"
       onclick="new_window();"/>
<script>
    function new_window() {
        window.open(
            "chatForm/",
            "chatForm",
            "width=650, height=580, top=0, left=0"
        );
    }
</script>
</body>
</html>
