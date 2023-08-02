<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/17
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>修改密码页</title>

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
    <h1>修改密码，找回“无限”</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>修改密码</h2>
                <form action="${pageContext.request.contextPath}/update" method="post">
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input name="user_id" type="text" placeholder="请输入用户名" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input name="user_password1" type="Password" placeholder="请输入密码" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input name="user_password2" type="Password" placeholder="请再次输入密码" required="">
                    </div>
                    <button class="btn btn-primary btn-block" type="submit">修改</button>
                </form>
            </div>
        </div>
        <!-- //main content -->
    </div>
    <!-- //container -->
</div>

<!-- fontawesome v5-->
<script src="${pageContext.request.contextPath}/pages/js/fontawesome.js"></script>
<script type="text/javascript">
    /* 账号错误提示 */
    var accountNotFound = "${accountNotFound}";
    if(accountNotFound != ''){
        alert(accountNotFound);
        window.location.href="${pageContext.request.contextPath}/pages/update.jsp";
    }

    /* 两次输入的密码不相同提示 */
    var passwordError = "${passwordError}";
    if(passwordError != ''){
        alert(passwordError);
        window.location.href="${pageContext.request.contextPath}/pages/update.jsp";
    }
</script>

</body>

</html>