<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" >
    </head>
    <body style="padding: 15px">
        <form id="myform" name="myform" class="pure-form" method="post">
            <fieldset>
                <legend>Login Form</legend>
                <input type="text" placeholder="請輸入帳號" id="username" name="username"><p/>
                <input type="password" placeholder="請輸入密碼" id="password" name="password"><p/>
                <label for="remember">
                    <input type="checkbox" id="remember" name="remember"> Remember me
                </label><p/>
                <button type="submit" class="pure-button pure-button-primary">Sign in</button><p/>
                ${message}
            </fieldset>
        </form>
    </body>
</html>
