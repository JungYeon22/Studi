<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%@include file="../include/headFile.jsp"%>
  <style>
    #titleDiv, #contentDiv{
      color: red;
    }
  </style>
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
          <small class="text-muted">작성자:${fboardDTO.writer} | 작성시간:${fboardDTO.date}</small>
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
<script>
$(function (){


  $.post({
    url: '/freeBoard/getUserLikeList'
    , data: 'userId='+$('#userId').val()
    , dataType: 'json'
    , success: function (data){
      console.log(JSON.stringify(data));  // 콘솔로 확인하려고
      $.each(data, function(index, number){
        console.log(number)
        $('.likeBtn[data-number="'+ number+'"]').attr('aria-pressed', "true");
      })
    }
  })

  $('.likeBtn').click(function (){
    var num = $(this).siblings('input[type="hidden"]'); // 해당 게시글 번호 가져오기
    alert(num.val());
    var pressValue = $(this).attr('aria-pressed');
    console.log(pressValue);
    var like = num.siblings('.likeValue').text();
    var likeCount
    if(pressValue){
      $(this).attr('aria-pressed', "false")
      likeCount = parseInt(like) + 1;
      num.siblings('.likeValue').text(likeCount);
    }else{
      $(this).attr('aria-pressed', "true")
      likeCount = parseInt(like) - 1;
      num.siblings('.likeValue').text(likeCount);
    }

    $.post({
      url: '/freeBoard/updateLike',
      data: 'num='+num.val()+"&userId="+$('#userId').val(),
      success: function (){
        console.log("성공")
      },
      error: function (e){
        console.log(e);
      }
    })
  })
})
</script>
</body>
</html>
