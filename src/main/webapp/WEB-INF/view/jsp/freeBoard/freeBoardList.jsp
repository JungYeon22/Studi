<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%@include file="../include/headFile.jsp"%>
  <style>
    .accordion-fixed {
      position: fixed;
      top: 200px; /* 오른쪽에 고정될 위치를 조정할 수 있습니다. */
      right: 50px;
      width: 400px; /* 공지사항 아코디언의 너비를 조정할 수 있습니다. */
      z-index: 1000; /* 다른 요소 위에 표시되도록 z-index를 설정할 수 있습니다. */
      overflow-y: auto; /* 스크롤이 필요한 경우 수직 스크롤바를 표시합니다. */
      max-height: calc(100vh - 50px); /* 화면의 높이에서 헤더의 높이를 뺀 만큼 최대 높이로 설정합니다. */
    }
  </style>
</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="fBoardWriteModal.jsp"%>
<%@include file="fBoardCommentModal.jsp"%>
<div><br><br><br></div>
<input type="hidden" id="userId" name="userId" value="${sessionScope.userDTO.userId}">
<input type="hidden" id="userName" name="userName" value="${sessionScope.userDTO.name}">
<div class="container mt-5">
  <div class="text-start mt-5">
    <!-- Button trigger modal -->
    <button type="button" id="fBoardWriteModalBtn" class="btn btn-secondary" >
      글쓰기
    </button>
  </div>
  <div class="collapse" id="BbsCollapse">
    <div class="card card-body mt-2" style="width: 350px; color: #174cf6;">
      로그인한 회원만 글쓰기가 가능합니다.
    </div>
  </div>
  <div id="fBoardContainer">
    <c:forEach var="fboardDTO" items="${fBoardList}">
      <div class="content row mt-4">
        <div class="col-md-8">
          <!-- 게시물 목록 -->
          <div class="card mb-3">
            <div class="card-header d-flex justify-content-between">
              <strong>${fboardDTO.title}</strong>
              <div class="text-end">
                <small>작성자: ${fboardDTO.writer} </small>
                <small class="text-muted">${fboardDTO.date}</small>
              </div>
            </div>
            <div class="card-body m-1">
              <p class="contentValue">
                  ${fboardDTO.content}
              </p>
            </div>
            <div class="card-footer bg-transparent d-flex justify-content-between">
              <div>
                <i class="fa-regular fa-comment mt-1" data-bs-toggle="modal" data-bs-target="#fBoardCommentModal" data-post-id="${fboardDTO.FBoard}"></i><small> ${fboardDTO.comment}</small>
              </div>
              <div>
                <i class="fa-regular fa-thumbs-up" > </i>
                <span class="likeValue">${fboardDTO.likes}</span>
                <button type="button" class="btn btn-outline-primary likeBtn" data-number="${fboardDTO.FBoard}">좋아요</button>
                <input type="hidden"  value="${fboardDTO.FBoard}">
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<div class="accordion accordion-fixed" id="accordionFlushExample">

  <h2 class="text-center mt-4 mb-4"><i class="fa-solid fa-tower-cell"></i>  공지사항</h2>
  <c:forEach var="noti" items="${notiList}">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#noti${noti.noti_id}" aria-expanded="false" aria-controls="flush-collapseOne">
        <strong>${noti.title}</strong>
      </button>
    </h2>
    <div id="noti${noti.noti_id}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">${noti.content}</div>
    </div>
  </div>
  </c:forEach>
</div>


<script>
  $(document).ready(function (){

    $('.content').each(function (index, items){
      var contentValue = $(items).find('.contentValue');
      var contentBody = $(items).find('.card-body');

      if(contentValue.innerHeight() > 100){
        console.log('height : '+ contentValue.height());
        contentValue.addClass("webKitBox ellipsis-text overflow-hidden");
        contentBody.append('<button class="btn btn-outline-secondary toggleButton" >더보기</button>')
      }
    })

  })
  // "더보기" 버튼 클릭 시 전체 텍스트를 표시하거나 축약된 텍스트를 다시 표시하는 함수

  $(document).on('click', '.toggleButton', function(){
    var textElement = $(this).siblings('.contentValue');

    if (textElement.hasClass("ellipsis-text")) {
      // 축약된 텍스트를 표시 중인 경우
      /*textElement.classList.remove("ellipsis-text");*/
      textElement.removeClass('ellipsis-text overflow-hidden webKitBox');
      this.textContent = "접기"; // 버튼 텍스트를 "접기"로 변경
    } else {
      // 전체 텍스트를 표시 중인 경우
      textElement.addClass("webKitBox ellipsis-text overflow-hidden");
      this.textContent = "더보기"; // 버튼 텍스트를 "더보기"로 변경
    }
  });
</script>
</body>
</html>
