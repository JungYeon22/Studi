<%--
  Created by IntelliJ IDEA.
  User: ldw95
  Date: 2024-04-02
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


</head>
<style>
    #editreply {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        width: 100%;
        box-sizing: border-box; /* 패딩과 테두리를 포함하여 요소의 크기를 계산합니다. */
    }
</style>
<body>

<%@ include file="../include/header.jsp"%>

<form class="position-absolute top-0 start-50 translate-middle-x mt-5" style="width: 50%">
    <br>
    <input type="hidden" id="userId" value="${userId}" >
    <input type="hidden" id="sessionId" value="${userDTO.userId}" >
    <input type="hidden" id="boardid" value="${boardDTO.BOARDID}" >
    <input type="hidden" id="subject" value="${boardDTO.SUBJECT}" >


    <div class="card mb-4 rounded-3 shadow-sm " style="height: 100%; " >
        <div class="card-header py-3 " style="border-bottom: none; ">
            <h4 class="my-0 fw-normal " style="text-align: center;">${boardDTO.SUBJECT}</h4>
            <div><small class="opacity-70 text-nowrap ms-1" style="float: right;">조회수 : ${boardDTO.HIT}</small><small class="opacity-70 text-nowrap ms-1" style="float: right;">작성일: ${date}</small><small class="opacity-70 text-nowrap" style="float: right;">작성자: ${userId} </small></div>
        </div>

        <div class="rounded-1 border" style="width: 100%; height: 400px; background-color: white; overflow: auto; word-wrap: break-word;">
            ${boardDTO.CONTENT}
        </div>


        <div id="replyDiv" style="background-color: white;">
            <!-- 동적 영역 -->
        </div>
        <div >
            <div class="input-group" style="width: 85%; margin: 10px auto; "  >
                <div id="oriUserDiv" style="margin-right: 5px ; margin-left: 0; color: #174cf6 ;cursor: pointer"></div>
                <input type="text" id="reply" class="form-control" placeholder="댓글을 작성해 주세요.">
                <button type="button" id="replyBtn" class="btn btn-outline-secondary" >댓글 작성</button>
            </div>
        </div>
    </div>


</form>
<div style="margin-left: 2% ; margin-top: 5%">
    <c:if test="${userId == sessionScope.userDTO.userId}">
        <img src="${pageContext.request.contextPath}/image/edit.png" style="height: 35px ; margin-left: 75%; cursor: pointer " onclick="editBoard()">
        <img src="${pageContext.request.contextPath}/image/remove.png" style="height: 35px ; margin-left: 75%; cursor: pointer" onclick="removeBoard()">
    </c:if>
    <img src="${pageContext.request.contextPath}/image/bookmark1.png" id="bookmark" style="height: 35px ; margin-left: 75%; cursor: pointer" onclick="boardScrap()"/>
</div>


<!-- Button trigger modal -->
<button type="button" id="trigger" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" hidden>
    Launch demo modal
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text" id="editreply" style="width: 100%" placeholder="수정할 댓글을 입력하세요."/>
            </div>
            <div class="modal-body" id="modalDiv" style="color: red">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" id="editreplyBtn" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/board/boardDetail.js"></script>


</body>

</html>
