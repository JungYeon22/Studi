<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        nav {
            display: inline-block;
            height: 70px;
            text-align: right;

        }
        #search {
            width: 330px;
            /* 원하는 너비로 설정하세요 */
            height: 45px;
            padding: 8px 20px;
            /* 내부 여백 설정 */
            /* 테두리 제거 */
            border-radius: 9999px;
            /* 타원형 모양으로 설정 */
            background-color: #ffff;
            /* 배경색 설정 */
            background-position: right 30px top 50%;
            /* 이미지 위치 조정 */
            box-sizing: border-box;
            /* padding과 border를 박스 크기에 포함시킵니다. */
            background-repeat: no-repeat;
        }

        #search .background-image:hover{
            cursor: pointer;
        }

        .navlogin{
            margin-left: 620px;
        }


        #navmenu {
            color: #000000;
            font-size: 1.6em;
        }

        #navbarall{
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex; /* Flexbox 사용 */
            justify-content: space-between; /* 요소를 동일한 간격으로 분산 배치 */
            align-items: center; /* 요소를 수직 가운데 정렬 */
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(3px);
            box-shadow: 2px 7px 15px 8px rgba(192, 185, 185, 0.3);
        }
        .uplogin {
            color: rgb(119, 119, 127);
            margin: 0;
            margin-top: 15px;
        }

        .upwrite {
            color: rgb(119, 119, 127);
            margin: 0;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg opacity-20" id="navbarall">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img src="/image/sutdi.png" width="80" height="50"></a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="position-absolute top-50 start-50 translate-middle">
                <input id="search" type="search" placeholder="search...">
            </div>
        </div>


        <div class=" position-relative top-0 end-0" style="width: 300px; height: 60px;">
            <ul class="navbar-nav me-auto mb-3 mb-lg-1">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle " id="navmenu" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        more
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">회원정보수정</a></li>
                        <li><a class="dropdown-item" href="#">내 프로필</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">로그아웃&emsp;&emsp;
                                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <a type="button" class="uplogin">로그인</a>
                <img src="/image/line.png" class="line" width="20px" height="30px" style=" margin: 0;
              margin-top: 15px;">
                <a type="button" class="upwrite">회원가입</a>
            </ul>
        </div>
    </div>

</nav>

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
            <a href="/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
                        <h6 class="mb-0 ms-3" >제목</h6><h6 class="mb-0 position-absolute top-50 end-0 translate-middle-y me-5">모집 마감(5/5)</h6>
                        <button type="button" class="btn btn-outline-danger rounded-pill btn-sm ms-3 mt-2" disabled>JAVA</button>

                    </div>

                </div>
            </a>
            <br>
            <a href="/board/boardList2" class="list-group-item list-group-item-action d-flex gap-3 py-3 rounded-3" aria-current="true">
                <div class=" gap-2 w-100 justify-content-between">
                    <div>
                        <small class="opacity-50 text-nowrap ms-3">작성자</small>&emsp;<small class="opacity-50 text-nowrap">now</small>&emsp;<small class="opacity-50 text-nowrap">조회</small><small class="opacity-50 text-nowrap">100</small><img src="/image/icons8-북마크-리본-24.png" class="rounded float-end"  alt="bookmark">
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
