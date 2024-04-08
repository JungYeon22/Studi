<%--
  Created by IntelliJ IDEA.
  User: jungyeon
  Date: 2024-04-05
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <div class="row mt-4">
    <div class="col-md-8">
      <!-- 게시물 목록 -->
      <div class="card mb-3">
        <div class="card-header">
          <strong>오늘의 공부 팁</strong>
          <small class="text-muted">작성자: 박정연 | 작성시간: 2024-03-11</small>
        </div>

        <div class="card-body m-3">
          <p class="card-text">오늘은 공부하는데 효율적인 방법에 대해 이야기해보려고 합니다.
            요즘 공부 방법에 대한 다양한 이야기가 있지만, 가장 중요한 것은 계획입니다.
            먼저 목표를 정하고, 그 목표를 달성하기 위한 계획을 세우는 것이 중요합니다.
            또한 공부 시간을 일정하게 유지하고, 집중력을 유지할 수 있는 환경을 조성하는 것도 중요합니다.
            그리고 공부한 내용을 정리하고 복습하는 것을 잊지 말아야 합니다.
            이렇게 하면 효율적으로 공부할 수 있을 것입니다.</p>
        </div>
        <div class="card-footer text-end">
          <i class="fa-regular fa-thumbs-up"></i>
          <button type="button" class="btn btn-primary">좋아요</button>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-4">
    <div class="col-md-8">
      <!-- 게시물 목록 -->
      <div class="card mb-3">
        <div class="card-header">
          <strong>오늘의 공부 팁</strong>
          <small class="text-muted">작성자: 박정연 | 작성시간: 2024-03-11</small>
        </div>

        <div class="card-body m-3">
          <p class="card-text">오늘은 공부하는데 효율적인 방법에 대해 이야기해보려고 합니다.
            요즘 공부 방법에 대한 다양한 이야기가 있지만, 가장 중요한 것은 계획입니다.
            먼저 목표를 정하고, 그 목표를 달성하기 위한 계획을 세우는 것이 중요합니다.
            또한 공부 시간을 일정하게 유지하고, 집중력을 유지할 수 있는 환경을 조성하는 것도 중요합니다.
            그리고 공부한 내용을 정리하고 복습하는 것을 잊지 말아야 합니다.
            이렇게 하면 효율적으로 공부할 수 있을 것입니다.</p>
        </div>
        <div class="card-footer text-end">
          <i class="fa-regular fa-thumbs-up"></i>
          <button type="button" class="btn btn-primary">좋아요</button>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-4">
    <div class="col-md-8">
      <!-- 게시물 목록 -->
      <div class="card mb-3">
        <div class="card-header">
          <strong>오늘의 공부 팁</strong>
          <small class="text-muted">작성자: 박정연 | 작성시간: 2024-03-11</small>
        </div>

        <div class="card-body m-3">
          <p class="card-text">오늘은 공부하는데 효율적인 방법에 대해 이야기해보려고 합니다.
            요즘 공부 방법에 대한 다양한 이야기가 있지만, 가장 중요한 것은 계획입니다.
            먼저 목표를 정하고, 그 목표를 달성하기 위한 계획을 세우는 것이 중요합니다.
            또한 공부 시간을 일정하게 유지하고, 집중력을 유지할 수 있는 환경을 조성하는 것도 중요합니다.
            그리고 공부한 내용을 정리하고 복습하는 것을 잊지 말아야 합니다.
            이렇게 하면 효율적으로 공부할 수 있을 것입니다.</p>
        </div>
        <div class="card-footer text-end">
          <i class="fa-regular fa-thumbs-up"></i>
          <button type="button" class="btn btn-primary">좋아요</button>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-4">
    <div class="col-md-8">
      <!-- 게시물 목록 -->
      <div class="card mb-3">
        <div class="card-header">
          <strong>오늘의 공부 팁</strong>
          <small class="text-muted">작성자: 박정연 | 작성시간: 2024-03-11</small>
        </div>

        <div class="card-body m-3">
          <p class="card-text">오늘은 공부하는데 효율적인 방법에 대해 이야기해보려고 합니다.
            요즘 공부 방법에 대한 다양한 이야기가 있지만, 가장 중요한 것은 계획입니다.
            먼저 목표를 정하고, 그 목표를 달성하기 위한 계획을 세우는 것이 중요합니다.
            또한 공부 시간을 일정하게 유지하고, 집중력을 유지할 수 있는 환경을 조성하는 것도 중요합니다.
            그리고 공부한 내용을 정리하고 복습하는 것을 잊지 말아야 합니다.
            이렇게 하면 효율적으로 공부할 수 있을 것입니다.</p>
        </div>
        <div class="card-footer text-end">
          <i class="fa-regular fa-thumbs-up"></i>
          <button type="button" class="btn btn-primary">좋아요</button>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-4">
    <div class="col-md-8">
      <!-- 게시물 목록 -->
      <div class="card mb-3">
        <div class="card-header">
          <strong>오늘의 공부 팁</strong>
          <small class="text-muted">작성자: 박정연 | 작성시간: 2024-03-11</small>
        </div>

        <div class="card-body m-3">
          <p class="card-text">오늘은 공부하는데 효율적인 방법에 대해 이야기해보려고 합니다.
            요즘 공부 방법에 대한 다양한 이야기가 있지만, 가장 중요한 것은 계획입니다.
            먼저 목표를 정하고, 그 목표를 달성하기 위한 계획을 세우는 것이 중요합니다.
            또한 공부 시간을 일정하게 유지하고, 집중력을 유지할 수 있는 환경을 조성하는 것도 중요합니다.
            그리고 공부한 내용을 정리하고 복습하는 것을 잊지 말아야 합니다.
            이렇게 하면 효율적으로 공부할 수 있을 것입니다.</p>
        </div>
        <div class="card-footer text-end">
          <i class="fa-regular fa-thumbs-up"></i>
          <button type="button" class="btn btn-primary">좋아요</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script>

</script>

</body>
</html>