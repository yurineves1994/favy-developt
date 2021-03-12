<%-- 
    Document   : tela02
    Created on : 27/02/2021, 17:27:22
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Produto</title>      
    </head>
    <body>
        <section class="container-fluid">
            <table class="table table-borderless mt-5">
                <thead class="thead-dark">
                    <tr style="text-align: center">
                        <th scope="col">COD produto</th>
                        <th scope="col">Nome do Produto</th>
                        <th scope="col">Qtd Estoque</th>
                        <th scope="col">Status</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Inativar/Reativar</th>
                        <th scope="col">Visualizar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaProdutos}" var="produto">
                        <tr style="text-align: center">
                            <td scope="row">${produto.codProduto}</td>
                            <td>${produto.nomeProduto}</td>
                            <td>${produto.qtdProduto}</td>
                            <td><c:if test="${produto.statusProduto == 'i'}">
                                    Inativo
                                </c:if>
                                <c:if test="${produto.statusProduto == 'a'}">  
                                    Ativo
                                </c:if>
                            </td>
                            <td><a href="EditarProduto?codProduto=${produto.codProduto}">Editar</a></td>
                            <td><c:if test="${produto.statusProduto == 'i'}">
                                    <a href="AtivarProduto?codProduto=${produto.codProduto}">Reativar</a>
                                </c:if>
                                <c:if test="${produto.statusProduto == 'a'}">  
                                    <a href="DesativarProduto?codProduto=${produto.codProduto}">Inativar</a>
                                </c:if>
                            </td>
                            <td><a href="VisualizarProduto?codProduto=${produto.codProduto}">Visualizar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
        </section>
    </body>

</html>