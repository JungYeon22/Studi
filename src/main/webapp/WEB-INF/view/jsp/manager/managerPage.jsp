<%--
  Created by IntelliJ IDEA.
  User: 82106
  Date: 2024-04-02
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>managerPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
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
<body data-bs-spy="scroll" data-bs-target="#navbar-example">
<%@ include file="../include/header.jsp"%>
<!-- ########################################################################################################################### -->
<div class="container mt-5">
    <main>
        <div class="py-5 text-center">
            <h2>관리자 페이지</h2>
        </div>

        <br>
<%--        <table border="1" frame="hsides" role="rows" id="userListTable">
            <tr>
                <th>이름</th>
                <th>아이디</th>
                <th>비밀번호</th>
            </tr>

            <!-- 동적 처리 -->
        </table>

        <!-- 페이징 처리 -->
        <div id="userPagingDiv" >~~~</div>--%>

        <h4 class="mb-3">
            <span class="text-primary">유저 리스트</span>
        </h4>
        <div class="border border-primary-subtle rounded p-3 table-responsive small">
            <input type="hidden" name="userPagingPg" id="userPagingPg" value="1">
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
            <div id="userPagingDiv" ></div>
        </div>


        <div class="row">
            <div class="col-md-6"> <!-- 왼쪽 영역 -->
                <h3 class="mb-3">대시 보드
                </h3>
                <div class="border border-primary-subtle rounded p-3">
                    <div class="mb-3">
                        <div class="row align-items-center">
                            <div class="col-md-auto">
                                <canvas id="myChart" width="550" height="500"></canvas>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <div class="mb-3">
                        <div class="row align-items-center">
                            <div class="col-md-auto">
                                <canvas id="myChart2" width="550" height="500"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6"> <!-- 오른쪽 영역 -->

                <h4 class="mb-3">
                    <span class="text-primary">신고 리스트</span>
                </h4>
                <div class="border border-primary-subtle rounded p-3">
                    <div class="accordion accordion-flush" id="accordion2">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                    모두보기
                                </button>
                            </h2>
                            <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordion2">
                                <div class="accordion-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">박</text></svg></span>
                                            <a href="#">박정연</a>
                                        </div>
                                        <div>
                                            <a href="#">금지</a> /
                                            <a href="#" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                                        </div>
                                    </div>
                                    <p>욕설 / 비방</p>
                                    <hr>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">김</text></svg></span>
                                            <a href="#">김태진</a>
                                        </div>
                                        <div>
                                            <a href="#">금지</a> /
                                            <a href="#" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                                        </div>
                                    </div>
                                    <p>광고 홍보</p>
                                    <hr>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <span><svg class="rounded-circle border center" width="32" height="32" viewBox="0 0 64 64" preserveAspectRatio="xMinYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><rect width="64" height="64" fill="hsl(29, 100%, 90%)"></rect><text x="50%" y="55%" dominant-baseline="middle" text-anchor="middle" font-size="32" font-weight="600" fill="black">이</text></svg></span>
                                            <a href="#">이동우</a>
                                        </div>
                                        <div>
                                            <a href="#">금지</a> /
                                            <a href="#" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                                        </div>
                                    </div>
                                    <p>음란성 게시물 배포</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <h4 class="mb-3 mt-3">
                    <span class="text-primary">공지사항</span>
                    <button class="btn btn-primary btn-sm" type="submit">새글쓰기</button>
                </h4>
                <div class="border border-primary-subtle rounded p-3">
                    <div class="d-grid gap-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="font-large">공지사항1</a>
                            <div>
                                <a href="#">수정</a> /
                                <a href="#" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                            </div>
                        </div>
                        <p class="font-large mb-0">공지사항 내용</p>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="font-large">공지사항2</a>
                            <div>
                                <a href="#">수정</a> /
                                <a href="#" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                            </div>
                        </div>
                        <p class="font-large mb-0">공지사항 내용</p>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="font-large">공지사항3</a>
                            <div>
                                <a href="#">수정</a> /
                                <a href="#" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                            </div>
                        </div>
                        <p class="font-large mb-0">공지사항 내용</p>
                        <button class="btn btn-outline-*">모두보기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script>
    function loadUserList(pg) {
        $.ajax({
            type: 'POST',
            url: '/admin/managerPage/getUserList',
            data: {pg: pg}, // 클릭한 페이징 번호를 사용하여 데이터 요청
            dataType: 'json',
            success: function (data) {
                console.log(JSON.stringify(data));
                // 사용자 리스트 표시
                var userListTable = $('#userListTable tbody');
                userListTable.empty();
                $.each(data.list, function (index, items) {
                    var result = `<tr>`
                        + `<td >` + items.name + `</td>`
                        + `<td ><a href="#" class="idA">` + items.userid + `</a></td>`
                        + `<td >` + items.pwd + `</td>` + `</a></td>`
                        + `<td >` + items.email + `</td>` + `</a></td>`
                        + `<td >` + items.phone + `</td>` + `</a></td>`
                        + `<td >` + items.hiredate + `</td>`
                        + `</tr>`;
                    userListTable.append(result);
                });

                // 페이징 처리
                $('#userPagingDiv').html(data.managerPaging.pagingHTML);
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    $(document).ready(function() {
        $('#userPagingDiv').on('click', '.paging', function() {
            var pg = $(this).text();
            loadUserList(pg);
        });

        // 페이지 로드 시 초기 데이터 로딩
        loadUserList($('#userPagingPg').val());

        $(function() {
            $.ajax({
                type: 'POST',
                url: '/admin/managerPage/boardUpload',
                dataType: 'json',
                <%--data:${signupData},--%>
                success: function(data) {
                    console.log(JSON.stringify(data));

                    var labelList = [];
                    var valueList = [];

                    for (var i = 0; i < data.length; i++) {
                        var d = data[i];
                        console.log(d.date);
                        console.log(d.upload);
                        labelList.push(d.date);
                        valueList.push(d.upload);
                    }

                    const ctx = document.getElementById('myChart').getContext('2d');
                    var data = {
                        labels: labelList,
                        datasets: [{
                            label: '게시물 업로드 개수',
                            data: valueList,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    };

                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: data,
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });


    // ************************************************************************************************

        $(function() {
            $.ajax({
                type: 'POST',
                url: '/admin/managerPage/signupCounts',
                dataType: 'json',
                <%--data:${signupData},--%>
                success: function(data) {
                    console.log(JSON.stringify(data));

                    var labelList = [];
                    var valueList = [];

                    for (var i = 0; i < data.length; i++) {
                        var d = data[i];
                        labelList.push(d.date);
                        valueList.push(d.signups);
                    }

                    const ctx2 = document.getElementById('myChart2').getContext('2d');
                    var data = {
                        labels: labelList,
                        datasets: [{
                            label: '가입자',
                            data: valueList,
                            borderColor: 'rgba(255, 99, 132, 1)',
                            backgroundColor: 'rgba(255, 0, 0, 0.5)',
                            yAxisID: 'y',
                        }]
                    };

                    const myChart2 = new Chart(ctx2, {
                        type: 'line',
                        data: data,
                        options: {
                            responsive: true,
                            interaction: {
                                mode: 'index',
                                intersect: false,
                            },
                            stacked: false,
                            plugins: {
                                title: {
                                    display: true,
                                }
                            },
                            scales: {
                                y: {
                                    type: 'linear',
                                    display: true,
                                    position: 'left',
                                },
                                y1: {
                                    type: 'linear',
                                    display: true,
                                    position: 'right',
                                    grid: {
                                        drawOnChartArea: false,
                                    },
                                },
                            }
                        },
                    });
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
    });

</script>
</body>
</html>