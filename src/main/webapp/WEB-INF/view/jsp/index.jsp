<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/e4cbd3c2a7.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/header.css">
  <style>
    /* 카드의 기본 스타일 */
    .card {
      transition: background-color 0.3s ease; /* 배경색 전환 효과 추가 */
    }

    /* 마우스를 올렸을 때의 스타일 변경 */
    .card:hover {
      background-color: rgb(208, 221, 255); /* 변경할 배경색 */
      transform: scale(1.05); /* 약간 크기를 늘립니다. */
      cursor: pointer;
    }
  </style>
</head>

<body>
<%@ include file="include/header.jsp"%>
<h2>test</h2>
<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="/image/study2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/image/study3.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/image/study4.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


<div id="hot5Div" class="container-fluid p-5 row justify-content-center" >
  <h2>🔥 인기 프로젝트/스터디 </h2>
</div>

<div id="recent5Div" class="container-fluid p-5 row justify-content-center">
  <h2>⭐️ 신규 공모전/프로젝트 </h2>
</div>

<div class="container-fluid p-5 row justify-content-center" id="fBoardTopRankContainer">
  <h2>😎 최근 라운지 게시글</h2>
</div>

<%@include file="include/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script>
$(function(){
  $.ajax({
    type:'post',
    url:'${pageContext.request.contextPath}/getHot5',
    dataType:'json',
    success:function (data){
      console.log(JSON.stringify(data));
      $.each(data.list,function (index,items) {

        var result = `<div class="card col-3 m-2" style="width: 18rem;" onclick="location.href='${pageContext.request.contextPath}/board/boardListDetail?boardid=`+items.boardid+`'">
          <div class="card-body" >
            <h5 class="card-title">`+items.subject+`</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">`+items.userId+`</h6>
            <p class="card-text " style="color: #4169E1 ;" >프로젝트 타입: `+items.projectType+`</p>
            <p class="card-text " style="color: #4169E1 ;">프로젝트 유형: `+items.projectField+`</p>
            <div class="opacity-25 mt-2">
               <i class="fa-regular fa-eye"> `+items.hit+`</i>
            </div>
          </div>
        </div>`;


        $('#hot5Div').append(result);
      });
      $.each(data.list1,function (index,items) {

        var result = `<div class="card col-3 m-2" style="width: 18rem;" onclick="location.href='${pageContext.request.contextPath}/board/boardListDetail?boardid=`+items.boardid+`'">
          <div class="card-body" >
            <h5 class="card-title">`+items.subject+`</h5>
            <h6 class="card-subtitle mb-2 text-body-secondary">`+items.userId+`</h6>
            <p class="card-text" style="color: #2E8B57 ;">프로젝트 타입: `+items.projectType+`</p>
            <p class="card-text" style="color: #2E8B57 ;">프로젝트 유형: `+items.projectField+`</p>
            <div class="opacity-25 mt-2">
              <i class="fa-regular fa-eye"> `+items.hit+`</i>
            </div>
          </div>
        </div>`;
          $('#recent5Div').append(result);
      });

    },
      error: function (e) {
          console.log(e);
      }
  });
})

</script>

<script>
  $(document).ready(function(){
    $(document).on('click', '.fBoardTopRank', function(){
      console.log("afs")
      location.href="/freeBoard/freeBoardList"
    })
    $.get({
      url: 'freeBoard/getFBoardTopRank',
      dataType: 'json',
      success: function (data){
        console.log(JSON.stringify(data));

        $.each(data, function(index, items) {
          var fBoardItem = `<div class="card border-primary fBoardTopRank col-3 m-2" style="width: 18rem;">
                              <div class="card-body">
                                <h5 class="card-title"><strong>`+items.title+`</strong></h5>
                                <h6 class="card-subtitle mb-2 text-body-secondary">`+items.writer+`</h6>
                                <p class="card-text d-inline-block text-truncate" style="max-width: 150px;">
                                    `+items.content+`
                                </p>
                              </div>
                              <div class="card-footer bg-transparent">
                                <div class="opacity-25 mb-1">
                                  <i class="fa-solid fa-heart"> `+items.likes+`</i>
                                  <i class="fa-regular fa-comment"> `+items.comment+`</i>
                                </div>
                              </div>
                            </div>`
          $('#fBoardTopRankContainer').append(fBoardItem);
        })
      }
    })
  });
</script>
</body>
</html>