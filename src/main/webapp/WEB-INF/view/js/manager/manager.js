$(function() {
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
                    var reportCnt = items.reportCnt;
                    var result2 = "";
                    if (reportCnt >= 3){
                        result2 = `<button type="button" class="btn btn-outline-secondary btn-sm banBtn">회원추방</button>`;
                    }

                    var result = `<tr xmlns:c="http://www.w3.org/1999/html">`
                        + `<td class="name">` + items.name + `</td>`
                        + `<td class="userId">` + items.userid + `</a></td>`
                        + `<td class="pwd">` + items.pwd + `</td>` + `</a></td>`
                        + `<td class="email">` + items.email + `</td>` + `</a></td>`
                        + `<td class="phone">` + items.phone + `</td>` + `</a></td>`
                        + `<td >` + items.hiredate + `</td>`
                        + `<td >`+ items.reportCnt +`</td>` + `<td >`+ result2 + `</td>`
                        + `</tr>`;
                    userListTable.append(result);
                });

            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function loadUserList2(pg,input,value) {
        $.ajax({
            type: 'POST',
            url: '/admin/managerPage/getUserList2',
            dataType: 'json',
            data:{
                input: input,
                value: value,
                pg: pg},
                success: function(data) {
                    console.log(JSON.stringify(data));
                    // 사용자 리스트 표시
                    var userListTable = $('#userListTable tbody');
                    var reportCnt = items.reportCnt;
                    var result2 = "";
                    if (reportCnt >= 3){
                        result2 = `<button type="button" class="btn btn-outline-secondary btn-sm banBtn">회원추방</button>`;
                    }
                    userListTable.empty();
                    $.each(data.list, function (index, items) {
                        var result = `<tr>`
                            + `<td class="name">` + items.name + `</td>`
                            + `<td class="userId">` + items.userid + `</a></td>`
                            + `<td class="pwd">` + items.pwd + `</td>` + `</a></td>`
                            + `<td class="email">` + items.email + `</td>` + `</a></td>`
                            + `<td class="phone">` + items.phone + `</td>` + `</a></td>`
                            + `<td >` + items.hiredate + `</td>`
                            + `<td >`+ items.reportCnt +`</td>`
                            + `<td >`+ items.reportCnt +`</td>` + `<td >`+ result2 + `</td>`
                            + `</tr>`;
                        userListTable.append(result);
                    });

                },
                error: function(e) {
                    console.log(e);
                }
        });
    }

    function loadDashboard1(url){
        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'json',
            success: function(data) {
                var labelList = [];
                var valueList = [];

                for (var i = 0; i < data.length; i++) {
                    var d = data[i];
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
        function changeDropdown(obj) {
            let DrondwonValue = $(obj).val();
            $('#search-input').attr('name', DrondwonValue);
        }
        function searchEvt() {
            searchBoard();
        };
    }

    function loadDashboard2(url){
        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'json',
            success: function(data) {
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
                        }
                    },
                });
            },
            error: function(e) {
                console.log(e);
            }
        });
    }

    function loadDashboard3(url){
        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'json',
            success: function(data) {
                var labelList = [];
                var valueList = [];
                const colors = [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ];

                for (var i = 0; i < data.length; i++) {
                    var d = data[i];
                    labelList.push(d.projectType);
                    valueList.push(d.projectType_count);
                }

                const ctx = document.getElementById('myChart3').getContext('2d');
                var data = {
                    labels: labelList,
                    datasets: [{
                        label: '카테고리1',
                        data: valueList,
                        backgroundColor: colors,
                    }]
                };

                const myChart3 = new Chart(ctx, {
                    type: 'pie',
                    data: data,
                    options: {
                        title: {
                            display: true,
                            text: ''
                        }
                    }
                });
            },
            error: function(e) {
                console.log(e);
            }
        });
    }

    function loadDashboard4(url){
        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'json',
            success: function(data) {
                var labelList = [];
                var valueList = [];
                const colors = [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ];

                for (var i = 0; i < data.length; i++) {
                    var d = data[i];
                    labelList.push(d.projectField);
                    valueList.push(d.projectField_count);
                }

                const ctx = document.getElementById('myChart4').getContext('2d');
                var data = {
                    labels: labelList,
                    datasets: [{
                        label: '카테고리2',
                        data: valueList,
                        backgroundColor: colors,
                    }]
                };

                const myChart4 = new Chart(ctx, {
                    type: 'pie',
                    data: data,
                    options: {
                        title: {
                            display: true,
                            text: ''
                        }
                    }
                });
            },
            error: function(e) {
                console.log(e);
            }
        });
    }

    function reportList(url) {
        $.ajax({
            type: 'POST',
            url: url,//'/admin/managerPage/reportList',
            dataType: 'json',
            success: function(data) {
                // 사용자 리스트 표시
                var reportListTable = $('#reportList');
                reportListTable.empty();
                $.each(data.list, function (index, items) {
                    var result = (items.status == 1 || items.status == 2) ? `<div class="d-flex justify-content-between align-items-center"><div>`
                        + `<a href="#"><h5>` + items.userId + `</h5></a></div>`
                        + `<div><input type="hidden" value=`+ items.reportNum+`><button type="button" class="btn btn-primary reportBtn" data-bs-toggle="modal" data-bs-target="#reportModal">확인 </button></div></div>`
                        + `<p><h4>` + items.content+ `</h4></p>`
                        + `<hr>` : ``;
                    reportListTable.append(result);
                });
            },
            error: function(e) {
                console.log(e);
            }
        });
    }


    function reportSelect(reportNum) {
        $.ajax({
            type: 'POST',
            url: '/admin/managerPage/reportSelect',
            data: {reportNum : reportNum},
            dataType: 'json',
            success: function(data) {
                // 사용자 리스트 표시
                var reportContent = $('#reportContent');
                reportContent.empty();
                $.each(data.list, function (index, items) {
                    var result = `<div class="mb-3 row"><label for="userId" class="col-sm-2 col-form-label">신고자</label>`
                        + `<div class="col-sm-10"><input type="text" readonly class="form-control-plaintext" id="userId" value="` + items.userId + `"></div></div>`
                        + `<div class="mb-3 row">`
                        + `<label for="targetId" class="col-sm-2 col-form-label">대상자</label>`
                        + `<div class="col-sm-10"><input type="text" readonly class="form-control-plaintext" id="targetId" value="` + items.targetId + `"></div></div>`
                        + `<div class="mb-3 row">`
                        + `<label for="content" class="form-label">신고내용</label>`
                        + `<div class="col-sm-10"><input type="text" readonly class="form-control-plaintext" id="content" value="` + items.content + `"></div></div>`
                        + `<select class="form-select form-select-sm" aria-label="Small select example">`
                        + `<option selected>신고 처리</option>`
                        + `<option value="2">처리 중</option>`
                        + `<option value="3">이상 없음</option>`
                        + `<option value="4">댓글 삭제</option>`
                        + `<option value="5">게시물 삭제</option>`
                        + `<option value="6">회원 경고</option>`
                        + `<option value="7">회원 추방</option>`
                        + `<input type="hidden" value="`+ items.reportNum+`"></select>`;

                    reportContent.append(result);
                });
            },
            error: function(e) {
                console.log(e);
            }
        });

    }
    function reportStatus(reportNum, select){
        $.ajax({
            type: 'POST',
            url: '/admin/managerPage/reportStatus',
            data: {reportNum : reportNum,
                    status : select},
            success: function(data){
                alert("신고처리를 완료하였습니다.");
                location.reload();
            },
            error: function(e) {
                console.log(e);
            }
        });
    }


    $(document).ready(function() {
        // 대시보드 섹션을 보여줍니다.
        $(".dashboard-section").show();

        // 기존에 활성화된 항목들을 비활성화합니다.
        $(".nav-link").removeClass("active");
        $(this).addClass("active");

        $(function() {
            loadDashboard1('/admin/managerPage/boardUpload');
            loadDashboard2('/admin/managerPage/signupCounts');
            loadDashboard3('/admin/managerPage/pichart1');
            loadDashboard4('/admin/managerPage/pichart2');
        });

        $(".userlist-link").click(function(e) {
            e.preventDefault(); // 기본 동작 방지

            $("[class$='-section']").hide();

            $(".userlist-section").show();

            // 기존에 활성화된 항목들을 비활성화합니다.
            $(".nav-link").removeClass("active");
            $(this).addClass("active");
            // 페이지 로드 시 초기 데이터 로딩
            loadUserList($('#userPagingPg').val());
            $('#userPagingDiv').on('click', '.paging', function() {
                var pg = $(this).text();
                loadUserList(pg);
            });
        });

        // 대시보드 링크를 클릭했을 때
        $(".dashboard-link").click(function(e) {
            e.preventDefault(); // 기본 동작 방지

            $("[class$='-section']").hide();

            // 대시보드 섹션을 보여줍니다.
            $(".dashboard-section").show();

            // 기존에 활성화된 항목들을 비활성화합니다.
            $(".nav-link").removeClass("active");
            $(this).addClass("active");

            $(function() {
                loadDashboard1('/admin/managerPage/boardUpload');
                loadDashboard2('/admin/managerPage/signupCounts');
                loadDashboard3('/admin/managerPage/pichart1');
                loadDashboard4('/admin/managerPage/pichart2');
            });
        });


        // 알림 링크를 클릭했을 때
        $(".notice-link").click(function(e) {
            e.preventDefault(); // 기본 동작 방지

            $("[class$='-section']").hide();

            $(".notice-section").show();

            // 기존에 활성화된 항목들을 비활성화합니다.
            $(".nav-link").removeClass("active");
            $(this).addClass("active");

            $(function (){
                reportList('/admin/managerPage/reportList');
            });
        });

        //유저리스트 유저 검색
        $("#search-btn").click(function(e) {
            e.preventDefault();

            var input = $('#search-input option:selected').val();
            var value = $('#search-value').val();
            var pg =$('#userPagingPg').val();
            loadUserList2(pg,input,value);

            $('#userPagingDiv').on('click', '.paging', function() {
                var pg = $(this).text();
                loadUserList2(pg,input,value);
            });
        });


        $(document).on('click', '.reportBtn',function(e){
            e.preventDefault();

            var reportNum = $(this).siblings('input[type="hidden"]').val();
            $(function (){
                reportSelect(reportNum);
            });
        });

        $("#reportSaveBtn").click(function(e) {
            e.preventDefault();
            var select= $('#reportContent select.form-select').val();
            var reportNum = $('#reportContent input[type="hidden"]').val();
            reportStatus(reportNum,select);
        });

        $(document).on('click', '.banBtn',function(e){
            e.preventDefault();
            if(confirm("회원을 추방시키겠습니까?")){
                $.ajax({
                    type: 'POST',
                    url: '/admin/managerPage/userBan',
                    dataType: 'text',
                    data:{
                        userId:$(this).closest("tr").find(".userId").text(),
                        name:$(this).closest("tr").find(".name").text(),
                        email:$(this).closest("tr").find(".email").text(),
                        phone:$(this).closest("tr").find(".phone").text(),
                        },
                    success:function(data){
                        alert("회원 추방을 완료하였습니다.");
                        location.reload();
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
            }
        });
    });
});
