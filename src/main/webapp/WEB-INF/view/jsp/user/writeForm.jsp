<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/writeForm.css">


</head>
<body>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <div id="loginBoxTitle"><img src="/image/sutdi.png" width="130" height="90" onclick="location.href='/'"></div>
            <br>
            <form class="validation-form" id="writeForm" action="/user/writeForm" method="post" novalidate>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="이름입력"  value="" required>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 mb-3">
                        <label for="id">아이디</label>
                        <div class="input-group-append">
                            <input type="text" class="form-control" id="id" name="userId" placeholder="아이디입력" value="" style="width: 340px"  required>
                            <button type="button" id="check-id" class="btn btn-outline-secondary" style="margin-left: 20px; width: 110px" >중복확인</button>
                        </div>
                        <div class="invalid-feedback">
                            아이디를 입력해주세요.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="password">비밀번호</label>
                        <input type="password" class="form-control" id="password" placeholder="비밀번호" name="pwd" value="" required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="repassword">비밀번호 재확인</label>
                        <input type="password" class="form-control" id="repassword" placeholder="비밀번호 재확인" value="" required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="phone">핸드폰</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="-없이 입력" required>
                    <div class="invalid-feedback">
                        핸드폰 번호를 입력해주세요.
                    </div>
                </div>


                    <%-- 이미 존재하는 이메일 에러 메시지 --%>
                <c:if test="${not empty emailExistsError}">
                    <div class="alert alert-danger">
                            ${emailExistsError}
                    </div>
                </c:if>

                <div class="form-group">
                    <label for="email">이메일</label>
                    <input class="form-control" placeholder="이메일을 입력해주세요." name="email" id="email" type="email" style="margin-bottom: 20px" autofocus>
                    <input class="form-control" placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" style="margin-top: 20px" disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
                    <div style="display: block; text-align: right; margin: 10px">
                        <input type="button" value="인증번호 발급" class="btn btn-primary" id="emailAuth">
                    </div>
                    <span id="emailAuthWarn"></span>
                </div>

                <div class="col-md-8 mb-3">
                    <label>주소</label><br>
                    <div>
                        <input type="text" id="zonecode" placeholder="135-152" style="height: 35px" disabled/>
                        <button type="button" class="btn btn-outline-secondary" id="addrbutton"  onclick = "">우편번호검색</button>
                        <input type="text"  class="form-control" id="roadAddress"  placeholder="서울특별시 강남구" style="margin-top: 10px;"/>
                        <input type="text" class="form-control" id="roadAddressDetail"  placeholder="상세주소" style="margin-top: 10px;"/>
                    </div>
                </div>

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="agreement" required>
                    <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>


                <div class="mb-4"></div>
                <button type="submit" id="registerBtn" class="btn btn-outline-dark btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" disabled="disabled" >가입 완료</button>
                <p class="write-login"> 이미 studi 회원이신가요? <a type="button" id="relogin" onclick="location.href='loginForm' ">로그인</a></p>
            </form>
        </div>
    </div>
    <%@include file="introWriteModal.jsp"%>

    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; studi</p>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/user/writeForm.js"></script>
</body>
</html>
