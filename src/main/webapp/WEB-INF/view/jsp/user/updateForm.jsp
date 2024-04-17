<%--
  Created by IntelliJ IDEA.
  User: 82106
  Date: 2024-04-11
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head class="navbar navbar-expand-lg bd-navbar sticky-top">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원소개 화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/introduceForm.css">

</head>
<body>
<%@ include file="../include/header.jsp"%>

<form class="validation-form" id="updateForm" action="/user/updateForm" method="post" novalidate>
    <div class="input-form-background row mb-0 mt-0">
        <div class="input-form col-md-12 mx-auto">
            <label for="position"><span>주요 포지션</span></label>
            <input type="text" class="form-control" id="position" name="position" placeholder="back-end" required >
        </div>
    </div>
    <div class="input-form-backgroud row mb-0 mt-0 p-1">
        <div class="input-form col-md-12 mx-auto">
            <label for="career"><span>경력/신입</span></label>
            <input type="text" class="form-control" id="career" name="career" placeholder="경력" required >
        </div>
    </div>
    <div class="input-form col-md-12 mx-auto mb-0 mt-0 p-1">
        <label for="skill"><span>사용가능 언어(다중선택)</span></label>
        <div class="skill" id="skill" role="group" aria-label="Basic checkbox toggle button group">
            <input type="hidden" id="arrayParam" name="arrayParam"/>
            <c:forEach var="item" items="${skillList}" varStatus="status">
                <input type="checkbox" class="btn-check" name="skill" id="skill${status.index}" value="${item}">
                <label class="btn btn-outline-dark" for="skill${status.index}">${item}</label>
            </c:forEach>
        </div>
    </div>
    <div class="input-form-backgroud row mb-0 mt-0 p-1">
        <div class="mb-3">
            <div class="input-form col-md-12 mx-auto">
                <label for="introduce"><span>간단한 소개</span></label>
                <input type="text" class="form-control" id="introduce" name="introduce" required >
                <div class="button-container mt-3 col-md-6 ms-auto">
                    <button type="submit" id="insertBtn" class="btn btn-outline-dark btn-lg" >입력</button>
                    <button type="button" id="cancelBtn" class="btn btn-outline-dark btn-lg" >취소</button>
                </div>
            </div>
        </div>
    </div>
</form>

<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/update.js"></script>
<script>
    $(document).ready(function() {
        // 페이지 로드 시 초기화
        updateArrayParam();

        // 체크박스가 변경될 때마다 호출되는 함수
        $('input:checkbox[name=skill]').change(function() {
            updateArrayParam();
        });

        // 취소 버튼 클릭 시 이벤트 처리
        $('#cancelBtn').click(function() {
            history.back();
        });

        // 등록 버튼 클릭 시 이벤트 처리
        $('#insertBtn').click(function () {
            $('#updateForm').submit();
        });
    });

    // #arrayParam 값을 업데이트하는 함수
    function updateArrayParam() {
        var array = []; // 배열 선언
        $('input:checkbox[name=skill]:checked').each(function() {
            array.push(this.value);
        });
        $("#arrayParam").val(array.join(','));
    }
</script>
</body>
</html>
