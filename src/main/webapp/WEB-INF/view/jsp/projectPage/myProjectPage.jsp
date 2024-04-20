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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/project.css">
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


        * {
            box-sizing: border-box;
        }
        .msgLine {
            margin: 15px;
        }
        .msgBox {
            border: 1.5px solid black;
            background: white;
            padding: 2px 5px;
            border-radius: 10px;
        }
        .msgName{
            font-weight: bold;
            color: black;
        }
        #chatContent {
            border: 1px solid #000;
            width: 600px;
            height: 400px;
            margin-bottom: 10px;
            overflow-y: auto;
        }
        #myChat {
            width: 400px;
            height: 32px;
            border-radius: 8px;
        }
        #send {
            width: 200px;
            height: 34px;
            border-radius: 50px;
            background: black;
            color: white;
        }
        .approveBtn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #ffffff; /* 버튼 배경색 */
            color: #3f3f3f; /* 버튼 텍스트 색상 */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .approveBtn:hover {
            background-color: #0a0e4b; /* 버튼에 호버 시 배경색 변경 */
            color: #f8f9fa;
        }
    </style>

</head>
<body >
<form id="projectInputForm" style="margin-top: 70px" >
    <%@ include file="../include/header.jsp"%>

    <input type="hidden" id="boardId" value="${boardDTO.BOARDID}">
    <button type="button" id="applicationNotiBtn" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#applicationNoti">
        알림 <span class="badge text-bg-secondary">5</span>
    </button>
    <%@include file="applicationListModal.jsp"%>

    <!-- ########################################################################################################################### -->
    <div class="container" style="height: 800px;">
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
                                    <p class="mb-0">${boardDTO.SUBJECT}</p>
                                    <p class="mb-0">같이 프로젝트를 이끌어가실 5분구해용 </p>

                                </div>
                            </div>
                        </div>

                        <hr>

                        <%--<div class="row">
                            <div class="col-lg-3"> <!-- 왼쪽 열 이름 -->
                                <h4>이름</h4>
                                <c:forEach items="${projectMemberList}" var="user">
                                    <div class="col mb-2">${user.name}</div><hr>
                                </c:forEach>
                            </div>
                            <div class="col-lg-3"> <!-- 왼쪽 열 이름 -->
                                <h4>기술스택</h4>
                                <c:forEach var="intro"
                                <div class="col mb-2"> python, C</div><hr>
                                <div class="col mb-2"> C, C++</div><hr>
                                <div class="col mb-2"> C, C#</div><hr>
                                <div class="col mb-2"> javascript, python</div><hr>
                                <div class="col mb-2"> C, java</div>
                            </div>
                        </div>--%>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">이름</th>
                                <th scope="col">기술</th>
                                <th scope="col">경력</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${projectMemberList}">
                            <tr>
                                <td>${user.name}</td>
                                <td>
                                    <c:if test="${user.skill1 ne ''}">
                                        ${user.skill1}
                                    </c:if>
                                    <c:if test="${user.skill2 ne ''}">
                                        , ${user.skill2}
                                    </c:if>
                                    <c:if test="${user.skill3 ne ''}">
                                        , ${user.skill3}
                                    </c:if>
                                </td>
                                <td>${user.career}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-6"> <!-- 오른쪽 영역 -->
                    <h4 class="mb-3">
                        <span class="text-primary">채팅목록확인</span>
                    </h4>
                    <div class="border border-primary-subtle rounded p-3">
                        <div>
                                    <h2 class="accordion-header">
                                        <button type="button" class="chatlistBtn">
                                            목록보기
                                        </button>
                                    </h2>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div >
</form style="margin-bottom: 500px">
<%@ include file="../include/footer.jsp"%>

<!-- ######################################################### -->

<script>

    const button = document.querySelector('.chatlistBtn');
    button.addEventListener('click', function() {
        // 이동할 URL 지정
        const url = '../chat/chatRoomList';

        // 지정된 URL로 이동
        location.href = url;
    });
</script>
</body>
</html>