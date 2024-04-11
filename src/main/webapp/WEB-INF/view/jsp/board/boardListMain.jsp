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

<form class="position-relative top-0 start-50 translate-middle-x mt-5" style="width: 50%">
    <br>
    <div class="grid d-flex p-4  py-md-3 ms-2  " >
        <div class="p-2 g-col-6"   >
            <select class="form-select" id="selectLang" aria-label="Default select example" style="background-color: rgb(255, 255, 255);">
                <option selected value="default">언어</option>
                <option value="java">JAVA</option>
                <option value="C">C</option>
                <option value="python">Python</option>
                <option value="c++">C++</option>
                <option value="c#">C#</option>
                <option value="JavaScript">JavaScript</option>
            </select>

        </div>
        <div class="p-2 g-col-6" >
            <select class="form-select" id="selectType" aria-label="Default select example" style="background-color: rgb(255, 255, 255); ">
                <option selected value="default">모집유형</option>
                <option value="project">프로젝트</option>
                <option value="comp">대회</option>
                <option value="skillup">스킬업</option>
            </select>

        </div>
        <div class="p-2 g-col-6" >
            <select class="form-select" id="selectField" aria-label="Default select example" style="background-color: rgb(255, 255, 255);">
                <option selected value="default">모집분야</option>
                <option value="backend">BackEnd</option>
                <option value="frontend">FrontEnd</option>
                <option value="publisher">Publisher</option>
            </select>

        </div>
        <button type="button" class="btn btn-outline-danger rounded-3 btn-sm mt-2" style="height: 40px ; margin-left: 50%; width: 80px ;font-size: small" onclick="location.href='${pageContext.request.contextPath}/board/boardInput'">글쓰기</button>

    </div>
    <div class="hstack gap-3">
    <div id="selectDiv" style="margin-bottom: 10px ; margin-top: 0px; padding-top: 0">
    </div>
    <div id="selectDiv1" style="margin-bottom: 10px ; margin-top: 0px; padding-top: 0">
    </div>
    <div id="selectDiv2" style="margin-bottom: 10px ; margin-top: 0px; padding-top: 0">
    </div>
    </div>



    <div class=" flex-column p-3 flex-md-row gap-4 py-md-0 ">
        <div class="list-group" id="list-group">
            <%--동적 처리 --%>


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

<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%--<script>
    const contextPath = ${pageContext.request.contextPath};
</script>--%>
<script src="${pageContext.request.contextPath}/js/board/boardListMain.js"></script>
</body>
</html>
