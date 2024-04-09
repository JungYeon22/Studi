<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%@include file="../include/headFile.jsp"%>
</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="fBoardWriteModal.jsp"%>
<div><br><br><br></div>

<div class="container mt-5">
  <div class="text-start mt-5">
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fBoardWriteModal">
      글쓰기
    </button>
  </div>
  <input type="hidden" id="userId" name="userId" value="park"> <%--park 대신 ${sessionScope.userDTO.userId}--%>
<c:forEach var="fboardDTO" items="${fBoardList}">
  <div class="row mt-4">
    <div class="col-md-8">
      <!-- 게시물 목록 -->
      <div class="card mb-3">
        <div class="card-header">
          <strong>${fboardDTO.title}</strong>
          <small>작성자: ${fboardDTO.writer} | 작성시간:</small>
          <small class="text-muted">${fboardDTO.date}</small>
          <span>${fboardDTO.FBoard}</span>
        </div>

        <div class="card-body m-3">
          <p class="card-text" id="contentValue">
            ${fboardDTO.content}
          </p>
        </div>
        <div class="card-footer text-end">
          <i class="fa-regular fa-thumbs-up"> </i>
          <span class="likeValue">${fboardDTO.likes}</span>
          <button type="button" class="btn btn-primary likeBtn" data-number="${fboardDTO.FBoard}" data-bs-toggle="button" aria-pressed="false">좋아요</button>
          <input type="hidden"  value="${fboardDTO.FBoard}">
        </div>
      </div>
    </div>
  </div>
</c:forEach>
</div>
</body>
</html>
