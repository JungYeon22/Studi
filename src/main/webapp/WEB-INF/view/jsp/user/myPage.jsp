<%--
  Created by IntelliJ IDEA.
  User: 82106
  Date: 2024-04-02
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <style>

        .btn:hover{
            background-color: rgb(222, 222, 222);
        }
        nav {
            display: inline-block;
            height: 70px;
            text-align: right;

        }

    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example">

<hr/>
<!-- ########################################################################################################################### -->
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2>마이 페이지</h2>
        </div>

        <div class="row">
            <div class="col-md-6"> <!-- 왼쪽 영역 -->
                <h4 class="mb-3">나의 정보
                    <button class="btn btn-primary btn-sm" type="submit">수정</button>
                </h4>
                <div class="border border-primary-subtle rounded p-3">
                    <div class="mb-3">
                        <div class="row align-items-center">
                            <div class="col-md-auto">
                                <svg class="rounded-circle border" width="64" height="64" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <rect width="64" height="64" fill="hsl(15, 100%, 90%)"></rect>
                                    <text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">김</text>
                                </svg>
                            </div>
                            <div class="col">
                                <p class="mb-0">김용환</p>
                                <p class="mb-0">k55183@naver.com</p>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-lg-3"> <!-- 왼쪽 열 -->
                            <p class="col mb-2">닉네임</p>
                            <p class="col mb-2">소셜 로그인</p>
                            <p class="col mb-2">이메일</p>
                            <p class="col mb-2">직업</p>
                            <p class="col mb-2">경력</p>
                            <p class="col mb-2">관심 스택</p>
                            <p class="col mb-2">자기소개</p>
                        </div>
                        <div class="col"> <!-- 오른쪽 열 -->
                            <p class="col mb-2">김용환</p>
                            <p class="col mb-2">Kakao</p>
                            <p class="col mb-2">k55183@naver.com</p>
                            <p class="col mb-2">PM</p>
                            <p class="col mb-2">2년차</p>
                            <p class="col mb-2">JAVA</p>
                            <p class="col mb-2">Hi !</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6"> <!-- 오른쪽 영역 -->
                <h4 class="mb-3">
                    <span class="text-primary">스크랩</span>
                    <span class="badge bg-primary rounded-pill">3</span>
                </h4>
                <div class="border border-primary-subtle rounded p-3">
                    <div>
                        <div class="accordion accordion-flush" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        모두보기
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">J</text></svg></span>
                                        <label for="email" class="form-label">강남역 오전 모각코 모집합니다</label>
                                        <p class="text-truncate" style="max-width: 1000px;">[개발 스터디 모집 내용 예시] 스터디 주제 : 오전 시간 활용해서 부지런한 하루하루 보내기 스터디 목표 : 오전 시간 활용하기! 예상 스터디 일정(횟수) : 주 5회 8시반~9시반, 강남역 할리스 예상 커리큘럼 간략히 : 예상 모집인원 : 3명 스터디 소개와 개설 이유 : 오전 시간 활용하고 건강한 생활습관 형성하고 싶어서 스터디 관련 주의사항 : 1</p>
                                        <button class="btn btn-secondary btn-sm">스터디</button>
                                        <hr>
                                        <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">J</text></svg></span>
                                        <label for="email" class="form-label">강남역 오전 모각코 모집합니다</label>
                                        <p class="text-truncate" style="max-width: 1000px;">[개발 스터디 모집 내용 예시] 스터디 주제 : 오전 시간 활용해서 부지런한 하루하루 보내기 스터디 목표 : 오전 시간 활용하기! 예상 스터디 일정(횟수) : 주 5회 8시반~9시반, 강남역 할리스 예상 커리큘럼 간략히 : 예상 모집인원 : 3명 스터디 소개와 개설 이유 : 오전 시간 활용하고 건강한 생활습관 형성하고 싶어서 스터디 관련 주의사항 : 1</p>
                                        <button class="btn btn-secondary btn-sm">스터디</button>
                                        <hr>
                                        <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">J</text></svg></span>
                                        <label for="email" class="form-label">강남역 오전 모각코 모집합니다</label>
                                        <p class="text-truncate" style="max-width: 1000px;">[개발 스터디 모집 내용 예시] 스터디 주제 : 오전 시간 활용해서 부지런한 하루하루 보내기 스터디 목표 : 오전 시간 활용하기! 예상 스터디 일정(횟수) : 주 5회 8시반~9시반, 강남역 할리스 예상 커리큘럼 간략히 : 예상 모집인원 : 3명 스터디 소개와 개설 이유 : 오전 시간 활용하고 건강한 생활습관 형성하고 싶어서 스터디 관련 주의사항 : 1</p>
                                        <button class="btn btn-secondary btn-sm">스터디</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h4 class="mb-3 mt-3">
                    <span class="text-primary">작성한 글</span>
                    <span class="badge bg-primary rounded-pill">0</span>
                    <button class="btn btn-primary btn-sm" type="submit">새글쓰기</button>
                </h4>
                <div class="border border-primary-subtle rounded p-3">
                    <div class="d-grid gap-2">
                        <button class="btn btn-outline-*" >모두보기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<!-- ######################################################### -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" ></script>
</body>
</html>