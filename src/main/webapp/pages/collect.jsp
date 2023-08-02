<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/12
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>收藏夹</title>
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
            <c:forEach items="${list_user}" var="user">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/center"><img class="rounded-circle mr-2" src="${user.user_pic}" width="30"><span class="align-middle">${user.user_nickname}</span></a>
                </li>
            </c:forEach>

        </ul>
    </div>
</nav>
<main role="main">
    <br>
    <br>
    <br>
    <div class="container-fluid">
        <div class="row">
            <div class="card-columns">
                <c:forEach items="${list}" var="list">
                    <div class="card card-pin">
                        <img class="card-img" src="${list.pic}" alt="Card image">
                        <div class="overlay">
                            <h2 class="card-title title">${list.name}</h2>
                            <div class="more">
                                <a href="${pageContext.request.contextPath}/desc?id=${list.id}&type_id=${list.type_id}">
                                    <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 详情 </a>&nbsp;&nbsp;&nbsp;
                                <a onclick="return confirm('是否取消收藏这本书？')" href="${pageContext.request.contextPath}/deleteCollect?collect_id=${list.collect.collect_id}">
                                    <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 移出收藏夹 </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

</main>

<script src="assets/js/app.js"></script>
<script src="assets/js/theme.js"></script>


</body>

</html>

