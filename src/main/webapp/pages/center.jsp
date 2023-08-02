<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/12
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/assets/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/assets/css/theme.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/pages/assets/img/无限.png">
    <style type="text/css">
        a img{
            height: 50px;
            width: 50px;
        }
    </style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <a class="navbar-brand font-weight-bolder mr-3" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/pages/assets/img/无限.png"></a>
    <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsDefault">
        <ul class="navbar-nav ml-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link active" href="${pageContext.request.contextPath}/index">主页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/collect?user_id=${sessionScope.user_id}">收藏夹</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg style="margin-top:10px;" class="_3DJPT" version="1.1" viewbox="0 0 32 32" width="21" height="21" aria-hidden="false" data-reactid="71"><path d="M7 15.5c0 1.9-1.6 3.5-3.5 3.5s-3.5-1.6-3.5-3.5 1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5zm21.5-3.5c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5zm-12.5 0c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5z" data-reactid="22"></path></svg>
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow-lg" aria-labelledby="dropdown02">
                    <a style=" color: gray; text-decoration: none; margin-left: 45px;" href="${pageContext.request.contextPath}/queryUsersByIdForUpdateUsers">账号管理</a>
                    <a style="text-decoration: none; margin-left: 45px;" href="${pageContext.request.contextPath}/quit">退出登录</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<main role="main">


    <div class="jumbotron border-round-0 min-50vh" style="background-image:url(https://t7.baidu.com/it/u=2992538603,1948110734&fm=193&f=GIF)">
    </div>
    <c:forEach items="${list}" var="list">
        <div class="container mb-4">
            <img src="${list.user_pic}" class="mt-neg100 mb-4 rounded-circle" width="128" height="120">
            <h1 class="font-weight-bold title">${list.user_nickname}</h1>
            <p>
                ${list.user_signature}
            </p>
        </div>
    </c:forEach>
    <br>

</main>

<script src="${pageContext.request.contextPath}/pages/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/pages/assets/js/theme.js"></script>


</body>

</html>

