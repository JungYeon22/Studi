<%--
  Created by IntelliJ IDEA.
  User: ldw95
  Date: 2024-04-02
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
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
    <div class="card mb-4 rounded-3 shadow-sm " style="height: 100%; " >
        <div class="card-header py-3 " style="border-bottom: none; ">
            <h4 class="my-0 fw-normal " style="text-align: center;">스파링 급구</h4>
            <div><small class="opacity-70 text-nowrap ms-1" style="float: right;">조회수</small><small class="opacity-70 text-nowrap ms-1" style="float: right;">작성일</small><small class="opacity-70 text-nowrap" style="float: right;">작성자</small></div>
        </div>

        <div class="rounded-1 border" style="width: 100%; height: 400px; background-color: white; overflow: auto; word-wrap: break-word;">
            모집 일자 : 2024.04~05.31<br>
            모집 인원 : 5명<br>
            모집 내용 : 신림역 8번출구에서 스파링 뜨실분 구함

        </div>


        <div style="background-color: white;">
            <div class="row" style="width: 95%; margin-top: 3px;">
                <div class="col-sm-1 dropdown">
                    <img src="/image/icons8-동물-30.png" class="rounded  dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 15px;" alt="profile"/>
                    <div>
                        <small style="margin-left: 5px;">작성자</small>
                    </div>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">채팅하기</a></li>
                        <li><a class="dropdown-item" href="#">신고하기</a></li>
                    </ul>
                </div>
                <div class=" col card  rounded-3 bg-body-white " style="width: 90%;" > ㅋㅋ 미들급 신청합니다.</div>
                <div class="col-sm-1" style="padding: 0px; margin:0 0 ;">
                    <div>
                        <img src="/image/icons8-바꾸다-24.png" class="rounded "  alt="edit"/>
                    </div>
                    <img src="/image/icons8-휴지통-비우기-24.png" class="rounded " alt="remove"/>
                </div>
            </div>
            <div class="row" style="width: 100%;">
                &emsp;<div class="col-sm-1 dropdown">
                <img src="/image/icons8-테디-베어-30.png" class="rounded dropdown-toggle"role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 8px;" alt="profile"/>
                <div>
                    <small>작성자</small>
                </div>
            </div>
                <div class=" col card  rounded-3 bg-body-white " style="width: 100%;margin-top: 5px;" > ㅋㅋ ㅎㅇ</div>
                <div class="col-sm-1" style="padding: 0px; margin:0 0 ;">
                    <div><img src="/image/icons8-바꾸다-24.png" class="rounded "  alt="edit"/></div>
                    <img src="/image/icons8-휴지통-비우기-24.png" class="rounded " alt="remove"/>
                </div>
            </div>
        </div>
        <div >
            <div class="input-group" style="width: 85%; margin: 10px auto; "  >
                <input type="text" class="form-control" placeholder="댓글 작성 ㄱㄱ">
                <button type="button" class="btn btn-outline-secondary">댓글 작성 ㅋ</button>
            </div>
        </div>
    </div>


</form>
<div>
    <img src="/image/icons8-바꾸다-24.png" style="height: 35px ; margin-left: 76%; margin-top: 80px;" >
    <img src="/image/icons8-휴지통-비우기-24.png" style="height: 35px ; margin-left: 76%;" >
    <img src="/image/icons8-북마크-리본-24 (1).png" style="height: 35px ; margin-left: 76%;" >
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
