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
    <title>登录页</title>

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
    <h1>登录后更精彩</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>登录</h2>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input name="user_id" type="text" placeholder="请输入用户名" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input name="user_password" type="Password" placeholder="请输入密码" required="">
                    </div>
                    <div class="form-row bottom">
                        <div class="form-check">
                            <input type="checkbox" id="remenber" name="remenber" value="remenber">
                            <label for="remenber"> 记住密码？</label>
                        </div>
                        <a href="${pageContext.request.contextPath}/pages/find.jsp" class="forgot">忘记密码？</a>
                    </div>
                    <button class="btn btn-primary btn-block" type="submit">登录</button>
                </form>
                <p class="account">没有账号？ <a href="${pageContext.request.contextPath}/pages/signup.jsp">注册</a></p>
            </div>
        </div>
        <!-- //main content -->
    </div>
    <!-- //container -->
</div>

<!-- fontawesome v5-->
<script src="${pageContext.request.contextPath}/pages/js/fontawesome.js"></script>
<script>${alert}</script>
<script>alert("注册成功！！账号为"+${userId})</script>

</body>

</html>
