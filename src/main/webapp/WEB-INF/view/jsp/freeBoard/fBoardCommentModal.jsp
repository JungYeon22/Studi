<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="fBoardCommentModal" tabindex="-1" aria-labelledby="fBoardCommentModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content fBoardCommentModal">
      <div class="modal-header">
        <input type="hidden" id="fBoard">
        <h1 class="modal-title fs-5" id="fBoardCommentModalLabel">댓글</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- 댓글 목록 -->
        <ul class="list-group">
        </ul>
      </div>
      <div class="modal-footer">
        <form class="w-100" id="commentForm">
          <div class="input-group">
            <textarea class="form-control" id="commentValue" aria-label="With textarea" placeholder="댓글 작성"></textarea>
            <button class="btn btn-primary addCommentBtn" type="button" onclick="addComment()">댓글 작성</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
  function addComment() {
    if($('#commentValue').val() == ''){
      return false;
    }else{
      $.post({
        url: '/freeBoard/addComment',
        data: {
          'comment': $('#commentValue').val(),
          'fBoard': $('#fBoard').val(),
          'writer': $('#userId').val()
        },
        dataType: 'json',
        success: function(data){
          console.log(JSON.stringify(data))
          $('#commentValue').val('')
          $('.list-group').empty();
          $.each(data, function (index, itmes){
            var commentDate = getTimeAgo(itmes.date);
            var comment = `<li class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <strong>`+ itmes.writer +`:</strong> <span>`+ itmes.comment +`</span><br>
                                <small class="text-muted">`+ commentDate +`</small>
                            </div>
                        </li>`
            $('.list-group').append(comment);
          })
        },
        error: function (e){
          console.log(e)
        }
      })
    }
  }

// 모달을 열 때 게시글 번호를 전달하는 함수
  $(document).on('click', '.fa-comment', function() {
    var postId = $(this).data('post-id'); // 게시글 번호 가져오기
    // 모달 내부에 게시글 번호를 표시하는 예시
    $('#fBoard').val(postId);
    $('.list-group').empty();
    $.post({
      url: '/freeBoard/getBoardComment',
      data: 'fBoard=' + postId,
      dataType: 'json',
      success: function (data) {
        console.log(JSON.stringify(data))
        $.each(data, function (index, itmes){
          var commentDate = getTimeAgo(itmes.date);
          var comment = `<li class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <strong>`+ itmes.writer +`:</strong> <span>`+ itmes.comment +`</span><br>
                                <small class="text-muted">`+ commentDate +`</small>
                            </div>
                        </li>`
          $('.list-group').append(comment);
        })
      }
    })

    // 로그인 안하면 댓글 버튼 disabled 추가
    if($('#userId').val() == ''){
      $('.addCommentBtn').attr("disabled","true")
    }

  });
</script>