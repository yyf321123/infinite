<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/17
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>修改账号信息页</title>

    <!-- Meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google fonts -->
    <link href="//fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    <!-- CSS Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/style.css" type="text/css" media="all" />

</head>

<body>
<div class="signinform">
    <h1>修改个人信息</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>修改账号信息</h2>
                <form action="${pageContext.request.contextPath}/updateUser" method="post" enctype="multipart/form-data">
                    <c:forEach items="${list}" var="list">
                        <div class="input-group">
                            <label>账号</label>
                            <input value="${list.user_id}" readonly name="user_id" type="text" required="">
                        </div>
                        <div class="input-group">
                            <label>昵称</label>
                            <input value="${list.user_nickname}" name="user_nickname" type="text" placeholder="请输入昵称" required="">
                        </div>
                        <div class="input-group">
                            <label>头像</label>
                            <img src="${list.user_pic}" width="100px"><br><br>
                            <input name="file" type="file">
                        </div>
                        <div class="input-group">
                            <label>个性签名</label>
                            <input value="${list.user_signature}" name="user_signature" type="text" placeholder="请输入个性签名" required="">
                        </div>
                    </c:forEach>
                    <a href="${pageContext.request.contextPath}/pages/updatePwd.jsp" class="forgot">修改密码和密保？</a>
                    <button class="btn btn-primary btn-block" type="submit">确认修改</button>
                </form>
            </div>
        </div>
        <!-- //main content -->
    </div>
    <!-- //container -->
</div>

<!-- fontawesome v5-->
<script src="${pageContext.request.contextPath}/pages/js/fontawesome.js"></script>
</body>

</html>
