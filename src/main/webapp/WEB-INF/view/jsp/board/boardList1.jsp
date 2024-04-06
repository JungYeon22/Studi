<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<%@ include file="../include/header.jsp"%>

<form class="position-absolute top-0 start-50 translate-middle-x mt-5" style="width: 50%">
    <br>
    <div class="grid d-flex p-4 gap-1 py-md-3 ms-2  " >
        <div class="p-2 g-col-6"   >
            <select class="form-select" aria-label="Default select example" style="background-color: rgb(255, 255, 255);">
                <option selected>언어</option>
                <option value="1">JAVA</option>
                <option value="2">C</option>
                <option value="3">Python</option>
            </select>

        </div>
        <div class="p-2 g-col-6" >
            <select class="form-select" aria-label="Default select example" style="background-color: rgb(255, 255, 255);">
                <option selected>모집유형</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>

        </div>
        <div class="p-2 g-col-6" >
            <select class="form-select" aria-label="Default select example" style="background-color: rgb(255, 255, 255);">
                <option selected>모집분야</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>

        </div>
        <button type="button" class="btn btn-outline-danger rounded-3 btn-sm mt-2" style="height: 40px ; margin-left: 50%; width: 80px ;font-size: small" >글쓰기</button>

    </div>


    <div class=" flex-column p-3 flex-md-row gap-4 py-md-0 ">
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="${pageContext.request.contextPath}/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 중(4/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="${pageContext.request.contextPath}/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="${pageContext.request.contextPath}/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="${pageContext.request.contextPath}/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="${pageContext.request.contextPath}/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="${pageContext.request.contextPath}/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="${pageContext.request.contextPath}/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="${pageContext.request.contextPath}/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="${pageContext.request.contextPath}/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
        </div>
    </div>
    <div style="margin-left: 42%;">
        <button type="button" class="btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2" >1</button>
        <button type="button" class="btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2" >2</button>
        <button type="button" class="btn btn-outline-danger border border-0 rounded-pill btn-sm mt-2" >3</button>
        <button type="button" class="btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2" >4</button>
        <button type="button" class="btn btn-outline-danger border border-0 rounded-pill btn-sm  mt-2" >5</button>
    </div>

</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
