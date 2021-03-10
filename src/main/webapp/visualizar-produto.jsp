<%-- 
    Document   : tela03
    Created on : 27/02/2021, 17:30:01
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">
        <title>CADASTRO PRODUTO</title>
        <style>
            .container {
                margin: 0 auto;
                width: 1250px;
            }

            .grupo-partils {
                display: flex;
                justify-content: space-between;

            }

            .partils {
                width: 49%;
                height: 500px;
                border: 1px solid black;
                margin: 0 auto;
            }
            .partils h2 {
                text-align: left;
                text-transform: uppercase;
            }
            .partils h4 {
                text-align: left;
                text-transform: uppercase;
            }

            #carousel-visualizar img {
                width: 100%;
                height: 380px;
            }
            .slick-list {
                position: relative;
                display: block;
                overflow: hidden;               
                padding: 0;
            }
            button {
                width: 100px;
                height: 30px;
            }
            .grupo-botoes {    
                display: flex;
                justify-content: flex-end;
 
            }
            .grupo-botoes button {
                margin: 10px 5px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>VISUALIZAÇÃO PRODUTO</h2>
            <div class="grupo-partils">
                <div class="partils">
                    <h2>${produto.nomeProduto}</h2>
                    <h4>R$:${produto.precoProduto}</h4>
                    <div id="carousel-visualizar">
                        <div><img src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" /></div>
                        <div><img src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" /></div>
                        <div><img src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" /></div>
                        <div><img src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" /></div>
                    </div>
                </div>
                <div class="partils">
                    <p>${produto.descricao}</p>
                </div>
            </div>
                <div class="grupo-botoes">
                <button><a href="ListarProdutos">Voltar</a></button>
                    <c:if test="${produto.statusProduto == 'i'}">
                    <button><a href="AtivarProduto?codProduto=${produto.codProduto}">Ativar</a></button>
                </c:if>
                <c:if test="${produto.statusProduto == 'a'}">  
                    <button><a href="DesativarProduto?codProduto=${produto.codProduto}">Desativar</a></button>
                </c:if>

            </div>

        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
        <script type="text/javascript">
            $('#carousel-visualizar').slick({
                dots: true,
                infinite: true,
                slidesToShow: 1,
                slidesToScroll: 1
            });
        </script>
    </body>


</html>