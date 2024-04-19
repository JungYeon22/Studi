$(function(){
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
            const name = document.getElementById('name').value;
            const phone = document.getElementById('phone').value;
            const email = document.getElementById('email').value;

            fetch('/user/checkUserId', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({userId: userId,
                    name: name,
                    phone: phone,
                    email: email})
            })
                .then(response => response.json())
                .then((data) => {
                    if (data.isDuplicate) {
                        alert('아이디가 중복됩니다. 다른 아이디를 입력해주세요.');
                        isUserIdChecked = false; // 중복된 ID이므로 체크 플래그를 false로 설정
                        document.getElementById('registerBtn').disabled = true; // 가입 완료 버튼 비활성화

                    } else {
                        alert('사용 가능한 아이디입니다.');
                        isUserIdChecked = true; // 유효한 ID이므로 체크 플래그를 true로 설정
                        document.getElementById('registerBtn').disabled = false; // 가입 완료 버튼 활성화
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
    function updateArrayParam() {
        var array = []; // 배열 선언
        $('input:checkbox[name=skill]:checked').each(function() {
            array.push(this.value);
        });
        $("#arrayParam").val(array.join(','));
    }

    $(document).ready(function() {
        $("#registerBtn").click(function(e) {
            e.preventDefault(); // 폼 서브미션을 막음
            const userId = document.getElementById('id').value;
            const name = document.getElementById('name').value;
            const phone = document.getElementById('phone').value;
            const email = document.getElementById('email').value;

            fetch('/user/checkUserId', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({userId: userId,
                    name: name,
                    phone: phone,
                    email: email})
            })
                .then(response => response.json())
                .then((data) => {
                    if (data.isBan) {
                        alert('신고로 인한 추방으로 회원가입이 제한됩니다.');
                        isUserIdChecked = false; // 중복된 ID이므로 체크 플래그를 false로 설정
                        location.reload(); // 가입 완료 버튼 비활성화
                    }
                    else{$('#exampleModalToggle').modal('show');}
                });
            // 모달 창 보이기

        });

        $("#moadl1").click(function(e) {
            updateArrayParam();
        });
        $('input:checkbox[name=skill]').change(function () {
            updateArrayParam();
        });
        console.log($('#arrayParam').val())

        $('#exampleModalToggle3').on('hidden.bs.modal', function () {
            $('#writeForm').submit();

            $.ajax({
                type: "POST",
                url: "/user/writeForm/introduce",
                data: {
                    name: $('#name').val(),
                    userId: $('#id').val(),
                    position: $('#position').val(),
                    career: $('#career').val(),
                    introduce: $('#introduce').val(),
                    skill:$('#arrayParam').val()
                },
                success: function(data) {
                    console.log(data);
                },
                error: function(e) {
                    console.error(e);
                }
            });
        });
    });
});