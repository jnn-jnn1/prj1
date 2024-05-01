<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>메인 페이지</title>
</head>
<body>
<h3>게시물 목록</h3>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>제목</th>
        <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="boardList" var="list">
        <tr>
            <td>${list.id}</td>
            <td>${list.title}</td>
            <td>${list.writer}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
