<%--
  Created by IntelliJ IDEA.
  User: jungyeon
  Date: 2024-03-29
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header >
    <nav class="navbar navbar-expand-lg bg-body-tertiary opacity-20" id="navbarall">
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
</header>