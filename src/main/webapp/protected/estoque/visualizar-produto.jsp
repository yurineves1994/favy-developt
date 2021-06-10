<%-- 
    Document   : tela03
    Created on : 27/02/2021, 17:30:01
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:if test="${sessionScope.email_user.admin || sessionScope.email_user.estoque}">
        <%@include file="../header-usuario.jsp" %> 
    </c:if>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">
        <title>Visualizar Produto</title>    
        <style>
            .imagens-laterais {
                list-style: none;
                transition: box-shadow 3s;
            }
            .imagens-laterais > li{
                margin-bottom: 25px;
            }
            .img-lateral:hover{
                box-shadow: 1px black; 
                width: 120px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">           
            <div class="row">
                <div class="col-sm-2">
                    <ul class="imagens-laterais">
                        <c:forEach items="${produto.imagemProduto}" var="produt">
                            <div>
                                <img  width="100" height="100"  src = "data:image/png;base64, ${produt}" alt = "Red dot">
                            </div>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-sm-5 border">
                    <div>
                        <h2>Nome do Produto: ${produto.nomeProduto}</h2>
                        <h4>Quantidade Estrela: ${produto.qtdEstrela}</h4>                               
                        <h3>R$:${produto.precoProduto} a vista</h3>
                        <div id="carousel-visualizar">
                            
                            <c:forEach items="${produto.imagemProduto}" var="produt">
                                <div>
                                    <img  width="400" height="400"  src = "data:image/png;base64, ${produt}" alt = "Red dot">
                                </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 border">
                    <div>
                        <h4>Descrição do Produto</h4><br>${produto.descricao}
                        <br>
                        <br>
                        <c:choose>
                            <c:when test="${sessionScope.email_user.admin || sessionScope.email_user.estoque}">
                                <a class="btn btn-danger">Adicionar ao carrinho</a>
                                <a class="btn btn-dark" href="ListarProdutos">Voltar</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" onclick="adicionarProdutoCarrinho(${produto.codProduto}, 2)">Adicionar ao carrinho</a>      
                                <a class="btn btn-dark" href="CardsProdutos">Voltar</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
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
        
        function adicionarProdutoCarrinho(codProduto, x) {
            $.get("CarrinhoProduto?codProduto=" + codProduto+" "+x, function (resposta) {
                let numeroCarrinho = 0;
                numeroCarrinho += 1;
                document.location.reload(true);
            });
        }
    </script>
</body>


</html>