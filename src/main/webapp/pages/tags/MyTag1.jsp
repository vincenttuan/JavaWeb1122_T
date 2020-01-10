<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://my.scwcd" prefix="my"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><my:greet user="Vincent" /></h1>
        <h1><my:greet /></h1>
        <h1><my:greet user="${param.name}" /></h1> <!--網址後面可帶入參數 ?name=anita -->
    </body>
</html>
