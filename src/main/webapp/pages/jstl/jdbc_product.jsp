<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="mydb" 
                   driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/sample" 
                   user="app" 
                   password="app" />
<sql:query dataSource="${mydb}" var="products">
    SELECT 
        product_id, purchase_cost, quantity_on_hand, (purchase_cost*quantity_on_hand) as subtotal, description
    FROM 
        product
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${mydb}</h1>
        <h1>${products}</h1>
    </body>
</html>
