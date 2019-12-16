<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Prime Number</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css">
    </head>
    <body style="padding: 15px">
        <form class="pure-form" method="post" action="./calc">
            <fieldset>
                <legend>Prime Number</legend>
                <input type="number" placeholder="請輸入數字" name="number" value="${n}"><p />
                <button type="submit" class="pure-button pure-button-primary">檢查</button><p />
                ${result}
            </fieldset>
        </form>
    </body>
</html>

