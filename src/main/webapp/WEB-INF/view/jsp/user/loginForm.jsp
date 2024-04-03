<%--
  Created by IntelliJ IDEA.
  User: jungyeon
  Date: 2024-03-26
  Time: 오후 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head class="navbar navbar-expand-lg bd-navbar sticky-top">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>
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
                <form class="login-form" novalidate>
                    <div class="mb-3">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" placeholder="아이디" required >
                        <div class="invalid-feedback">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="password">비밀번호</label>
                        <input type="text" class="form-control" id="password" placeholder="비밀번호" required>
                        <div class="invalid-feedback">
                        </div>

                        <a type="button" class="find"><span>아이디·비밀번호 찾기</span></a><br>
                    </div><br>
                    <div class="d-grid gap-2">
                        <button class="btn btn-outline-dark" type="button" id="lobtn">로그인</button>
                    </div>
                    <div class="d-grid gap-2" style="margin-top: 10px;">
                        <button class="btn btn-outline-dark" type="button" id="writebtn">회원가입</button>
                    </div>
                </form>
                <hr>

                <form class="social-login-form" novalidate>
                    <p>
                        <a type="button" onclick="" >
                            <img src="/image/free-icon-kakao-talk-3669973.png"  alt="..." width="50" height="50">
                        </a>
                        <a type="button" onclick="" >
                            <img src="/image/btnG_아이콘사각.png" alt="..."  width="50" height="50">
                        </a>
                        <a type="button" onclick="" >
                            <img src="/image/free-icon-search-281764.png" alt="..."  width="50" height="50">
                        </a>
                        <a type="button" onclick="" >
                            <img src="/image/git.png" alt="..."  width="50" height="50">
                        </a>
                    </p>
                </form>
            </div>
        </div>
    </div>
<br>
                <%@include file="../include/footer.jsp"%>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>
