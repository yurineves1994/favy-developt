<%-- 
    Document   : compra_finalizada
    Created on : 12/05/2021, 21:02:05
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            ::-webkit-scrollbar{
                width: 10px;
                border-radius: 5px;
            }
            ::-webkit-scrollbar-thumb{
                -webkit-box-shadow: inset 0 0 20px #ee6a6a;
            }
            
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-image: linear-gradient(131deg, rgba(8, 110, 161, 0.8) 0%, #73b667 100%);
            }

            .dados {
                left: 50%;
                top: 50%;
                width: 80vw;
                height: auto;
                background: #d6c9c9;
                z-index: 15;
                padding: 15px 30px;
                color: #003333;
                border-radius: 15px;
                border: #e5e5e5 2px solid;
                border-top: #00d9ff 2px solid;
                animation: rotacao .5s infinite ease-out;
            }

            .dados > span{
                text-transform: uppercase;
            }


            .dados:hover {
                transform: translateX(-3px);
                box-shadow: 4px 15px 16px 0;
            }

            @keyframes rotacao {
                25% {
                    border: #e5e5e5 2px solid;
                    border-top: #00d9ff 2px solid;
                }

                50% {
                    border: #e5e5e5 2px solid;
                    border-left: #00d9ff 2px solid;
                }

                75% {
                    border: #e5e5e5 2px solid;
                    border-bottom: #00d9ff 2px solid;
                }

                100% {
                    border: #e5e5e5 2px solid;
                    border-right: #00d9ff 2px solid;
                }
            }

            .btn-voltar {
                width: 150px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                border-radius: 50px;
                background-image: linear-gradient(131deg, rgba(49, 81, 97, 0.8) 0%, #73b667 100%);
                color: #d6d5d5;
                text-decoration: none;
                margin-top: 20px;
            }

            .btn-voltar:hover {
                color: white;
                background-image: linear-gradient(131deg, rgba(103, 178, 216, 0.8) 0%, #73b667 100%);
            }

            h1 {
                color: white;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <h1>PARABEEEEENS, ${sessionScope.email_cli.nomeCliente}! </h1>
            <h2>CODIGO DE RASTREIO - ${sessionScope.email_cli.codCliente * 987654698908203832}</h2>
            <section>
                <div class="dados">
                    <span>codigo cliente: ${sessionScope.email_cli.codCliente}</span> /
                    <span>codigo pedido: ${pedido.codPedido}</span>
                    <h4>DADOS - PEDIDO</h4>
                    <span>${pedido.codPedido}</span><br>
                    <span>CEP ${pedido.cepEndereco} - </span>
                    <span>${pedido.ruaEndereco} , </span>
                    <span>${pedido.bairroEndereco} - </span>
                    <span>${pedido.cidadeEndereco} / </span>
                    <span>${pedido.ufEndereco}, </span>
                    <span>${pedido.numEndereco}</span>
                    <span>(${pedido.complEndereco})</span>
                    <h4>DADOS - PAGAMENTO</h4>
                    <c:choose>
                        <c:when test="${pedido.formaPagamento} == 'b'}">
                            <span>Boleto /</span>
                        </c:when>
                        <c:otherwise>
                            <span>Cartão /</span>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${pedido.statusPedido} == 'a'}">
                            <span>Aguardando Pedido/</span>
                        </c:when>
                        <c:otherwise>
                            <span>Entregue/</span>
                        </c:otherwise>
                    </c:choose>    
                    <h2>R$ ${pedido.valorFinal}</h2>
                </div>
                <a href="CardsProdutos">
                    <div class="btn-voltar" onclick="adicionarProdutoCarrinho(1, 4)">
                        VOLTAR
                    </div>
                </a>

            </section>
            <div>

            </div>
        </div>
                <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
        <script>
            function adicionarProdutoCarrinho(codProduto, x) {
                console.log(x);


                $.get("CarrinhoProduto?codProduto=" + codProduto + " " + x, function (resposta) {
                    let numeroCarrinho = 0;
                    numeroCarrinho -= 1;
                    document.location.reload(true);
                });

            }
        </script>
    </body>

</html>
