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
    <title>비밀번호 찾기</title>
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

            <%-- 에러 메시지 표시 --%>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>


            <%--  로그인 성공시 해당 url로 이동 --%>
            <form class="findIdForm" action="${pageContext.request.contextPath}/user/findPwdForm" method="post" novalidate>
                <div class="mb-3">
                    <label for="email" style="margin-bottom: 6px">이메일</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" style="margin-bottom: 30px" required>
                    <div class="invalid-feedback"></div>
                </div>

                <div class="form-group">
                    <label for="email">인증번호 받기</label>
                    <input class="form-control" placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" style="margin-top: 10px" disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
                    <div style="display: block; text-align: right; margin: 10px">
                        <input type="button" value="인증번호 발급" class="btn btn-primary" id="emailAuthPwd">
                    </div>
                    <span id="emailAuthWarn"></span>
                </div>

                <div class="d-grid gap-2">
                    <button class="btn btn-outline-dark" type="submit" id="findPwdBtn" disabled>비밀번호 찾기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<br>
<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>

<script>
    $(function () {
        window.addEventListener('load', () => {
            //인증하기 버튼을 눌렀을 때 동작
            $("#emailAuthPwd").click(function () {
                const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기

                //Ajax로 전송
                $.ajax({
                    url: '/user/EmailAuthPwd',
                    data: {
                        email: email
                    },
                    type: 'POST',
                    dataType: 'json',
                    success: function (result) {
                        console.log("result : " + result);
                        $("#authCode").attr("disabled", false);
                        code = result;
                        alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
                    },
                    error: function (result) {
                        alert("이메일 전송이 실패하였습니다.");
                    }
                }); //End Ajax
            });

            //인증 코드 비교
            $("#authCode").on("focusout", function () {
                const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기

                console.log("입력코드 : " + inputCode);
                console.log("인증코드 : " + code);

                if (Number(inputCode) === code) {
                    $("#emailAuthWarn").html('인증번호가 일치합니다.');
                    $("#emailAuthWarn").css('color', 'green');
                    $('#emailAuth').attr('disabled', true);
                    $('#email').attr('readonly', true);
                    $("#findPwdBtn").attr("disabled", false);
                } else {
                    $("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
                    $("#emailAuthWarn").css('color', 'red');
                    $("#findPwdBtn").attr("disabled", true);
                }
            });
        });
    });
</script>