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

<body>

<%@ include file="../include/header.jsp"%>

<form class="position-absolute top-0 start-50 translate-middle-x mt-5" style="width: 50%">
    <br>
    <input type="hidden" id="userId" value="${userId}">
    <input type="hidden" id="sessionId" value="${userDTO.userId}">
    <input type="hidden" id="boardid" value="${boardDTO.BOARDID}">
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
                <input type="text" id="reply" class="form-control" placeholder="댓글을 작성해 주세요.">
                <button type="button" id="replyBtn" class="btn btn-outline-secondary" >댓글 작성</button>
            </div>
        </div>
    </div>


</form>
<div style="margin-left: 2% ; margin-top: 5%">
    <c:if test="${userId == sessionScope.userDTO.userId}">
        <img src="${pageContext.request.contextPath}/image/edit.png" style="height: 35px ; margin-left: 75%; " >
        <img src="${pageContext.request.contextPath}/image/remove.png" style="height: 35px ; margin-left: 75%;" onclick="removeBoard()">
    </c:if>
    <img src="${pageContext.request.contextPath}/image/bookmark1.png" id="bookmark" style="height: 35px ; margin-left: 75%;" onclick="boardScrap()"/>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/board/boardDetail.js"></script>


</body>

</html>
