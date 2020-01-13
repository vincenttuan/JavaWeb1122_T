<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/my" prefix="my" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <my:stock symbol="2317.TW" />
        </h1>
        <h1>
            <my:stock symbol="USDTWD=x" />
        </h1>
        
        <h1>
            <my:stock2>
                2330.TW,1101.TW,USDTWD=x,TWDJPY=x
            </my:stock2>
        </h1>
    </body>
</html>
