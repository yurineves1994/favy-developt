
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            body {
                background-color: rgb(241, 240, 240);
                margin: 0;
            }

            .container {
                max-width: 1920px;
                width: 100%;
            }
            .informacoes-finalizar {
                position: relative;
                width: 90%;
                margin-left: auto;
                margin-right: auto;
                padding-top: 3em;
                padding-bottom: 5em;
                text-align: center;
            }

            .informacoes-finalizar input,
            .informacoes-finalizar select {
                background-color: #fff;
                width: 100%;
                border-radius: 5px;
                border-color: transparent;
                padding: 10px 20px;
                font-size: 18px;
                margin: 10px;
            }
            input .total {
                width: 100%;
            }
            .pagamento li {
                list-style: none;
                text-align: justify;
                padding: 10px;
            }

            .pagamento {
                position: relative;
                width: 40%;
                margin-left: auto;
                margin-right: auto;
                padding-top: 3em;
                padding-bottom: 5em;
                text-align: center;
            }

            .pagamento input,
            .pagamento select {
                background-color: #fff;
                width: 100%;
                border-radius: 5px;
                border-color: transparent;
                padding: 10px 20px;
                font-size: 18px;
                margin: 10px;
            }

            .pagamento input[type=submit],
            .pagamento input[type=reset] {
                background-color: #152b4b;
                text-transform: uppercase;
                color: #fff;
                cursor: pointer;
                transition: .5s;
            }
            .menu-pagamento{
                display: flex;
                justify-content: center;
                list-style: none;
                text-transform: uppercase;
            }
            .menu-pagamento li {
                margin: 10px 0 0 10px;
                border: 1px solid black;
                padding: 10px ;
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
            .menu-pagamento a {
                text-decoration: none;
                color: black;
            }
            #boleto{
                display: none;
            }
            .ativo {
                background: rgb(238, 106, 106);
                color: white;
            }
            .informacoes-finalizar {
                display: flex;
                justify-content:space-around;
                margin-top: 75px;
            }
            .div-endereco-entrega {
                width: 40%;
            }
            .div-resumo-compra {
                width: 40%;
            }
            .caminho-compra {
                display: flex;
                justify-content:space-around;
                align-items: center;
            }
            .caminho-compra > div.hoje {
                padding: 20px;
                background: rgb(238, 106, 106);;
                color: white;
                border-radius: 15px;
            }
        </style>
    </head>


    <body>
        <nav class="cabecalho">
            <h1 class="logo">FAVY</h1>
            <div class="caminho-compra">
                <div>Carrinho</div>
                <div class="hoje">Pagamento</div>
                <div>Obrigado, volte sempre!</div>
            </div>
        </nav>
        <div class="informacoes-finalizar">
            <div class="div-endereco-entrega">
                <h3>Endereço Entrega</h3>
                <input disabled value="${sessionScope.email_cli.nomeCliente}">
                <input disabled value="${sessionScope.email_cli.ruaEnt1}">
                <input disabled value="${sessionScope.email_cli.numEnt1}">
                <input disabled value="${sessionScope.email_cli.complEnt1}">
                <input disabled value="${sessionScope.email_cli.cepEnt1}">  
            </div>
            <div class="div-resumo-compra">
                <h3>Resumo da Compra</h3>
                <c:forEach items="${sessionScope.listaProdutos}" var="produto">       
                    <span><input disabled value="${produto.qntCarrinho}"><input disabled value="${produto.nomeProduto}"></span>             
                    </c:forEach>
                <span class="total">TOTAL: R$<input disabled value="${sessionScope.totalCompra}"></span>
            </div>
        </div>
        <ul class="menu-pagamento">
            <a href="#" id="botao-cartao"><li class="ativo">Cartão de Credito</li></a>
            <a href="#" id="botao-boleto"><li>Boleto</li></a>
        </ul>
        <div id="cartao">
            <form class="pagamento" action="post">
                <legend>Cartão</legend>
                <div class="row">
                    <div>
                        <input type="text" placeholder="numero cartão">
                    </div>
                    <div>
                        <input type="text" placeholder="nome impresso no cartão">
                    </div>
                    <div>
                        <input type="text" placeholder="validade">
                        <input type="text" placeholder="cvv">
                    </div>
                    <div>
                        <input type="text" placeholder="número de parcelas">
                    </div>
                    <h2>TOTAL: R$ ${sessionScope.totalCompra}</h2>
                </div>
            </form>
        </div>
        <div id="boleto">
            <div class="pagamento">
                <h4>Boleto</h4>
                <ul>
                    <li>-> o boleto e pague no banco</li>
                    <li>-> ou pague pela internet utilizando o código de barras do boleto</li>
                    <li>-> o prazo de validade do boleto é de 1 dia util</li>
                    <h2>TOTAL: R$ ${sessionScope.totalCompra}</h2>
                </ul>
            </div>
        </div>
        <script>
            $("#botao-cartao").click(function () {
                $("#cartao").show();
                $("#boleto").hide();
                $("#botao-cartao li").addClass('ativo');
                $("#botao-boleto li").removeClass('ativo');
            });
            $("#botao-boleto").click(function () {
                $("#boleto").show();
                $("#cartao").hide();
                $("#botao-cartao li").removeClass('ativo');
                $("#botao-boleto li").addClass('ativo');
            });
        </script>

    </body>

</html>