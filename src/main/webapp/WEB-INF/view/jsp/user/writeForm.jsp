<%--
  Created by IntelliJ IDEA.
  User: jungyeon
  Date: 2024-03-26
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
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
            <div id="loginBoxTitle"><img src="/image/sutdi.png" width="130" height="90"></div>
            <br>
            <form class="validation-form" novalidate>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" placeholder="이름입력" value="" required>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" placeholder="아이디입력" value="" required>
                        <div class="invalid-feedback">
                            아이디를 입력해주세요.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="password">비밀번호</label>
                        <input type="text" class="form-control" id="password" placeholder="비밀번호" value="" required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="repassword">비밀번호 재확인</label>
                        <input type="text" class="form-control" id="repassword" placeholder="비밀번호 재확인" value="" required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="phone">핸드폰</label>
                    <input type="phone" class="form-control" id="phone" placeholder="-없이 입력" required>
                    <div class="invalid-feedback">
                        핸드폰 번호를 입력해주세요.
                    </div>
                </div>

                <div>
                    <label for="skill">기술스택</label><br>
                    <div class="skill1">
                        <input type="checkbox" class="form-check-input" id="c"  autocomplete="off">
                        <label class="btn" for="c">C</label>
                        <input type="checkbox" class="form-check-input" id="c#"  autocomplete="off">
                        <label class="btn" for="c#">C#</label>
                        <input type="checkbox" class="form-check-input" id="cpp"  autocomplete="off">
                        <label class="btn" for="cpp">C++</label>
                        <input type="checkbox" class="form-check-input" id="python"  autocomplete="off">
                        <label class="btn" for="python">Python</label>
                        <input type="checkbox" class="form-check-input" id="java"  autocomplete="off">
                        <label class="btn" for="java">JAVA</label>
                        <input type="checkbox" class="form-check-input" id="javascript"  autocomplete="off">
                        <label class="btn" for="javascript">javascript</label>
                    </div>
                    <div class="skill2">
                        <input type="checkbox" class="form-check-input" id="kotlin"  autocomplete="off">
                        <label class="btn" for="kotlin">kotlin</label>
                        <input type="checkbox" class="form-check-input" id="go"  autocomplete="off">
                        <label class="btn" for="go">Go</label>
                        <input type="checkbox" class="form-check-input" id="mysql"  autocomplete="off">
                        <label class="btn" for="mysql">MySQL</label>
                        <input type="checkbox" class="form-check-input" id="oracle"  autocomplete="off">
                        <label class="btn" for="oracle">Oracle</label>
                    </div>
                </div>



                <div class="mb-4">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" placeholder="you@email.com" required>
                    <div class="invalid-feedback">
                        이메일을 입력해주세요.
                    </div>
                </div>


                <div class="col-md-6 mb-3">
                    <label for="address">주소</label><br>
                    <div>
                        <input type="text"   id="zipcode" placeholder="135-152" disabled/>
                        <button type="button "class="btn btn-outline-secondary" id="addrbutton"onclick = "">우편번호검색</button>
                    </div>

                    <input type="text"  class="form-control" id="addr1"  placeholder="서울특별시 강남구" style="margin-top: 10px;"/>
                    <input type="text" class="form-control" id="addr2"  placeholder="상세주소"/>
                    <div class="invalid-feedback">
                        주소를 입력해주세요.
                    </div>

                </div>



                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="aggrement" required>
                    <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>

                <div class="mb-4"></div>
                <button type="button" class="btn btn-outline-dark btn-lg">가입 완료</button>
                <p class="write-login"> 이미 studi 회원이신가요? <a type="button" id="relogin">로그인</a></p>
            </form>
        </div>
    </div>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; studi</p>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    }, false);
</script>
</body>
</html>
