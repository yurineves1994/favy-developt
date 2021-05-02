<%-- 
    Document   : cards-produtos
    Created on : 14/03/2021, 18:51:44
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header-loja.jsp" %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Listar Produto</title>
        <style>
            .link_nome_produto {
                font-size: 20px;
                color: black;
                text-transform: uppercase;
            }
            .link_nome_produto > a{
                text-decoration: none; 
            }
            a:hover{
                text-decoration: none; 
            }
        </style>
    </head>

    <body style="background-color: #e7e7e7;">
        <section class="container-fluid mt-4 ">
            <div class="row cardsConfig">
                <c:forEach items="${listaProdutos}" var="produto">
                    <c:if test="${produto.statusProduto == 'a'}">
                        <div class="col-sm-3 mb-2 efeito3d">
                            <a href="VisualizarProduto?codProduto=${produto.codProduto}">
                                <div class="card" style="width: 18rem;">
                                    <div class="carousel-visualizar">
                                        <c:if test="${produto.imagemProduto1 != null}">
                                            <div><img width="200" height="200" class="rounded mx-auto d-block img-carousel" src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" /></div>
                                            </c:if>
                                            <c:if test="${produto.imagemProduto2 != null}">
                                            <div><img width="200" height="200" class="rounded mx-auto d-block img-carousel" src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" /></div>
                                            </c:if>
                                            <c:if test="${produto.imagemProduto3 != null}">
                                            <div><img width="200" height="200" class="rounded mx-auto d-block img-carousel" src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" /></div>
                                            </c:if>
                                            <c:if test="${produto.imagemProduto4 != null}">
                                            <div><img width="200" height="200" class="rounded mx-auto d-block img-carousel" src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" /></div>
                                            </c:if>
                                    </div>
                            </a>
                            <div class="card-body">
                                <a class="link_nome_produto" href="VisualizarProduto?codProduto=${produto.codProduto}"><p class="card-title">${produto.nomeProduto}</p></a>
                                <p>${produto.descricao}</p>
                                <a class="btn btn-primary" onclick="adicionarProdutoCarrinho(${produto.codProduto})">ADICIONAR AO COMPRAR</a>      
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </section>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
    <script type="text/javascript">
        $('.carousel-visualizar').slick({
            dots: true,
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1
        });

        function adicionarProdutoCarrinho(codProduto) {
            $.get("CarrinhoProduto?codProduto=" + codProduto, function (resposta) {
                console.log("OK");
            });
        }
    </script>
</body>
</html>
