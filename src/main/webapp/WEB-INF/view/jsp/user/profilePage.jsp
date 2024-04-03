<%--
  Created by IntelliJ IDEA.
  User: 82106
  Date: 2024-04-02
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .dropdown-toggle::after {
            display: none; /* 화살표 숨기기 */
        }
        .btn:hover{
            background-color: rgb(222, 222, 222);
        }
    </style>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">

<!-- Example Code -->

<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
        <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">김</text></svg></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <li>
            <button type="button" class="btn dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal">
                프로필 보기
            </button>
        </li>
        <li><a class="dropdown-item" href="#">1:1채팅</a></li>
    </ul>
</div>

<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <div class="col-md-auto p-3">
                        <img class="rounded-circle border center" src="https://hola-post-image.s3.ap-northeast-2.amazonaws.com/default.PNG" alt="user avatar" width="100" height="100">
                    </div>
                    <div class="row">
                        <h3 class="font-weight text-center">김용환</h3>
                        <div class="container text-center">
                            <div class="row justify-content-center g-2">
                                <div class="col-md-auto">
                                    <p class="text-primary">PM</p>
                                </div>
                                <div class="col-md-auto">
                                    <p class="text-danger">2년차</p>
                                </div>
                            </div>
                            <div class="row justify-content-center g-2">
                                <div class="col-md-auto">
                                    <p class="text-success">관심 스택</p>
                                </div>
                                <div class="col-md-auto">
                                    <span class="text-warning border border-1 p-1 p rounded-pill">JAVA</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 p-5 text-center">
                            Hi !
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>