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
    <h1>修改密码和密保</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>修改密码和密保信息</h2>
                <form action="${pageContext.request.contextPath}/updatePwd" method="post">
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input name="user_password" type="password" placeholder="请输入原密码">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input id="user_password1" name="user_password1" type="text" placeholder="请输入新密码">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input id="user_password2" onblur="pwd()" name="user_password2" type="text" placeholder="请确认新密码"><span id="tips"></span></input>
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input name="user_protection" type="text" placeholder="请输入原密保">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input id="user_protection1" name="user_protection1" type="text" placeholder="请输入新密保">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input id="user_protection2" onblur="pro()" name="user_protection2" type="text" placeholder="请确认新密保"><span id="tips2"></span></input>
                    </div>
                    <input id="submit" class="btn btn-primary btn-block" type="submit" value="确认修改" />
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
    /* 密码错误提示 */
    var passwordError = "${passwordError}";
    if(passwordError != ''){
        alert(passwordError);
        window.location.href="${pageContext.request.contextPath}/pages/updatePwd.jsp";
    }

    /* 密保提示 */
    var protectionError = "${protectionError}";
    if(protectionError != ''){
        alert(protectionError);
        window.location.href="${pageContext.request.contextPath}/pages/updatePwd.jsp";
    }

    /* 修改成功，重新登录提示 */
    var reLogin = "${reLogin}";
    if(reLogin != ''){
        alert(reLogin);
        window.location.href="${pageContext.request.contextPath}/quit";
    }

    function pwd() {
        /* 判断两次输入的密码是否相同 */
        var pwd1 = document.getElementById("user_password1").value;
        var pwd2 = document.getElementById("user_password2").value;
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
        var pro1 = document.getElementById("user_protection1").value;
        var pro2 = document.getElementById("user_protection2").value;
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
