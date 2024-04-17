<%--
  Created by IntelliJ IDEA.
  User: 82106
  Date: 2024-04-02
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>managerPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <style>
        .btn:hover{
            background-color: rgb(222, 222, 222);
        }
        a{
            text-decoration: none;
            color: black;
        }
        .font-large {
            font-size: large;
        }

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
        .fixTable_wrap {
            height: 300px;
            overflow: auto;
        }

        .fixTable_wrap thead th {
            position: sticky;
            top: 0;
            z-index: 1;
        }

        .fixTable_wrap tbody {
            overflow-y: auto;
            max-height: calc(100% - 40px);
        }
        .fixTable_wrap tbody::-webkit-scrollbar {
            width: 8px;
        }

        .fixTable_wrap tbody::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 4px;
        }
        .notiDeleteBtn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #ffffff; /* 버튼 배경색 */
            color: #3f3f3f; /* 버튼 텍스트 색상 */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .notiDeleteBtn:hover {
            background-color: #ff473a; /* 버튼에 호버 시 배경색 변경 */
            color: #f8f9fa;
        }

    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example">
<%@ include file="../include/header.jsp"%>
<!-- ########################################################################################################################### -->
<div class="container-fluid">
    <div class="row">
        <div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="sidebarMenuLabel">Company name</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-body-secondary text-uppercase">
                        <span>Admin menu</span>
                        <a class="link-secondary" href="#" aria-label="Add a new report">
                            <svg class="bi"><use xlink:href="#plus-circle"></use></svg>
                        </a>
                    </h6>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active dashboard-link" aria-current="page" href="#">
                                <svg class="bi"><use xlink:href="#house-fill"></use></svg>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 userlist-link" href="#">
                                <svg class="bi"><use xlink:href="#people"></use></svg>
                                User List
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 notice-link" href="#">
                                <svg class="bi"><use xlink:href="#people"></use></svg>
                                Notice
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--사이드바--%>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="py-5 text-center">
                <h2>관리자 페이지</h2>
            </div>
            <br>
            <div class="userlist-section" style="display: none;"> <%--유저 리스트--%>
                <div class="border border-primary-subtle rounded p-3 table-responsive small">
                    <input type="hidden" name="userPagingPg" id="userPagingPg" value="1">
                    <div class="d-flex">
                        <div class="me-2 " style="width:150px">
                            <select class="form-select" id="search-input">
                                <option id="title" value="name">이름</option>
                                <option id="content" value="userId">아이디</option>
                                <option id="writer" value="email">email</option>
                            </select>
                        </div>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" id="search-value" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" id="search-btn" type="submit">Search</button>
                        </form>
                    </div>
                    <div class="fixTable_wrap" >
                        <table class="table table-striped table-sm" role="rows" id="userListTable">
                            <thead>
                                <tr>
                                    <th scope="col">이름</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col">비밀번호</th>
                                    <th scope="col">email</th>
                                    <th scope="col">휴대전화</th>
                                    <th scope="col">가입날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
<%--                    <div id="userPagingDiv" ></div>--%>
                </div>
            </div>

            <div class="row">
                <div class="dashboard-section" style="display: none;">
                    <div class="border border-primary-subtle rounded p-3">
                        <div class="mb-3">
                            <div class="row align-items-center">
                                <div class="col-md-auto">
                                    <div class="py-5 text-center">
                                        <h4>게시물 카테고리 차트</h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <canvas id="myChart3" width="350" height="300"></canvas>
                                        </div>
                                        <div class="col-md-4">
                                            <canvas id="myChart4" width="350" height="300"></canvas>
                                        </div>
                                        <div class="col-md-4">
                                            <canvas id="myChart5" width="350" height="300"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>

                <div class="col-md-6 dashboard-section" style="display: none;"> <!-- 대시보드 영역 -->

                    <div class="border border-primary-subtle rounded p-3">
                        <div class="mb-3">
                            <div class="row align-items-center">
                                <div class="col-md-auto">
                                    <div class="py-5 text-center">
                                        <h4>게시물 생성 차트</h4>
                                    </div>
                                    <canvas id="myChart" width="550" height="500"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 dashboard-section" style="display: none;">
                    <div class="border border-primary-subtle rounded p-3">
                        <div class="mb-3">
                            <div class="row align-items-center">
                                <div class="col-md-auto">
                                    <div class="py-5 text-center">
                                        <h4>신규 가입자 차트</h4>
                                    </div>
                                    <canvas id="myChart2" width="550" height="500"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%@ include file="managerNoticeView.jsp"%>

            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/manager/manager.js"></script>

</body>
</html>