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
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardInput.css">
    <style>

        .btn:hover{
            background-color: rgb(222, 222, 222);
        }
        nav {
            display: inline-block;
            height: 70px;
            text-align: right;
        }
        #search .background-image:hover{
            cursor: pointer;
        }

    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example">
<form id="projectInputForm" style="margin-top: 70px" >
<%@ include file="../include/header.jsp"%>
<!-- ########################################################################################################################### -->
<div class="container">
    <div>
        <div class="py-5 text-center">
            <h2>나의 프로젝트</h2>
        </div>

        <div class="row">
            <div class="col-md-6"> <!-- 왼쪽 영역 -->
                <h4 class="mb-3">나의 프로젝트 정보

                </h4>
                <div class="border border-primary-subtle rounded p-3">
                    <div class="mb-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <p class="mb-0">python능력자 구합니다!</p>
                                <p class="mb-0">같이 프로젝트를 이끌어가실 5분구해용 </p>

                            </div>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-lg-3"> <!-- 왼쪽 열 이름 -->
                            <h4>이름</h4>
                            <div class="col mb-2">김태진</div><hr>
                            <div class="col mb-2">박정연</div><hr>
                            <div class="col mb-2">김용환</div><hr>
                            <div class="col mb-2">이동우</div><hr>
                            <div class="col mb-2">최교순</div>
                        </div>
                        <div class="col-lg-3"> <!-- 왼쪽 열 이름 -->
                            <h4>기술스택</h4>
                            <div class="col mb-2"> python, C</div><hr>
                            <div class="col mb-2"> C, C++</div><hr>
                            <div class="col mb-2"> C, C#</div><hr>
                            <div class="col mb-2"> javascript, python</div><hr>
                            <div class="col mb-2"> C, java</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div >
</form style="margin-bottom: 200px">
<%@ include file="../include/footer.jsp"%>

<!-- ######################################################### -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
</body>
</html>