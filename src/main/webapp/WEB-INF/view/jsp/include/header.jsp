<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header >
    <nav class="navbar navbar-expand-lg bg-body-tertiary opacity-20" id="navbarall">
        <div class="container-fluid">
            <a class="navbar-brand ms-5" href="http://localhost:8080/${pageContext.request.contextPath}"><img src="/image/sutdi.png" width="80" height="50"></a>

            <a class="navbar-brand ms-5" href="${pageContext.request.contextPath}/board/boardListMain"><strong>게시판</strong></a>
            <a class="navbar-brand ms-5" href="${pageContext.request.contextPath}/freeBoard/freeBoardList"><strong>라운지</strong></a>
            <a class="navbar-brand ms-5" href="${pageContext.request.contextPath}/user/myPage"><strong>마이 페이지</strong></a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="position-absolute top-50 start-50 translate-middle">
                    <input id="search" type="search" placeholder="search...">
                </div>
            </div>
            <div class=" position-relative top-0 end-0" style="width: 300px; height: 60px;">
                <ul class="navbar-nav me-auto mb-3 mb-lg-1">
                    <li class="nav-item dropdown">
                        <c:if test="${sessionScope.userDTO != null}" >
                        <a class="nav-link dropdown-toggle " id="navmenu" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            ${sessionScope.userDTO.name}님
                        </a>
                        </c:if>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">회원정보수정</a></li>
                            <li><a class="dropdown-item" href="#">나의 프로젝트</a></li>
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

                    <a type="button" class="uplogin" href="/user/loginForm">로그인</a>
                    <img src="/image/line.png" class="line" width="20px" height="30px" style=" margin: 0;
              margin-top: 15px;">
                    <a type="button" class="upwrite" href="/user/writeForm">회원가입</a>
                </ul>
            </div>
        </div>
    </nav>
</header>