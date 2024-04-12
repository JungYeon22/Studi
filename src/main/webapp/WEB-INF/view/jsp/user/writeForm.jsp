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
            <div id="loginBoxTitle"><img src="/image/sutdi.png" width="130" height="90" onclick="location.href='/'"></div>
            <br>
            <form class="validation-form" action="/user/writeForm" method="post" novalidate>
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
                        <input type="text" class="form-control" id="password" placeholder="비밀번호" name="pwd" value="" required>
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
                <button type="submit" id="registerBtn" class="btn btn-outline-dark btn-lg" disabled="disabled" >가입 완료</button>
                <p class="write-login"> 이미 studi 회원이신가요? <a type="button" id="relogin" onclick="location.href='loginForm' ">로그인</a></p>
            </form>
        </div>
    </div>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; studi</p>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>


    window.addEventListener('load', () => {

        // 비밀번호 유효성 검사
        document.getElementById('password').addEventListener('input', function (event) {
            const passwordRegex = /^[A-Za-z\d]{8,12}$/; // 8자리에서 12자리 사이의 영문자와 숫자만 허용
            const feedback = document.getElementById('password').nextElementSibling;

            if (!passwordRegex.test(event.target.value)) {
                event.target.setCustomValidity("비밀번호는 8자리에서 12자리 사이여야 합니다");
                feedback.textContent = "비밀번호는 8자리에서 12자리 사이여야 합니다";
            } else {
                event.target.setCustomValidity('');
                feedback.textContent = "비밀번호를 입력해주세요";
            }
        });

        // 핸드폰 번호 유효성 검사
        document.getElementById('phone').addEventListener('input', function (event) {
            const phoneRegex = /^\d{11}$/; // 정확히 11자리의 숫자만 허용
            const feedback = document.getElementById('phone').nextElementSibling;

            if (!phoneRegex.test(event.target.value)) {
                event.target.setCustomValidity("잘못된 번호입니다");
                feedback.textContent = "잘못된 번호입니다";
            } else {
                event.target.setCustomValidity('');
                feedback.textContent = "핸드폰 번호를 입력해주세요";
            }
        });

        // 이메일 유효성 검사
        /*document.getElementById('email').addEventListener('input', function (event) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const feedback = document.getElementById('email').nextElementSibling;

            if (!emailRegex.test(event.target.value)) {
                event.target.setCustomValidity("잘못된 이메일 형식입니다");
                feedback.textContent = "잘못된 이메일 형식입니다";
            } else {
                event.target.setCustomValidity('');
                feedback.textContent = "이메일을 입력해주세요";
            }
        });*/
    });

        //인증하기 버튼을 눌렀을 때 동작
        $("#emailAuth").click(function () {
        const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기

        //Ajax로 전송
        $.ajax({
            url : '/user/EmailAuth',
            data : {
                email : email
            },
            type : 'POST',
            dataType : 'json',
            success : function(result) {
                console.log("result : " + result);
                $("#authCode").attr("disabled", false);
                code = result;
                alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
            },
            error : function (result) {
                alert("이메일 전송이 실패하였습니다.");
            }
        }); //End Ajax
    });

    //인증 코드 비교
    $("#authCode").on("focusout", function() {
        const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기

        console.log("입력코드 : " + inputCode);
        console.log("인증코드 : " + code);

        if(Number(inputCode) === code){
            $("#emailAuthWarn").html('인증번호가 일치합니다.');
            $("#emailAuthWarn").css('color', 'green');
            $('#emailAuth').attr('disabled', true);
            $('#email').attr('readonly', true);
            $("#registerBtn").attr("disabled", false);
        }else{
            $("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
            $("#emailAuthWarn").css('color', 'red');
            $("#registerBtn").attr("disabled", true);
        }
    });

            // 비밀번호와 비밀번호 재확인이 일치하는지 여부
            window.addEventListener('load', () => {
            document.getElementById('repassword').addEventListener('input', function (event) {
                const password = document.getElementById('password').value;
                const confirmPassword = event.target.value;
                const feedback = event.target.nextElementSibling;

                if (password !== confirmPassword) {
                    event.target.setCustomValidity("비밀번호가 서로 일치하지 않습니다.");
                    feedback.textContent = "비밀번호가 서로 일치하지 않습니다.";
                } else {
                    event.target.setCustomValidity('');
                    feedback.textContent = "비밀번호를 입력해주세요";
                }
            });
        }, false);

            // validation 검사
            // 테스트할때 불편하니깐 이 영역만 주석처리하고 테스트
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

            // 중복 ID 체크 플래그 선언
            let isUserIdChecked = false;

            window.addEventListener('load', () => {
            document.getElementById('check-id').addEventListener('click', function () {
                const userId = document.getElementById('id').value;

                fetch('/user/checkUserId', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({userId: userId})
                })
                    .then(response => response.json())
                    .then((data) => {
                        if (data.isDuplicate) {
                            alert('아이디가 중복됩니다. 다른 아이디를 입력해주세요.');
                            isUserIdChecked = false; // 중복된 ID이므로 체크 플래그를 false로 설정
                            document.getElementById('submit-button').disabled = true; // 가입 완료 버튼 비활성화
                        } else {
                            alert('사용 가능한 아이디입니다.');
                            isUserIdChecked = true; // 유효한 ID이므로 체크 플래그를 true로 설정
                            document.getElementById('submit-button').disabled = false; // 가입 완료 버튼 활성화
                        }
                    })
                    /*.catch(error => {
                        console.error('Error:', error);
                        alert('오류가 발생했습니다. 나중에 다시 시도해주세요.');
                    });*/
            });

            document.getElementsByClassName('validation-form')[0].addEventListener('submit', function(event) {
            // 폼 제출 시 중복 ID 체크가 완료되었는지 확인
            if (!isUserIdChecked) {
            event.preventDefault(); // 중복 체크가 되지 않았다면 폼 제출 방지
            alert('아이디 중복 확인이 필요합니다.');
        }
        });


            // 우편번호 api
            const elZonecode = document.querySelector("#zonecode");
            const elRoadAddress = document.querySelector("#roadAddress");
            const elRoadAddressDetail = document.querySelector("#roadAddressDetail");
            const elResults = document.querySelectorAll(".el_result");
            // 주소검색창 열기 함수
            const onClickSearch = () => {
            new daum.Postcode({
            oncomplete: function (data) {
            elZonecode.value = data.zonecode;
            elRoadAddress.value = data.address;
        },
        }).open();
        };
            const register = () => {
            console.log(`우편번호: ${elZonecode.value}`);
            console.log(`주소: ${elRoadAddress.value}`);
            console.log(`상세주소: ${elRoadAddressDetail.value}`);
        };
            elRoadAddressDetail.addEventListener("change", (e) => {
            elRoadAddressDetail.value = e.target.value;
        });
            document.querySelector("#addrbutton").addEventListener("click", onClickSearch);
        });

</script>
</body>
</html>
