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
        <section class="container">
            <table class="tabela-produtos">
                <thead>
                    <tr>
                        <c:if test="${sessionScope.email_user.admin}">
                            <th>COD produto</th>
                            </c:if>
                        <th>Nome do Produto</th>
                            <c:if test="${sessionScope.email_user.admin}">
                            <th>Email</th>
                            </c:if>
                        <th>Status</th>
                        <th>Cargo</th>
                            <c:if test="${sessionScope.email_user.admin}">
                            <th> Ações </th>
                            </c:if>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${listaUsuarios}" var="usuario">
                        <tr>
                            <c:if test="${sessionScope.email_user.admin}">
                                <td >${usuario.codUsuario}</td>
                            </c:if>
                            <td>${usuario.nomeUsuario}</td>
                            <c:if test="${sessionScope.email_user.admin}">
                                <td >${usuario.emailUsuario}</td>
                            </c:if>
                            <td> 
                                <c:if test="${usuario.statusUsuario == 'i'}">
                                    Inativo
                                </c:if>
                                <c:if test="${usuario.statusUsuario == 'a'}">  
                                    Ativo
                                </c:if></td>
                            <td >
                                <c:if test="${usuario.cargo == 1}">
                                    Administrador
                                </c:if>
                                <c:if test="${usuario.cargo == 2}">  
                                    Estoquista
                                </c:if></td>
                                <c:if test="${sessionScope.email_user.admin}">
                                <td >
                                    <a href="<c:url value="/EditarUsuario?codUsuario=${usuario.codUsuario}"/>"> 
                                        <!--Editar--> 
                                        <img src="icones/icon-alterar.png" alt="editar" class="iconTabela" title="Editar Usuario">
                                    </a>

                                    <c:if test="${usuario.statusUsuario == 'i'}">
                                        <a href="<c:url value="/AtivarUsuario?codUsuario=${usuario.codUsuario}"/>">
                                            <!--Ativar--> 
                                            <img src="icones/icon-ativar.png" alt="ativar" class="iconTabela" title="Reativar Usuario">
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
