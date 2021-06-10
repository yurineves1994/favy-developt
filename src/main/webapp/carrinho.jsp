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
        
        <style>
            ::-webkit-scrollbar{
                width: 10px;
                border-radius: 5px;
            }
            ::-webkit-scrollbar-thumb{
                -webkit-box-shadow: inset 0 0 20px #ee6a6a;
            }


            .fretes {
                display: none;
            }
            .inativo {
                display: none;
            }
            .cabecalho{
                width: 100%;
                height: 70px;
                background-color: #ee6a6a;
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
                justify-content: space-around;
                align-items: center;
                
            }
            .caminho-compra > div {
                margin-left: 50px; 
                margin-right:  50px; 
            }
            .caminho-compra > div.hoje {               
                font-weight: 600;
                font-size: 19px;
                letter-spacing: 2px;
                text-transform: uppercase;

                padding: 20px;
                background: rgb(238, 106, 106);;
                color: white;
                border-radius: 15px;
            }
            #enderecos-frete {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            #enderecos-frete > div {
                margin-top: 30px;
                width: 49%;
                height: auto;
                padding: 10px;
                background: rgb(238, 106, 106);
                color: white;
                border-radius: 10px;
                border-color: black;
                cursor: pointer;
            }
            .escolhido {
                background: red;
            }
            .calcularFrete{
                background-color: rgb(98, 63, 253);
                text-transform: uppercase;
                color: #fff;
                cursor: pointer;
                transition: .5s;
                text-decoration: none;
                
            }
        </style>
    </head>

    <body style="background-color: rgb(255, 255, 255);">
        <nav class="cabecalho">

            <a href="CardsProdutos">
                <h1 class="logo">FAVY</h1>
            </a>

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
                                                            <img src="data:image/png;base64, ${produto.imagemProduto.get(0)}" class="imgProduto">
                                                        </div>
                                                        <div class="descricaoProduto">
                                                            ${produto.nomeProduto}
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
                            
                            <fieldset>
                                <label>Frete</label>
                                <input name="cep" type="number" id="cepEntrega" placeholder="">
                                <button class="calcularFrete" onclick="adicionarProdutoCarrinho(1, 3)">Calcular</button>
                            </fieldset> 
                            
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
                                <span class="txtTotal">R$ ${sessionScope.totalCompra} + ${sessionScope.frete} </span>
                            </div>

                            <div class="caixaTotal">
                                <span class="txtTotal">Total</span>
                                <span class="txtTotal">R$ ${sessionScope.totalCompra + sessionScope.frete}</span>
                            </div>
                            <c:choose>
                                <c:when test="${sessionScope.email_cli.cliente}">
                                    <a href="finalizar-compra.jsp?EnderecoEscolhido" class="btnComprar">
                                        continuar
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="login_cliente.jsp" class="btnComprar">
                                        continuar
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <button onclick="adicionarProdutoCarrinho(1, 4)"> LIMPAR </button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>         
                    <h1> Carrinho Vazio </h1>
                </c:otherwise>
            </c:choose>
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
            <script>
                $('.calcularFrete').hide();           
                $('#cepEntrega').keyup(function(){
                    var palavra01 = this.value.split("");
                    if(palavra01.length >= 8){
                        $('.calcularFrete').show();
                    }
                });

                    function adicionarProdutoCarrinho(codProduto, x) {
                        console.log(x);


                        $.get("CarrinhoProduto?codProduto=" + codProduto + " " + x, function (resposta) {
                            let numeroCarrinho = 0;
                            numeroCarrinho -= 1;
                            document.location.reload(true);
                        });

                    }
            </script>
        </section>
    </body>
</html>
