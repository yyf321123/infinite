<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/12
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>详情页</title>
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
    <title></title>
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

<section class="bg-gray200 pt-5 pb-5">
    <div class="container">
        <c:forEach items="${list}" var="list">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <article class="card">
                        <img class="card-img-top mb-2" src="${list.pic}" alt="Card image">
                        <div class="card-body">
                            <h1 class="card-title display-4">
                                ${list.name} </h1>
                            <ul>
                                <li>作者：${list.author}</li>
                                <li>出版社:${list.publish}</li>
                                <li>出版方:${list.publisher}</li>
                                <li>出版年:${list.year}</li>
                                <li>页数:${list.page}</li>
                                <li>定价:${list.price}元</li>
                                <li>装帧:${list.binding}</li>
                                <li>ISBN:${list.ISBN}</li>
                            </ul>
                            <small class="d-block"><a class="btn btn-sm btn-gray200" href="${pageContext.request.contextPath}/insertCollect?user_id=${sessionScope.user_id}&id=${list.id}"><i class="fa fa-external-link"></i> 加入收藏夹</a></small>
                            <!-- Begin Comments -replace demowebsite with your own id
                            ================================================== -->
                            <div id="comments" class="mt-4">
                                <div id="disqus_thread">
                                </div>
                                <script type="text/javascript">
                                    var disqus_shortname = 'demowebsite';
                                    var disqus_developer = 0;
                                    (function() {
                                        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                                        dsq.src = window.location.protocol + '//' + disqus_shortname + '.disqus.com/embed.js';
                                        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                                    })();
                                </script>
                                <noscript>
                                    Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a>
                                </noscript>
                            </div>
                            <b><h3>内容简介</h3></b>
                            ${list.content_in}
                            <b><h3>作者简介</h3></b>
                            ${list.author_in}
                            <b><h3>目录</h3></b>
                                ${list.directory}
                            <!--End Comments
                            ================================================== -->
                        </div>
                    </article>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="container-fluid mt-5">
        <div class="row">
            <h5 class="font-weight-bold">更多相关书籍</h5>
            <div class="card-columns">
                <c:forEach items="${list2}" var="list2">
                        <div class="card card-pin">
                            <img class="card-img" src="${list2.pic}" alt="Card image">
                            <div class="overlay">
                                <h2 class="card-title title">${list2.name}</h2>
                                <div class="more">
                                    <a href="${pageContext.request.contextPath}/desc?id=${list2.id}&type_id=${list2.type_id}">
                                        <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 详情 </a>
                                </div>
                            </div>
                        </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    /*书籍重复收藏提示*/
    var booksAlreadyExist = "${booksAlreadyExist}";
    if(booksAlreadyExist != ''){
        alert(booksAlreadyExist);
        window.location.href="${pageContext.request.contextPath}/index";
    }
</script>
</html>

