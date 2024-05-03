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
            <h3 class="mb-4">회원 정보 수정</h3>
            <form action="/member/modify" method="post" onsubmit="return confirm('저장하시겠습니까?')">
                <input type="hidden" name="id" value="${member.id}">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">
                        이메일
                    </label>
                    <input id="inputEmail" type="text" class="form-control-plaintext" value="${member.email}">
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">
                        패스워드
                    </label>
                    <input id="inputPassword" type="text" class="form-control" name="password">
                    <div class="form-text">
                        암호를 입력하지 않으면 기존 암호로 유지됩니다
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPasswordCheck" class="form-label">패스워드 확인</label>
                    <input oninput="passwordCheck()" id="inputPasswordCheck" type="password"
                           class="form-control">
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-label">
                        별명
                    </label>
                    <input id="inputNickName" type="text" class="form-control" name="nickName"
                           value="${member.nickName}">
                </div>
                <div>
                    <button class="btn btn secondary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function passwordCheck() {
        const password = document.querySelector("#inputPassword").value;
        const passwordCheck = document.querySelector("#inputPasswordCheck").value;

        if (password != passwordCheck) {
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치하지 않습니다";
        } else {
            document.querySelector("#passwordMessage").textContent = "";
        }
    }

    function checkValues() {
        const password = document.getElementById("inputPassword").value;
        const passwordCheck = document.getElementById("inputPasswordCheck").value;

        if (password != "" && passwordCheck == password) {
            return true;
        } else {
            alert("패스워드가 일치하지 않습니다");
            return false;
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
