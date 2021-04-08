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
        <link rel="stylesheet" href="estilos/estiloListarProdutos.css">
    </head>
    <body>
        <script src="scripts/scriptListarProduto.js"></script>
        <section class="container">
            <form class="form-inline mt-3" action="PesquisarNome" method="GET">
                <input class="form-control " name="nome_pesquisa" type="search" placeholder="Pesquisar" aria-label="Search">
                <button class="btn btn-outline-success mr-3" type="submit">Pesquisar</button>
            </form>

            <table class="table mt-1">
                <thead class="thead-dark">
                    <tr style="text-align: center">
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
                            <td scope="row" class="tabelaCell">${produto.codProduto}</td>
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
            <%
                int quantidadePagina = Integer.parseInt(request.getParameter("quantidadePagina"));
                int numeroPagina = Integer.parseInt(request.getParameter("numeroPagina"));
            %>
            <nav>
                <ul class="pagination justify-content-start">
                   
                    <%
                        if (numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0) {
                            out.println("<li class='page-item'><a class='page-link' href=ListarProdutos?numeroPagina="+(numeroPagina - 1)+">Anterior</a></li>");
                        }
                        out.println("<li class='page-item'><a class='page-link' href=ListarProdutos?numeroPagina="+numeroPagina+">"+numeroPagina+"</a></li>");

                        if (quantidadePagina > numeroPagina) {
                            out.println("<li class='page-item'><a class='page-link' href=ListarProdutos?numeroPagina="+(numeroPagina + 1)+">Proximo</a></li>");
                        }
                    %>
                </ul>
            </nav>
        </section>     
        <script src="scripts/scriptListarProduto.js"></script>
    </body>
</html>