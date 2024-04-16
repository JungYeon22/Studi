<%--
  Created by IntelliJ IDEA.
  User: ldw95
  Date: 2024-04-02
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


</head>

<body>

<%@ include file="../include/header.jsp"%>

<form class="position-absolute top-0 start-50 translate-middle-x mt-5" style="width: 50%">
    <br>
    <input type="hidden" id="userId" value="${userId}">
    <input type="hidden" id="boardid" value="${boardDTO.BOARDID}">
    <div class="card mb-4 rounded-3 shadow-sm " style="height: 100%; " >
        <div class="card-header py-3 " style="border-bottom: none; ">
            <h4 class="my-0 fw-normal " style="text-align: center;">${boardDTO.SUBJECT}</h4>
            <div><small class="opacity-70 text-nowrap ms-1" style="float: right;">조회수 : ${boardDTO.HIT}</small><small class="opacity-70 text-nowrap ms-1" style="float: right;">작성일: ${date}</small><small class="opacity-70 text-nowrap" style="float: right;">작성자: ${userId} </small></div>
        </div>

        <div class="rounded-1 border" style="width: 100%; height: 400px; background-color: white; overflow: auto; word-wrap: break-word;">
            ${boardDTO.CONTENT}
        </div>


        <div style="background-color: white;">
            <div class="row" style="width: 95%; margin-top: 3px;">
                <div class="col-sm-1 dropdown">
                    <img src="${pageContext.request.contextPath}/image/icons8-동물-30.png" class="rounded  dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 15px;" alt="profile"/>
                    <div>
                        <small style="margin-left: 5px;">작성자</small>
                    </div>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">프로필 보기</a></li>
                        <li><a class="dropdown-item" href="#">채팅하기</a></li>
                        <li><a class="dropdown-item" href="#">신고하기</a></li>
                    </ul>
                </div>

                <div class=" col card  rounded-3 bg-body-white " style="width: 90%;" > ㅋㅋㅋㅋㅋㅋ123412 45555ㅋㄷ미들급 신청합니다.</div>
                <div class="col-sm-1" style="padding: 0px; margin:0 0 ;">
                    <div>
                        <img src="${pageContext.request.contextPath}/image/edit.png" class="rounded "  alt="edit"/>
                    </div>
                    <img src="${pageContext.request.contextPath}/image/remove.png" class="rounded " alt="remove"/>
                </div>
            </div>
            <div class="row" style="width: 100%;">
                &emsp;<div class="col-sm-1 dropdown">
                <img src="${pageContext.request.contextPath}/image/icons8-테디-베어-30.png" class="rounded dropdown-toggle"role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 8px;" alt="profile"/>
                <div>
                    <small>작성자</small>
                </div>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">프로필 보기</a></li>
                    <li><a class="dropdown-item" href="#">채팅하기</a></li>
                    <li><a class="dropdown-item" href="#">신고하기</a></li>
                </ul>
            </div>
                <div class=" col card  rounded-3 bg-body-white " style="width: 100%;margin-top: 5px;" > ㅋㅋ ㅎㅇ</div>
                <div class="col-sm-1" style="padding: 0px; margin:0 0 ;">
                    <div><img src="${pageContext.request.contextPath}/image/edit.png" class="rounded "  alt="edit"/></div>
                    <img src="${pageContext.request.contextPath}/image/remove.png" class="rounded " alt="remove"/>
                </div>
            </div>
        </div>
        <div >
            <div class="input-group" style="width: 85%; margin: 10px auto; "  >
                <input type="text" class="form-control" placeholder="댓글 작성 ㄱㄱ">
                <button type="button" class="btn btn-outline-secondary">댓글 작성 ㅋ</button>
            </div>
        </div>
    </div>


</form>
<div>
    <img src="${pageContext.request.contextPath}/image/edit.png" style="height: 35px ; margin-left: 76%; margin-top: 80px;" >
    <img src="${pageContext.request.contextPath}/image/remove.png" style="height: 35px ; margin-left: 76%;" onclick="removeBoard()">
    <img src="${pageContext.request.contextPath}/image/bookmark1.png" id="bookmark" style="height: 35px ; margin-left: 76%;" onclick="boardScrap()"/>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/board/boardDetail.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>

</html>
