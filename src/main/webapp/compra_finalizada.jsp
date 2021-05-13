<%-- 
    Document   : compra_finalizada
    Created on : 12/05/2021, 21:02:05
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
        <h1>DADOS COMPRA</h1>
        <h2>PRODUTOS PEDIDO</h2>
        <span>CODIGO DE RASTREIO ${sessionScope.email_cli.codCliente * 987654698908203832}</span>
        <h2>codigo cliente: ${sessionScope.email_cli.codCliente}</h2>
        <h2>codigo pedido: ${pedido.codPedido}</h2>
            <span>${pedido.codPedido}</span>
            <span>${pedido.cepEndereco}</span>
            <span>${pedido.ruaEndereco}</span>
            <span>${pedido.bairroEndereco}</span>
            <span>${pedido.cidadeEndereco}</span>
            <span>${pedido.ufEndereco}</span>
            <span>${pedido.numEndereco}</span>
            <span>${pedido.complEndereco}</span>

        <h1>DADOS PAGAMENTO</h1>
        <h2>PAGAMENTO</h2>
            <span>${pedido.formaPagamento}</span>
            <span>${pedido.valorFinal}</span>
            <span>${pedido.statusPedido}</span>
    </body>
</html>
