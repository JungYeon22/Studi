<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary opacity-20" id="navbarall">
        <div class="container-fluid" id="header-container">
            <a class="navbar-brand ms-5" id="imageA" href="${pageContext.request.contextPath}/"><img src="/image/sutdi.png" width="80" height="50"></a>
            <div>
                <a class="navbar-brand ms-3 menuItem" href="${pageContext.request.contextPath}/board/boardListMain?pg=1"><strong>게시판</strong></a>
                <a class="navbar-brand ms-3 menuItem" href="${pageContext.request.contextPath}/freeBoard/freeBoardList"><strong>라운지</strong></a>
                <c:if test="${sessionScope.userDTO != null}" >
                    <a class="navbar-brand ms-3 menuItem" href="${pageContext.request.contextPath}/user/myPage"><strong>마이 페이지</strong></a>
                </c:if>
            </div>
            <div class=" position-relative top-0 end-0" style="width: 300px; height: 60px;">
                <ul class="navbar-nav me-auto mb-3 mb-lg-1">
                    <c:if test="${sessionScope.userDTO != null}" >
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle " id="navmenu" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            ${sessionScope.userDTO.name}님
                        </a>
                        <ul class="dropdown-menu">
                            <c:if test="${sessionScope.userDTO.userId != 'admin'}">
                            <li><a class="dropdown-item" href="/user/updateForm">회원정보수정</a></li>
                            <li><a class="dropdown-item" href="#">나의 프로젝트</a></li>
                            </c:if>
                            <c:if test="${sessionScope.userDTO.userId == 'admin'}">
                            <li id="adminMenu"><a class="dropdown-item" href="/admin/managerPage">관리자 페이지</a></li>
                            </c:if>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item" href="/user/logout" onclick="confirmLogout();">로그아웃&emsp;&emsp;
                                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.userDTO == null}">
                    <a type="button" class="uplogin" href="/user/loginForm">로그인</a>
                    <img src="/image/line.png" class="line" width="20px" height="30px" style=" margin: 0;
              margin-top: 15px;">
                    <a type="button" class="upwrite" href="/user/writeForm">회원가입</a>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script>
    function confirmLogout() {
        if (confirm("정말 로그아웃 하시겠습니까?")) {
            location.href = "<c:url value='/'/>";
        }
    }

</script>