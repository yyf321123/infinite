<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/4/17
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>注册页</title>

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
    <h1>注册“无限”</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>注册</h2>
                <form action="${pageContext.request.contextPath}/signup" method="post">
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input name="user_nickname" type="text" placeholder="请输入昵称" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input id="user_password" name="user_password" type="Password" placeholder="请输入密码" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input onblur="pwd()" id="reUser_password" name="reUser_password" type="Password" placeholder="请确认密码" required=""><span id="tips"></span></input>
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input id="user_protection" name="user_protection" type="text" placeholder="请输入密保（0-20个字符）" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input onblur="pro()" id="reUser_protection" name="reUser_protection" type="text" placeholder="请确认密保" required=""><span id="tips2"></span></input>
                    </div>
                    <button id="submit" class="btn btn-primary btn-block" type="submit">注册</button>
                </form>

                <p class="account">已经有账号？ <a href="${pageContext.request.contextPath}/pages/login.jsp">登录</a></p>
            </div>
        </div>
        <!-- //main content -->
    </div>
    <!-- //container -->
</div>

<!-- fontawesome v5-->
<script src="${pageContext.request.contextPath}/pages/js/fontawesome.js"></script>
<script>
    function pwd() {
        /* 判断两次输入的密码是否相同 */
        var pwd1 = document.getElementById("user_password").value;
        var pwd2 = document.getElementById("reUser_password").value;
        if(pwd1 != pwd2){
            document.getElementById("tips").innerHTML="<br><font color='red'>两次密码输入不一致</font>";
            document.getElementById("submit").onclick = function(){
                return false;
            };
        } else {
            document.getElementById("tips").innerHTML="";
            document.getElementById("tips").innerHTML="<br><font color='green'>两次密码输入一致</font>";
            document.getElementById("submit").onclick = function(){
                return true;
            };
        }
    }

    function pro() {
        /* 判断两次输入的密保是否相同 */
        var pro1 = document.getElementById("user_protection").value;
        var pro2 = document.getElementById("reUser_protection").value;
        if(pro1 != pro2){
            document.getElementById("tips2").innerHTML="<br><font color='red'>两次密保输入不一致</font>";
            document.getElementById("submit").onclick = function(){
                return false;
            };
        } else {
            document.getElementById("tips2").innerHTML="";
            document.getElementById("tips2").innerHTML="<br><font color='green'>两次密保输入一致</font>";
            document.getElementById("submit").onclick = function(){
                return true;
            };
        }
    }
</script>
</body>

</html>
