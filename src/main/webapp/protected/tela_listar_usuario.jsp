<%-- 
    Document   : tela_listar_usuario
    Created on : 02/04/2021, 11:29:40
    Author     : Ferreira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" href="estilos/estiloListarProdutos.css">
    </head>
    <body>
        <section class="container">
          
            <table class="table mt-1">
                <thead class="thead-dark">
                    <tr style="text-align: center">
                        <c:if test="${sessionScope.email_user.admin}">
                        <th scope="col" class="tabelaCell">COD produto</th>
                        </c:if>
                        <th scope="col">Nome do Produto</th>
                        <c:if test="${sessionScope.email_user.admin}">
                        <th scope="col" class="tabelaCell">Email</th>
                        </c:if>
                        <th scope="col">Status</th>
                        <th scope="col">Cargo</th>
                        <c:if test="${sessionScope.email_user.admin}">
                        <th scope="col" class="acoes"> Ações </th>
                        </c:if>
                    </tr>
                </thead>

                <tbody id="t_dados">
                    <c:forEach items="${listaUsuarios}" var="usuario">
                        <tr style="text-align: center" class="efeitoCor" id="status">
                            <c:if test="${sessionScope.email_user.admin}">
                            <td scope="row" class="tabelaCell">${usuario.codUsuario}</td>
                            </c:if>
                            <td>${usuario.nomeUsuario}</td>
                            <c:if test="${sessionScope.email_user.admin}">
                            <td scope="row" class="tabelaCell">${usuario.emailUsuario}</td>
                            </c:if>
                            <td> 
                                <c:if test="${usuario.statusUsuario == 'i'}">
                                    Inativo
                                </c:if>
                                <c:if test="${usuario.statusUsuario == 'a'}">  
                                    Ativo
                                </c:if></td>
                            <td scope="row" class="tabelaCell">
                                <c:if test="${usuario.cargo == 1}">
                                    Administrador
                                </c:if>
                                <c:if test="${usuario.cargo == 2}">  
                                    Estoquista
                                </c:if></td>
                            <c:if test="${sessionScope.email_user.admin}">
                            <td class="acoes">
                                <a href="<c:url value="/EditarUsuario?codUsuario=${usuario.codUsuario}"/>"> 
                                    <!--Editar--> 
                                    <img src="icones/icon-alterar.png" alt="editar" class="iconTabela left" title="Editar Usuario">
                                </a>

                                <c:if test="${usuario.statusUsuario == 'i'}">
                                    <a href="<c:url value="/AtivarUsuario?codUsuario=${usuario.codUsuario}"/>">
                                        <!--Ativar--> 
                                        <img src="icones/icon-ativar.png" alt="ativar" class="iconTabela" title="Reativar Usuario" id="ativar">
                                    </a>
                                </c:if>
                                <c:if test="${usuario.statusUsuario == 'a'}">
                                    <a href="<c:url value="/DesativarUsuario?codUsuario=${usuario.codUsuario}"/>">
                                        <!--Desativar--> 
                                        <img src="icones/icon-desativar.png" alt="desativar" class="iconTabela" title="Desativar Usuario">
                                    </a>
                                </c:if>
                            </c:if>
                            </td>
                        <tr>
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
                            out.println("<li class='page-item'><a class='page-link' href=ListarUsuarios?numeroPagina=" + (numeroPagina - 1) + ">Anterior</a></li>");
                        }
                        out.println("<li class='page-item'><a class='page-link' href=ListarUsuarios?numeroPagina=" + numeroPagina + ">" + numeroPagina + "</a></li>");

                        if (quantidadePagina > numeroPagina) {
                            out.println("<li class='page-item'><a class='page-link' href=ListarUsuarios?numeroPagina=" + (numeroPagina + 1) + ">Proximo</a></li>");
                        }
                    %>
                </ul>
            </nav>
        </section>
    </body>
</html>
