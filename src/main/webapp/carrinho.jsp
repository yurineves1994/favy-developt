<%-- 
    Document   : carrinho
    Created on : 03/05/2021, 23:07:52
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="estilos/estiloCarrinhoVendas.css">
        <%@include file="header-loja.jsp"%>
        <style>
            .fretes {
                display: none;
            }
            .inativo {
                display: none;
            }
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
            .caminho-compra {
                display: flex;
                justify-content:center;
                align-items: center;
            }
            .caminho-compra > div {
                margin-left: 50px; 
                margin-right:  50px; 
            }
            .caminho-compra > div.hoje {               
                padding: 20px;
                background: rgb(238, 106, 106);;
                color: white;
                border-radius: 15px;
            }

        </style>
    </head>

    <body style="background-color: rgb(255, 255, 255);">
        <nav class="cabecalho">
            <h1 class="logo">FAVY</h1>
            <div class="caminho-compra">
                <div class="hoje">Carrinho</div>
                <div>Pagamento</div>
                <div>Obrigado, volte sempre!</div>
            </div>
        </nav>
        <section class="container" style="max-width: 1286px; margin-top: 150px;">
            <c:choose>
                <c:when test="${sessionScope.listaProdutos != null}">
                    <div class="row">
                        <!-- Container Produtos do carrinho -->
                        <div class="col-md-8">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" style="width: 480px;">produto</th>
                                        <th scope="col">qtd.</th>
                                        <th scope="col">preço</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${sessionScope.listaProdutos}" var="produto">
                                        <c:if test="${sessionScope.listaProdutos.contains(produto)}">
                                            <tr style="height:100px;">
                                                <!-- Produto -->
                                                <td style="vertical-align: middle;">
                                                    <div class="cxaProduto">
                                                        <div>
                                                            <img src="data:image/png;base64, ${produto.imagemProduto1}" class="imgProduto">
                                                        </div>
                                                        <div class="descricaoProduto">
                                                            ${produto.descricao}
                                                        </div>
                                                    </div>
                                                </td>
                                                <!-- Quantidade -->
                                                <td style="vertical-align: middle;">
                                                    <div class="cxa_quantidade">
                                                        <span class="material-icons" style="font-size: 1rem; color: black; cursor: pointer;" onclick="adicionarProdutoCarrinho(${produto.codProduto}, 1)">remove</span>
                                                        <input name="quantidade" type="number" class="quantidade" disabled="disabled" value="${produto.qntCarrinho}" min="0" max="${produto.qtdProduto}">
                                                        <span class="material-icons" id="add" style="font-size: 1rem; color: black; cursor: pointer;" onclick="adicionarProdutoCarrinho(${produto.codProduto}, 2)">add</span>
                                                    </div>
                                                </td>
                                                <!-- Valor -->
                                                <td style="vertical-align: middle;">
                                                    R$ ${produto.precoProduto}
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach> 
                                </tbody>
                            </table>
                            <input name="cepfrete" type="number" id="cepfrete" placeholder="">
                            <div class="fretes">
                                 <fieldset>
                                    <label>Frete 01</label>
                                    <input name="frete1" type="number" id="frete1" placeholder="">
                                    <span>19,00</span>
                                </fieldset>
                                <fieldset>
                                    <label>Frete 02</label>
                                    <input name="frete2" type="number" id="frete2" placeholder="">
                                    <span>10,00</span>
                                </fieldset>
                                <fieldset>
                                    <label>Frete 03</label>
                                    <input name="frete3" type="number" id="frete3" placeholder="">
                                    <span>13,00</span>
                                </fieldset>
                            </div>
                        </div>

                        <!-- Container Resumo do pedido -->
                        <div class="col-6 col-md-4" style="background-color: #f8f8f8;">

                            <h3 class="resumoTitulo">resumo do pedido</h3>
                            <ul class="sumario-detalhes">
                                <c:forEach items="${sessionScope.listaProdutos}" var="produto">
                                    <li class="detalhe">
                                        <!-- Quantidade -->
                                        <span>${produto.qntCarrinho} - ${produto.nomeProduto}</span>
                                        <!-- Valor -->
                                        <span>R$ ${produto.precoProduto}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="caixaTotal">
                                <span class="txtTotal">SubTotal</span>
                                <span class="txtTotal">R$ ${sessionScope.totalCompra} + $frete </span>
                            </div>

                            <div class="caixaTotal">
                                <span class="txtTotal">Total</span>
                                <span class="txtTotal">R$ ${sessionScope.totalCompra}</span>
                            </div>
                            <c:choose>
                                <c:when test="${sessionScope.email_cli.cliente}">
                                    <a href="finalizar-compra.jsp" class="btnComprar">
                                        continuar
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="login_cliente.jsp" class="btnComprar">
                                        continuar
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>         
                    <h1> TEM NADA AQUI </h1>
                </c:otherwise>
            </c:choose>
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
            <script>
                var $campoCepFrete = document.querySelector('[name="cepfrete"]');
                var $campoFrete1 = document.querySelector('[name="frete1"]');
                var $campoFrete2 = document.querySelector('[name="frete2"]');
                var $campoFrete3 = document.querySelector('[name="frete3"]');

                $("#cepfrete").focusout(function () {
                    $(".fretes").show();
                });
                function adicionarProdutoCarrinho(codProduto, x) {
                    if (x === 2) {
                        $.get("CarrinhoProduto?codProduto=" + codProduto, function (resposta) {
                            let numeroCarrinho = 0;
                            numeroCarrinho += 1;
                            document.location.reload(true);
                        });

                    } else {
                        $.get("CarrinhoProduto?codProduto=" + codProduto + " " + 1, function (resposta) {
                            let numeroCarrinho = 0;
                            numeroCarrinho -= 1;
                            document.location.reload(true);
                        });
                    }
                }
            </script>
        </section>
    </body>
</html>
