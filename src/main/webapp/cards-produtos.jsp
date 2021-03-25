<%-- 
    Document   : cards-produtos
    Created on : 14/03/2021, 18:51:44
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">
        <link rel="stylesheet" href="estilos/estiloCardsProduto.css">
        <title>Listar Produto</title>
    </head>
    <body>
        <header>
            <div class="cabecalho">
                <div class = "caixaPesquisa">
                    <form id = "" class = "centralizaPesquisa">
                        <input type = "search" placeholder = "Search" class = "pesquisa">
                        <input type = "button" class = "botaoPesquisa">
                    </form>
                </div>

                <div class="topicos">
                    <div class="topico">
                        <h2>CABELOS</h2>
                    </div>
                    <div class="topico">
                        <h2>MAQUIAGEM</h2>
                    </div>
                    <div class="topico">
                        <h2>HIGIENE</h2>
                    </div >
                    <div class="topico">
                        <h2>PERFUMARIA</h2>
                    </div>
                </div>
            </div>
        </header>

        <section class="container-fluid mt-4">
            
            <div class="row">
                <c:forEach items="${listaProdutos}" var="produto">
                    <div class="col-sm-3 mb-2">
                        <div class="card" style="width: 18rem;">
                            <div class="carousel-visualizar">
                                <div><img width="250" height="250" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto1}"  /></div>
                                <div><img width="250" height="250" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto2}"  /></div>
                                <div><img width="250" height="250" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto3}" /></div>
                                <div><img width="250" height="250" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto4}"  /></div>
                            </div>
                            <div class="card-body">
                                <h2 class="card-title">${produto.nomeProduto}</h2>
                                <h5 class="card-title">${produto.qtdEstrela}</h5>
                                <p class="card-text">${produto.descricao}</p>
                                <a href="VisualizarProduto?codProduto=${produto.codProduto}" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
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
        </script>
    </body>
</html>
