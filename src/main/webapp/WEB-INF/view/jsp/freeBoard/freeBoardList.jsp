<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%@include file="../include/headFile.jsp"%>
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
    <div class="card card-body mt-2 text-align" style="width: 500px; color: #174cf6;">
      로그인한 회원만 글쓰기가 가능합니다.
    </div>
  </div>
  <div id="fBoardContainer">
    <c:forEach var="fboardDTO" items="${fBoardList}">
      <div class="content row mt-4" >
        <div class="col-md-8">
          <!-- 게시물 목록 -->
          <div class="card mb-3">
            <div class="card-header d-flex justify-content-between border-success">
              <strong>${fboardDTO.title}</strong>
              <div class="text-end">
                <small>작성자: ${fboardDTO.writer_name} </small>(<small class="writerId">${fboardDTO.writer}</small>)
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

  <h2 class="text-center mt-4 mb-4">🎇 공지사항 🎇 </h2>
  <c:forEach var="noti" items="${notiList}">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#noti${noti.noti_id}" aria-expanded="false" aria-controls="flush-collapseOne">
        <strong>📢${noti.title}</strong>
      </button>
    </h2>
    <div id="noti${noti.noti_id}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body contentValue">${noti.content}</div>
    </div>
  </div>
  </c:forEach>
</div>


<script>


  $(document).ready(function (){
    $('.content').each(function (index, items){
      var contentValue = $(items).find('.contentValue');
      var contentBody = $(items).find('.card-body');
      var writeId = $(items).find('.writerId').text();
      var fBoardNum = $(items).find('input[type="hidden"]').val();

      if( $('#userId').val()==writeId){
        console.log("if문 들어옴")
        var btnCloseValue =
                `<div class="icon-close">
                  <button class="btn-close fBoardDeleteBtn" data="`+fBoardNum+`"></button>
                </div>`
        contentBody.append(btnCloseValue)
      }

      if(contentValue.innerHeight() > 100){
        contentValue.addClass("webKitBox ellipsis-text overflow-hidden");
        contentBody.append('<button class="btn btn-outline-secondary toggleButton" >더보기</button>')
      }
    });

  })
  $(document).on('click', '.fBoardDeleteBtn', function(){
    var fBoardDeleteNum = $(this).attr('data');
    console.log(fBoardDeleteNum);
    if(confirm('해당 게시글을 삭제하시겠습니까?')){
      $.post({
        url: '/freeBoard/deleteFBoard',
        data: {'fBoard' : fBoardDeleteNum},
        success: function (){
          location.reload();
        }
      })
    }
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
