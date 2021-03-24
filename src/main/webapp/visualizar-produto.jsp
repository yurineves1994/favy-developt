<%-- 
    Document   : tela03
    Created on : 27/02/2021, 17:30:01
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">
        <title>Visualizar Produto</title>       
    </head>
    <body>
        <div class="container mt-5">           
            <div class="row">             
                <div class="col-sm-6 border">
                    <div>
                        <h2>Nome do Produto: ${produto.nomeProduto}</h2>
                        <h4>Quantidade Estrela: ${produto.qtdEstrela}</h4>                               
                        <h3>R$:${produto.precoProduto} a vista</h3>
                        <div id="carousel-visualizar">
                            <div><img width="400" height="300" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" /></div>
                            <div><img width="400" height="300" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" /></div>
                            <div><img width="400" height="300" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" /></div>
                            <div><img width="400" height="300" class="rounded mx-auto d-block" src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" /></div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 border">
                    <div>
                        <h4>Descrição do Produto</h4><br>${produto.descricao}
                        <br>
                        <br>
                        <a class="btn btn-danger" href="#">Comprar</a>
                    </div>
                </div>
            </div>

            <div class="float-right">
                <a class="btn btn-dark" href="ListarProdutos">Voltar</a>
                <c:if test="${produto.statusProduto == 'i'}">
                    <a class="btn btn-dark" href="AtivarProduto?codProduto=${produto.codProduto}">Ativar</a>
                </c:if>
                <c:if test="${produto.statusProduto == 'a'}">  
                    <a class="btn btn-dark" href="DesativarProduto?codProduto=${produto.codProduto}">Desativar</a>
                </c:if>
            </div>
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