<%-- 
    Document   : header-loja
    Created on : 26/03/2021, 21:56:39
    Author     : yurin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            .cabecalho {
               background: rgba(51, 35, 35, 0.3);
               display: flex;
               justify-content:space-between;
               padding: 10px;
               align-items: center;
            }
            .logado {
                display: flex;
                justify-content:space-around;
                flex-direction:column;
            }
            .nome_cliente{
                font-size: 2em;
                color: black;
                text-transform: uppercase;

            }           
            .cabecalho a {
                color: black;
                text-transform: uppercase;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="cabecalho">
                <h2>FAVY</h2>
                <c:choose>
                    <c:when test="${sessionScope.email_cli.cliente}">
                        <div class="logado">
                            <span class="nome_cliente">${sessionScope.email_cli.nomeCliente}</span>                              
                            <a class="editar_cliente" href="<c:url value="/EditarCliente?codCliente=${sessionScope.email_cli.codCliente}"/>">Editar</a>                             
                        </div>
                    </c:when>  
                    <c:otherwise>
                        <div>
                        <a href="login.jsp" >Login Administrativo</a>
                        <a href="login_cliente.jsp" >Login Cliente</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </header>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script type="text/javascript">
//            $('.carouselExampleControls').slick({
//                dots: true,
//                infinite: true,
//                slidesToShow: 1,
//                slidesToScroll: 1
//            });
            $('#idenficador').click(function () {
                $('.lista-editar').show();
            });

            $('#idenficador').dblclick(function () {
                $('.lista-editar').hide();
            });
        </script>
    </body>
</html>
