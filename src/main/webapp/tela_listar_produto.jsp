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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
                        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                        crossorigin="anonymous">
        <link rel="stylesheet" href="estilos/estiloListarProdutos.css">
    </head>
    <body>
        <script src="scripts/scriptListarProduto.js"></script>
        <section>
            
            <div class="container mt-5 mb-5">

                <form class="form-inline mt-3" action="PesquisarNome" method="GET">
                    <input class="form-control " name="nome_pesquisa" type="search" placeholder="Nome do Produto" aria-label="Search">
                    <button class="btn btn-outline-success mr-3" type="submit">Pesquisar</button>
                </form>

                <table class="table mt-1">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="tabelaCell">COD produto</th>
                            <th scope="col">Nome do Produto</th>
                            <th scope="col" class="tabelaCell">Qtd Estoque</th>
                            <th scope="col">Status</th>
                            <th scope="col" class="acoes"> Ações </th>
                        </tr>
                    </thead>
    
                    <tbody id="t_dados">
                        <c:forEach items="${listaProdutos}" var="produto">
                            <tr style="text-align: center" class="efeitoCor" id="status">
                                <th scope="row" class="tabelaCell">${produto.codProduto}</td>
                                <td>${produto.nomeProduto}</td>
                                <td class="tabelaCell">${produto.qtdProduto}</td>
                                <td>
                                    <c:if test="${produto.statusProduto == 'i'}">
                                        Inativo
                                    </c:if>
                                    <c:if test="${produto.statusProduto == 'a'}">  
                                        Ativo
                                    </c:if>
                                </td>
                                
                                <td class="acoes">
                                    <a href="EditarProduto?codProduto=${produto.codProduto}"> 
                                        <!--Editar--> 
                                        <img src="icones/icon-alterar.png" alt="editar" class="iconTabela left" title="Editar Produto">
                                    </a>
                                
                                    <c:if test="${produto.statusProduto == 'i'}">
                                        <a href="AtivarProduto?codProduto=${produto.codProduto}">
                                            <!--Ativar--> 
                                            <img src="icones/icon-ativar.png" alt="ativar" class="iconTabela" title="Reativar Produto" id="ativar">
                                        </a>
                                    </c:if>
                                    <c:if test="${produto.statusProduto == 'a'}">
                                        <a href="DesativarProduto?codProduto=${produto.codProduto}">
                                            <!--Desativar--> 
                                            <img src="icones/icon-desativar.png" alt="desativar" class="iconTabela" title="Desativar Produto">
                                        </a>
                                    </c:if>
                                
                                    <a href="VisualizarProduto?codProduto=${produto.codProduto}">
                                        <!--Visualizar--> 
                                        <img src="icones/icon-visualizar.png" alt="visualizar" class="iconTabela right" title="Visualizar ">
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    
        </section>
        <!--
        <section class="container-fluid">
            <form class="form-inline mt-3" action="PesquisarNome" method="GET">
                <input class="form-control " name="nome_pesquisa" type="search" placeholder="Pesquisar" aria-label="Search">
                <button class="btn btn-outline-success mr-3" type="submit">Pesquisar</button>
            </form>
            <table class="table table-borderless mt-2">
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
        -->
        <script src="scripts/scriptListarProduto.js"></script>
    </body>
</html>