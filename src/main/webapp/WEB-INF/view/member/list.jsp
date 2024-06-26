<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 목록</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>이메일</th>
                    <th>암호</th>
                    <th>별명</th>
                    <th>가입일시</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${memberList}" var="member">
                    <c:url var="memberLink" value="/member">
                        <c:param name="id" value="${member.id}"/>
                    </c:url>
                    <tr>
                        <td>${member.id}</td>
                        <td>
                            <a href="${memberLink}">${member.email}</a>
                        </td>
                        <td>${member.password}</td>
                        <td>${member.nickName}</td>
                        <td>${member.inserted}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
