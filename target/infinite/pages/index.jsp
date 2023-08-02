<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/12
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>无限</title>
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

<%--<c:if test="${sessionScope.user_id == null}">
    <% response.sendRedirect("pages/login.jsp"); %>
</c:if>--%>

<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <a class="navbar-brand font-weight-bolder mr-3" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/pages/assets/img/无限.png"></a>
    <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsDefault">
        <ul class="navbar-nav mr-auto align-items-center">
            <form action="${pageContext.request.contextPath}/index" class="bd-search hidden-sm-down">
                <input name="name" type="text" class="form-control bg-graylight border-0 font-weight-bold" id="search-input" placeholder="请输入书名..." autocomplete="off">
                <input type="submit" value="搜索" hidden>
            </form>
        </ul>
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
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg style="margin-top:10px;" class="_3DJPT" version="1.1" viewbox="0 0 32 32" width="21" height="21" aria-hidden="false" data-reactid="71"><path d="M7 15.5c0 1.9-1.6 3.5-3.5 3.5s-3.5-1.6-3.5-3.5 1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5zm21.5-3.5c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5zm-12.5 0c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5z" data-reactid="22"></path></svg>
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow-lg" aria-labelledby="dropdown02">
                    <a style=" color: gray; text-decoration: none; margin-left: 45px;" href="${pageContext.request.contextPath}/center">个人中心</a>
                    <a style=" color: gray; text-decoration: none; margin-left: 45px;" href="${pageContext.request.contextPath}/queryUsersByIdForUpdateUsers">账号管理</a>
                    <a style="text-decoration: none; margin-left: 45px;" href="${pageContext.request.contextPath}/quit">退出登录</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<main role="main">


    <section class="mt-4 mb-5">
        <div class="container mb-4">
            <h1 class="font-weight-bold title"><a style="text-decoration: none;" href="${pageContext.request.contextPath}/index">分类</a></h1>
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-white pl-2 pr-2">
                    <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExplore" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarsExplore">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a name="type_id" class="nav-link" href="${pageContext.request.contextPath}/index?type_id=1">小说</a>
                            </li>
                            <li class="nav-item">
                                <a name="type_id" class="nav-link" href="${pageContext.request.contextPath}/index?type_id=2">随笔</a>
                            </li>
                            <li class="nav-item">
                                <a name="type_id" class="nav-link" href="${pageContext.request.contextPath}/index?type_id=3">散文</a>
                            </li>
                            <li class="nav-item">
                                <a name="type_id" class="nav-link" href="${pageContext.request.contextPath}/index?type_id=4">诗歌</a>
                            </li>
                            <li class="nav-item">
                                <a name="type_id" class="nav-link" href="${pageContext.request.contextPath}/index?type_id=5">名著</a>
                            </li>
                            <li class="nav-item">
                                <a name="type_id" class="nav-link" href="${pageContext.request.contextPath}/index?type_id=6">童话</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
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
                                        <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 详情 </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

</main>

<script src="${pageContext.request.contextPath}/pages/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/pages/assets/js/theme.js"></script>
<script>console.log(${sessionScope.user_id})</script>


</body>

</html>

