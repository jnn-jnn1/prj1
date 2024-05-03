<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3>게시물 목록</h3>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 50px">#</th>
                    <th>제목</th>
                    <th style="width: 170px">작성자</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList}" var="list">
                    <c:url value="/board" var="viewLink">
                        <c:param name="id" value="${list.id}"/>
                    </c:url>
                    <tr>
                        <td>${list.id}</td>
                        <td>
                            <a href="${viewLink}">${list.title}</a>
                        </td>
                        <td>${list.writer}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <c:forEach begin="1" end="${pageInfo.lastPageNumber}" var="pageNumber">
                <c:url var="pageLink" value="/">
                    <c:param name="page" value="${pageNumber}"/>
                </c:url>
                <a href="${pageLink}">${pageNumber}|</a>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
