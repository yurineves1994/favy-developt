<%-- 
    Document   : header
    Created on : 08/10/2020, 18:48:19
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            /* Geral */
            *{
                margin: 0;
            }
            .linha {
                position: relative;
                top:0;
                left: 0;
                background: rgb(241, 240, 240);
            }
            .linha:hover{
                background: #6383af
            }

            .centraliza_icone{
                display: inline;
                position:relative;
                left:50%;
                top:50%;
                transform: translate(-50%, -50%);
            }


            /* Menu Principal */
            .menu_voltar{
                width: auto;
                height: 45px;
                background-color: #6383af;
            }

            /* Formatação icone sair */
            .ajusta_icone_menu{
                width: 55px;
                height: 45px;
                float: right;
            }
            .menu_voltar_icon{
                width: 30px;
            }



            /* Sub Menu */
            .menu_opcoes{
                width: auto;
                color: white;
                height: 60px;
                background-color: #3f597d;
                display: flex;
            }
            /* Formatação icones menu */
            .icone_menu{
                width: 40px;
            }
            .menu_tabela_produtos {
                width: 50%;
            }
            .menu_cadastro_produtos{
                width: 50%;
                float: right;
            }
            .menu-superior{
                display: none;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="menu-superior">
                <div class="menu_voltar">
                    <div class="ajusta_icone_menu">
                        <a href="<c:url value="/CardsProdutos"/>">
                            <img src="icones/icon-sair.png" alt="sair" class="menu_voltar_icon centraliza_icone">
                        </a>
                    </div>
                </div>

                <!-- Sub menu -->
                <div class="menu_opcoes">

                    <!-- Tabelas -->
                    <div class="menu_tabela_produtos">
                        <a href="<c:url value="/ListarProdutos?numeroPagina=1"/>" >
                            <img src="icones/icon-tabela.png" alt="tabela" class="icone_menu centraliza_icone link_tabelas" title="Listar Produto">
                        </a>
                    </div>

                    <!-- Cadastro Produto -->
                    <div class="menu_cadastro_produtos">
                        <a href="<c:url value="/protected/estoque/tela_cadastro_produto.jsp"/>">
                            <img src="icones/icon-produto.png" alt="produto" class="icone_menu centraliza_icone link_produto" title="Cadastrar Produto">
                        </a>
                    </div>
                    <c:if test="${sessionScope.email_user.admin}">
                        <!-- Cadastro Cliente -->
                        <div class="menu_cadastro_produtos">
                            <a href="<c:url value="/protected/tela_cadastro_usuario.jsp"/>">
                                <img src="icones/icon-cliente.png" alt="produto" class="icone_menu centraliza_icone link_produto" title="Cadastrar Usuário">
                            </a>
                        </div>
                    </c:if>
                    <!-- Tabelas -->
                    <div class="menu_tabela_produtos">
                        <a href="<c:url value="/ListarUsuarios?numeroPagina=1"/>">
                            <img src="icones/icon-tabela.png" alt="tabela" class="icone_menu centraliza_icone link_tabelas" title="Listar Usuários">
                        </a>
                    </div>
                </div>
            </div>
            <div class="linha" style="width:100%; height:7px; text-align: center;"><i style="width: 20px;border-radius: 5px; background: #6383af;" class="x fa fa-angle-down fa-1x"></i></div>
        </header>
    </body>        
    <script>       
        $(".linha").click(function () {
            $(".menu-superior").show();
            $(".x").hide();
        });
        $(".linha").dblclick(function () {
            $(".menu-superior").hide();
            $(".x").show();
        });

    </script>

</html>
