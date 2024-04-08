
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판 작성하기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardInput.css">

</head>
<body>
<%@ include file="../include/header.jsp"%>
<form id="boardInputForm" style="margin-top: 70px" >

<div class="container">
    <div class="card">
        <div class="card-header bg-white">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" id="subject" name="SUBJECT" placeholder="제목">
                    <br>
                    <input type="text" class="form-control" id="UserId" name="UserId" value="dongwoo" readonly>
                    <br>


                    <div class="hstack gap-3">
                        <input type="number" class="form-control p-2" id="userCnt" name="userCnt" placeholder="모집인원" min="2" max="5">
                        <select class="form-select d-inline p-2" aria-label="Default select example" id="projectType" name="projectType" style="height: 40px">
                            <option selected>모집유형</option>
                            <option value="1">프로젝트</option>
                            <option value="2">대회</option>
                            <option value="3">스킬업</option>
                        </select>
                        <select class="form-select d-inline p-2" aria-label="Default select example" id="projectField" name="projectField" style="height: 40px">
                            <option selected>모집분야</option>
                            <option value="1">BackEnd</option>
                            <option value="2">FrontEnd</option>
                            <option value="3">Publisher</option>
                        </select>
                        <hr/>
                    </div>

                    <br>
                    <div>
                        언어<br>
                        <input type="checkbox" name="lang" value="java" id="java"/> <label for="java">JAVA</label>
                        <input type="checkbox" name="lang" value="python" id="python"/> <label for="python">Python</label>
                        <input type="checkbox" name="lang" value="C" id="C"/> <label for="C">C</label>

                    </div>


                </div>

                <div id="button">
                    <button type="button" id="boardInputFormBtn" class="btn btn-primary">글쓰기</button>
                </div>
            </div>
        </div>
        <div class="card-body">
            <textarea id="content" name="CONTENT"></textarea>
            <script>
                $('#content').summernote({
                    placeholder: '글을 쓰세요.',
                    height: 500,
                    callbacks : {
                        onImageUpload : function(files, editor, welEditable) {
                            // 다중 이미지 처리
                            for (var i = 0; i < files.length; i++) {
                                imageUploader(files[i], this);
                            }
                        }
                    }
                });
            </script>
        </div>
    </div>
</div>
</form>
<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/board/boardInput.js"></script>
<script>
    function imageUploader(file, el) {
        var formData = new FormData();
        formData.append('file', file);

        $.ajax({
            data : formData,
            type : "POST",
            url : '${pageContext.request.contextPath}/board/boardImageUpload',
            contentType : false,
            processData : false,
            enctype : 'multipart/form-data',
            success : function(data) {
                $(el).summernote('insertImage', "https://kr.object.ncloudstorage.com/bitcamp-6th-bucket-102/storage/"+data, function($image) {
                    $image.css('width', "100%");
                });
                console.log(data);
            },
            error : function(e){
                console.log(e);
            }
        });
    }
</script>
</body>
</html>