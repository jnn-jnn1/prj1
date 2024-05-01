<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>메인 페이지</title>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
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
</body>
</html>
