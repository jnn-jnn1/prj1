<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <h3 class="mb-4">${member.id}번 회원 정보</h3>
            <div>
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">
                        이메일
                    </label>
                    <input value="${member.email}" id="inputEmail" type="text" readonly class="form-control">
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">
                        패스워드
                    </label>
                    <input id="inputPassword" value="${member.password} " type="text" readonly class="form-control">
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-label">
                        별명
                    </label>
                    <input id="inputNickName" value="${member.nickName}" type="text" readonly class="form-control">
                </div>
                <div class="mb-3">
                    <label for="inputInserted" class="form-label">
                        가입일시
                    </label>
                    <input id="inputInserted" value="${member.inserted}" type="datetime-local" readonly
                           class="form-control">
                </div>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.member" var="authMember"/>
                    <c:if test="${authMember.id eq member.id}">
                        <div>
                            <button class="btn btn-danger" form="formDelete">탈퇴</button>
                            <a class="btn btn secondary" href="member/modify?id=${member.id}">정보 수정</a>
                        </div>
                    </c:if>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="authMember"/>
    <c:if test="${authMember.id eq member.id}">
        <div class="d-none" onsubmit="return confirm('탈퇴하시겠습니까?')">
            <form action="/member/remove" id="formDelete" method="post">
                <input type="hidden" name="id" value="${member.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
