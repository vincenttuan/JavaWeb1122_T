<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="datasource.jspf" %>
<c:set var="sortcolname" value="${param.sortcolname==null?'ORDER_NUM':param.sortcolname}"/>
<sql:query dataSource="${mydb}" var="views">
    SELECT 
        ORDER_NUM, CUSTOMER_NAME, PRODUCT_ID, PRODUCT_NAME,
        PURCHASE_COST, RATE, QUANTITY, SUBTOTAL
    FROM PU_VIEW
    ORDER BY ${sortcolname} DESC
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function sort(sortcolname) {
                let url = new URL(location.href);
                var search_params = new URLSearchParams(url.search);
                search_params.set('sortcolname', sortcolname);
                url.search = search_params.toString();
                location.href = url.toString();
            }
        </script>
    </head>
    <body>
        <%@ include file="menu.jspf" %>
        <table class="pure-table pure-table-bordered" width="100%">
            <thead>
                <tr style="cursor: help" title="按我一下可以排序" >
                    <th>#</th>
                    <th onclick="sort('ORDER_NUM')">ORDER_NUM</th>
                    <th onclick="sort('CUSTOMER_NAME')">CUSTOMER_NAME</th>
                    <th onclick="sort('PRODUCT_ID')">PRODUCT_ID</th>
                    <th onclick="sort('PRODUCT_NAME')">PRODUCT_NAME</th>
                    <th onclick="sort('PURCHASE_COST')">PURCHASE_COST</th>
                    <th onclick="sort('RATE')">RATE</th>
                    <th onclick="sort('QUANTITY')">QUANTITY</th>
                    <th onclick="sort('SUBTOTAL')">SUBTOTAL</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${views.rows}" var="v" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${v.ORDER_NUM}</td>
                        <td>${v.CUSTOMER_NAME}</td>
                        <td>${v.PRODUCT_ID}</td>
                        <td>${v.PRODUCT_NAME}</td>
                        <td>${v.PURCHASE_COST}</td>
                        <td>${v.RATE}</td>
                        <td>${v.QUANTITY}</td>
                        <td>${v.SUBTOTAL}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </body>
</html>

