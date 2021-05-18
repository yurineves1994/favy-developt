<%-- 
    Document   : pedidosCompra
    Created on : 18/05/2021, 19:13:36
    Author     : yurin
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
        <table>
            <thead>
                <tr>
                    <th>Codigo Pedido</th>
                    <th>Codigo Item</th>
                    <th>Nome Item</th>
                    <th>Quantidade Comprada</th>
                    <th>Preço Unitario</th>
                    <th>Preço Total</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listarProdutosPedido}" var="produtos">
                <tr>
                    <td>${produtos.codPedido}</td>
                    <td>${produtos.codItem}</td>
                    <td>${produtos.nomeItem}</td>
                    <td>${produtos.qtdItem}</td>
                    <td>${produtos.precoUnitario}</td>    
                    <td>${produtos.precoTotal}</td>    
                <tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
