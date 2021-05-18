<%-- 
    Document   : header-loja
    Created on : 26/03/2021, 21:56:39
    Author     : yurin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <!--<head>-->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <style>
            *{
                margin: 0;
            }

            .cabecalhoCarrossel{
                width: 100%;
                height: 600px;
                background-color: blanchedalmond;
                contain: table-row;
            }

            .carousel{
                height: 100%;
                contain: content;
            }

            .imgtamanho{
                height: 100%;
                width: 100%;
            }

            /* Menu de opções */
            .cabecalho{
                width: 100%;
                height: 70px;
                background-color: rgba(0, 255, 255, 0.103);
                position: fixed;
                top: 0;
                left: 0;
                z-index: 5005;

                border-bottom: solid 1px white;
            }
            .caixalogo{
                width: 170px;
                height: 100%;

            }
            .logo{
                float: left;

                font-size: 40px;
                letter-spacing: 13px;
                color: aliceblue;
                position:relative;
                left:7%;
                top:50%;
                transform: translate(-50%, -50%);
            }

            .caixaMenus{
                float: right;
                display: flex;
                justify-content: center;
                margin-top: 17px;
                margin-right: 47px;
            }
            .iconMenu{
                width: 35px;
                margin-right: 4px;
            }
            .info-icon{
                color: aliceblue;
                float: right;
                margin-top: 4px;
                margin-right: 10px;
            }

            .cxalogin:hover .menuItens{
                display: block;

                text-align: center;
                margin-top: 3px;
                
                padding: 10px;
                background-color: white;

                width: 110px;
                height: auto;
                position: absolute;
                border-radius: 9px;
            }

            .menuItens{
                display: none;
            }
            .linkFunc{
                margin-top: 8px;
                margin-bottom: 0px;
                font-size: 14px;
                margin-left: 0px;
            }


            .efeito3d{
                box-shadow: 0 1px 2px 0 rgb(0 0 0 / 12%);
                transition: 0.2s;
            }
            .efeito3d:hover{
                box-shadow: 0 8px 16px 0 rgb(0 0 0 / 10%);
            }
            .cardsConfig{
                grid-gap: 13px;
                place-content: center;
            }
            .cardsConfig:hover{
                grid-gap: 15px;
                place-content: center;
            }
            .nome_cliente{
                font-size: 25px;
                color: white;
                text-transform: uppercase;
                text-align: center;
                padding: 0 20px 0px 0;
            }
            .numero_carrinho{
                position: relative;
                left: -25px;
                font-size: 12px;
                color: white;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="cabecalho">
                <h1 class="logo">FAVY</h1>
                <div class="caixaMenus">
                    <div class="cxalogin"> 
                        <c:choose>
                            <c:when test="${sessionScope.email_cli.cliente}">
                                <span class="info-icon nome_cliente">${sessionScope.email_cli.nomeCliente}</span>
                                <div class="menuItens" id="menuAparecer">
                                    <p class="linkFunc">
                                        <a class="editar_cliente" href="<c:url value="/EditarCliente?codCliente=${sessionScope.email_cli.codCliente}"/>">Editar</a>
                                    </p>
                                    <p class="linkFunc">
                                        <a class="editar_cliente" href="<c:url value="/PedidosServlet?codCliente=${sessionScope.email_cli.codCliente}"/>">Editar</a>
                                    </p>
                                    <p class="linkFunc">
                                        <a class="editar_cliente" href="<c:url value="/Logout"/>">Logout</a>
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>

                                <a href="#">
                                    <img src="icones/icon-login.png" class="iconMenu">
                                    <p class="info-icon">Entrar</p>
                                </a>

                                <div class="menuItens" id="menuAparecer">
                                    <p class="linkFunc">
                                        <a href="login.jsp" >Administrativo</a>
                                    </p>
                                    <p class="linkFunc">
                                        <a href="login_cliente.jsp" >Cliente</a>
                                    </p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="cxaComprar">
                        <img src="icones/icon-carrinho.png" class="iconMenu">
                        <a href="carrinho.jsp" class="info-icon">Carrinho</a><span class="numero_carrinho">${sessionScope.listaProdutos.size()}</span>                     
                    </div>
                    <!--
                    <a href="login.jsp" >Administrativo</a>
                    <a href="login_cliente.jsp" >Cliente</a>
                    -->
                </div>

            </div>


        </header>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script type="text/javascript">
            $('.carouselExampleControls').click({
                dots: true,
                infinite: true,
                slidesToShow: 1,
                slidesToScroll: 1
            });
        </script>
    </body>
</html>