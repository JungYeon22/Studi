<%--
  Created by IntelliJ IDEA.
  User: jungyeon
  Date: 2024-03-26
  Time: 오후 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head class="navbar navbar-expand-lg bd-navbar sticky-top">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/loginForm.css">

</head>
<body>
<%@ include file="../include/header.jsp"%>

<div class="container">
    <div class="input-form-background row">

        <div class="input-form col-md-12 mx-auto">

            <div id="loginBoxTitle"><img src="/image/sutdi.png" width="130" height="90"></div>

            <%-- 사용자 정보가 전달된 경우 표시 --%>
            <%--<c:if test="${not empty user}">
                <p>사용자 이름: ${user.name}</p>
                <p>사용자 이메일: ${user.email}</p>
            </c:if>--%>

            <%-- 에러 메시지 표시 --%>
            <c:if test="${not empty error}">
                <p>${error}</p>
            </c:if>

            <%--            변경 해봄--%>
            <%--  로그인 성공시 해당 url로 이동 --%>
            <form class="login-form" action="${pageContext.request.contextPath}/user/findPwd" method="post" novalidate>
                <div class="mb-3">
                    <label for="name" style="margin-bottom: 6px">이름</label>
                    <input type="text" class="form-control" id="name" value="${userDTO.name}" style="margin-bottom: 30px" disabled required>
                    <div class="invalid-feedback"></div>

                    <label for="pwd" style="margin-bottom: 6px">비밀번호</label>
                    <input type="text" class="form-control" id="pwd" value="${userDTO.pwd}" style="margin-bottom: 30px" disabled required>
                    <div class="invalid-feedback"></div>
                </div>

                <div class="d-grid gap-2">
                    <button class="btn btn-outline-dark" type="button" id="writebtn" onclick="location.href='loginForm' ">로그인으로 이동하기</button>
                </div>
            </form>

        </div>
    </div>
</div>
<br>
<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
