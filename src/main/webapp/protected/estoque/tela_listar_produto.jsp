<%-- 
    Document   : tela_cadastro_cliente
    Created on : 01/04/2021, 19:42:28
    Author     : Ferreira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Produto</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">    
         <style>
            body {
                background-color: rgb(241, 240, 240);
                margin: 0;
            }

            .container {
                max-width: 1920px;
                width: 100%;
            }
            .buscar-registro {
                display: flex;
                justify-content:flex-start;
                margin-top: 10px;
            }
            input {
                background-color: #fff;
                width: 30%;
                border-radius: 10px;
                border-color: transparent;
                padding: 5px;
                font-size: 18px;

            }
            button{
                background-color: #152b4b;
                text-transform: uppercase;
                color: #fff;
                cursor: pointer;
                transition: .5s;
                border-radius: 0 10px;
            }

            .tabela-produtos{
                border-collapse: initial;
                position: relative;
                margin-left: auto;
                margin-right: auto;
                width: 90%;
                margin-top: 3em;
                border-radius: 5px 5px 0 0;

            }
            thead {
                background: #152b4b;
                color: white;
            }
            tr,td,th {
                padding: 10px;
                text-align: center;
            }

            .iconTabela {
                width: 50px;
                height: 40px;
            }
        </style>
    </head>
    <body>
        <script src="scripts/scriptListarProduto.js"></script>
        <section class="container">
            <form action="PesquisarNome" method="GET" class="buscar-registro">
                <input name="nome_pesquisa" type="search" placeholder="Pesquisar" aria-label="Search">
                <button type="submit">Pesquisar</button>
            </form>

            <table class="tabela-produtos">
                <thead>
                    <tr>
                        <th>COD produto</th>
                        <th>Nome do Produto</th>
                        <th>Qtd Estoque</th>
                        <th>Status</th>
                        <th> Ações </th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${listaProdutos}" var="produto">
                        <tr>
                            <td>${produto.codProduto}</td>
                            <td>${produto.nomeProduto}</td>
                            <td>${produto.qtdProduto}</td>
                            <td>
                                <c:if test="${produto.statusProduto == 'i'}">
                                    Inativo
                                </c:if>
                                <c:if test="${produto.statusProduto == 'a'}">  
                                    Ativo
                                </c:if>
                            </td>

                            <td>
                                <a href="<c:url value="/EditarProduto?codProduto=${produto.codProduto}"/>"> 
                                    <!--Editar--> 
                                    <img src="icones/icon-alterar.png" alt="editar" class="iconTabela" title="Editar Produto">
                                </a>

                                <c:if test="${produto.statusProduto == 'i'}">
                                    <a href="<c:url value="/AtivarProduto?codProduto=${produto.codProduto}"/>">
                                        <!--Ativar--> 
                                        <img src="icones/icon-ativar.png" alt="ativar" class="iconTabela" title="Reativar Produto">
                                    </a>
                                </c:if>
                                <c:if test="${produto.statusProduto == 'a'}">
                                    <a href="<c:url value="/DesativarProduto?codProduto=${produto.codProduto}"/>"> 
                                        <!--Desativar--> 
                                        <img src="icones/icon-desativar.png" alt="desativar" class="iconTabela" title="Desativar Produto">
                                    </a>
                                </c:if>

                                <a href="<c:url value="/VisualizarProduto?codProduto=${produto.codProduto}"/>">
                                    <!--Visualizar--> 
                                    <img src="icones/icon-visualizar.png" alt="visualizar" class="iconTabela" title="Visualizar ">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <%
                int quantidadePagina = Integer.parseInt(request.getParameter("quantidadePagina"));
                int numeroPagina = Integer.parseInt(request.getParameter("numeroPagina"));
            %>
            <nav>
                <ul class="pagination justify-content-start">
                    <%
                        if (numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0) {
                            out.println("<li class='page-item'><a class='page-link' href=ListarProdutos?numeroPagina=" + (numeroPagina - 1) + ">Anterior</a></li>");
                        }
                        out.println("<li class='page-item'><a class='page-link' href=ListarProdutos?numeroPagina=" + numeroPagina + ">" + numeroPagina + "</a></li>");

                        if (quantidadePagina > numeroPagina) {
                            out.println("<li class='page-item'><a class='page-link' href=ListarProdutos?numeroPagina=" + (numeroPagina + 1) + ">Proximo</a></li>");
                        }
                    %>
                </ul>
            </nav>
        </section>     
        <script src="scripts/scriptListarProduto.js"></script>
    </body>
</html>