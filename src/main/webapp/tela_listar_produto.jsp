<%-- 
    Document   : tela02
    Created on : 27/02/2021, 17:27:22
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Produto</title>
        <style>
            table {
                width: 700px;
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }

            table thead {
                background-color: bisque;
            }

            .container {
                margin: 100px auto;
                width: 800px;
            }

            .campo-center {
                display: flex;
                justify-content: center;
            }

            .campo-center input {
                width: 70%;
                margin-left: 10px;
            }

            .campo-tabela {
                display: flex;
                justify-content: space-between;
                margin: 20px;
            }
            i{
                margin-left: 4px;
            }

            .logo {
                width: 250px;
            }

            .login a {
                font-size: 18px;
                text-decoration: none;
                font-weight: bold;
            }

            .login a:hover {
                font-size: 19px;
                color: red;
            }

            #topo-site {
                display: flex;
                justify-content: space-around;
                align-items: center;
                margin: 20px 0px;
            }

            #busca {
                width: 500px;
                height: 30px;
                border: 1px solid blueviolet;
            }

            #menu-principal {
                background: wheat;
                display: flex;
                justify-content: space-around;
                align-items: center;
                list-style-type: none;
            }

            #menu-principal li {
                display: flex;
                align-items: center;
                justify-content: space-around;
                width: 100%;
                height: 50px;
            }

            #menu-principal li:hover {
                background: white;
            }

            #menu-principal a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <section>
            <div class="container">
                <form action="">
                    <div class="campo-center">
                        <label for="pesquisa">Pesquisar:</label>
                        <input type="search" id="pesquisa" name="pesquisa">
                        <a href="#"> <i class="fa fa-search fa-1x"></i></a>
                    </div>
                    <div class="campo-tabela">
                        <table>
                            <thead>
                                <tr>
                                    <td>Nome do Produto</td>
                                    <td>Qtd Estoque</td>
                                    <td>Status</td>
                                    <td>Editar</td>
                                    <td>Inativar/Reativar</td>
                                    <td>Visualizar</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Campo 01</td>
                                    <td>Campo 02</td>
                                    <td>Campo 03</td>
                                    <td><a href="#">Editar</a></td>
                                    <td><a href="#">Inativar</a></td>
                                    <td><a href="#">Visualizar</a></td>
                                </tr>
                                <tr>
                                    <td>Campo 01</td>
                                    <td>Campo 02</td>
                                    <td>Campo 03</td>
                                    <td><a href="#">Editar</a></td>
                                    <td><a href="#">Inativar</a></td>
                                    <td><a href="#">Visualizar</a></td>
                                </tr>
                                <tr>
                                    <td>Campo 01</td>
                                    <td>Campo 02</td>
                                    <td>Campo 03</td>
                                    <td><a href="#">Editar</a></td>
                                    <td><a href="#">Inativar</a></td>
                                    <td><a href="#">Visualizar</a></td>
                                </tr>
                                <tr>
                                    <td>Campo 01</td>
                                    <td>Campo 02</td>
                                    <td>Campo 03</td>
                                    <td><a href="#">Editar</a></td>
                                    <td><a href="#">Inativar</a></td>
                                    <td><a href="#">Visualizar</a></td>
                                </tr>
                                <tr>
                                    <td>Campo 01</td>
                                    <td>Campo 02</td>
                                    <td>Campo 03</td>
                                    <td><a href="#">Editar</a></td>
                                    <td><a href="#">Inativar</a></td>
                                    <td><a href="#">Visualizar</a></td>
                                </tr>
                                <tr>
                                    <td>Campo 01</td>
                                    <td>Campo 02</td>
                                    <td>Campo 03</td>
                                    <td><a href="#">Editar</a></td>
                                    <td><a href="#">Inativar</a></td>
                                    <td><a href="#">Visualizar</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="#">
                            <i class="fa fa-circle fa-3x"></i>
                        </a>
                    </div>
                </form>
            </div>
        </section>
    </body>

</html>