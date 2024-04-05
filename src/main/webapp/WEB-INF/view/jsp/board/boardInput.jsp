
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

    <link rel="stylesheet" href="/css/boardInput.css">

</head>
<body>
<form id="boardInputForm">
<div class="container">
    <div class="card">
        <div class="card-header bg-white">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" id="subject" placeholder="제목">
                    <br>
                    <input type="text" class="form-control" id="name" value="작성자" readonly>
                    <br>
                    <input type="number" class="form-control" id="memberCount" placeholder="모집인원" min="2" max="5">
                </div>

                <div id="button">
                    <button type="button" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div id="content"></div>
            <script>
                $('#content').summernote({
                    placeholder: '글을 쓰세요.',
                    height: 500,
                });
            </script>
        </div>
    </div>
</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>