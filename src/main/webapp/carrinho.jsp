<%-- 
    Document   : carrinho
    Created on : 03/05/2021, 23:07:52
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.listaProdutos != null}">
            <h2>Clientes salvos na sessão</h2>
            <c:forEach items="${sessionScope.listaProdutos}" var="produto">
                <span>${produto.nomeProduto}</span><br/>
            </c:forEach> 
        </c:if>
    </body>
</html>
