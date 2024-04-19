<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
<!-- Modal -->
<div class="modal fade" id="applicationNoti" tabindex="-1" aria-labelledby="applicationNotiLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="applicationNotiLabel">프로젝트 참가 신청</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="modal-body">
                    <!-- 댓글 목록 -->
                    <ul class="list-group">
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#applicationNotiBtn').click(function (){
            console.log("모달 버튼 클릭")
            console.log($('#boardId').val())
            $.post({
                url: '/projectTeam/applicationList',
                data: 'boardId=' + $('#boardId').val(),
                dataType: 'json',
                success: function (data) {
                    console.log(JSON.stringify(data));
                    $('.list-group').empty();
                    $.each(data, function (index, itmes) {
                        var comment = `<li class="list-group-item d-flex justify-content-between align-items-center" style="border: 1px solid #ff5353;">
                                <div>
                                    <strong>` + itmes.name + `:</strong> (<span>` + itmes.userId + `</span>)<br>
                                </div>
                                <div >
                                    <button type="button" class="approveBtn">수락</button>
                                    <input type="hidden" value="` + itmes.userId + `">
                                </div>
                        </li>`
                        $('.list-group').append(comment);
                    })
                },
                error: function (e){
                    console.log(e)
                }
            })
        })


        $(document).on('click', '.approveBtn', function(){
            console.log("클릭")
            var userId = $(this).siblings('input[type="hidden"]').val()
            var boardId = $('#boardId').val();
            console.log(userId)
            console.log(boardId)
            $.post({
                url: '/projectTeam/approve',
                data: {'boardId' : boardId,
                        'userId' : userId},
                success: function (data) {
                    console.log(data)
                },
                error: function (e){
                    console.log(e)
                }
            })
            // 수락 버튼이 클릭되었을 때의 이벤트 핸들러
            $(this).closest('li').remove(); // 가장 가까운 상위 <li> 태그를 삭제

        });


    })
</script>