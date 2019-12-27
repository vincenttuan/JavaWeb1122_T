<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="datasource.jspf" %>
<c:set var="sortcolname" value="${param.sortcolname==null?'1':param.sortcolname}"/>
<c:set var="sortflag" value="${param.sortflag==null?'':param.sortflag}"/>
<sql:query dataSource="${mydb}" var="views">
    SELECT 
        ORDER_NUM, CUSTOMER_NAME, PRODUCT_ID, PRODUCT_NAME,
        PURCHASE_COST, RATE, QUANTITY, SUBTOTAL
    FROM PU_VIEW
    ORDER BY ${sortcolname} ${sortflag}
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function sort(sortcolname) {
                // 取得 url 全路徑
                let url = new URL(location.href);
                // 取得 url 參數路徑
                var search_params = new URLSearchParams(url.search);
                // 設定 sortcolname 參數
                search_params.set('sortcolname', sortcolname);
                // 設定 sortflag 參數
                var sortflag = search_params.get('sortflag') == 'ASC' ? 'DESC' : 'ASC';
                search_params.set('sortflag', sortflag);
                // 更新 url 參數路徑
                url.search = search_params.toString();
                // 重導網頁
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

