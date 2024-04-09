<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="fBoardWriteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">글쓰기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="fBoardWriteForm">
                    <div class="container">
                        <div class="mb-3 row">
                            <label for="writer" class="col-sm-2 col-form-label">작성자</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" id="writer" name="writer" value="박정연"><%--${sessionScope.userDTO.name}--%>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="title" class="col-sm-2 col-form-label">제목</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" name="title">
                                <div id="titleDiv"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" name="content" id="content" rows="5"></textarea>
                            <div id="contentDiv"></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="fBoardWriteBtn">Save</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#fBoardWriteBtn').click(function(){
            var writer = $('#writer').val();
            var title = $('#title').val();
            var content = $('#content').val();
            console.log(writer);

            if(title == ""){
                $('#titleDiv').html('제목을 입력해주세요.')
            }
            else if(content == ""){
                $('#contentDiv').html('내용을 입력하세요.')
            }
            else {
                $.post({
                    url: '${pageContext.request.contextPath}/freeBoard/write'
                    , data: $('#fBoardWriteForm').serialize() // 변수=값&변수=값..
                    , success: function (){
                        alert('게시글 등록')
                        location.reload();
                    }
                    , error: function (e){
                        console.log(e);
                    }
                })
            }
        })
    });
</script>
