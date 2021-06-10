
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
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

        
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
                background-color: rgb(238, 106, 106);
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
            .informacoes-finalizar-entrega {
                display: flex;
                justify-content:space-around;
                margin-top: 75px;

            }
            .informacoes-finalizar {
                display: flex;
                justify-content:space-around;
                margin-top: 75px;
            }
            .div-endereco-entrega {
                width: 50%;
            }
            .div-endereco-entrega input{
                background: rgb(241, 240, 240);
                border: none;
            }
            .div-endereco-entrega2{
                width: 50%;
            }
            .div-endereco-entrega2 input{
                background: rgb(241, 240, 240);
                border: none;
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
                font-weight: 600;
                font-size: 19px;
                letter-spacing: 2px;
                text-transform: uppercase;

                padding: 20px;
                background: rgb(238, 106, 106);
                color: white;
                border-radius: 15px;
            }


            /*Nova Versão*/
            .cxa_resumoComparCenterV2{
                padding: 48px;
            }
            .cxa_tituloResumoCompraV2{
                margin-bottom: 20px;
                border-bottom: 1px solid #e6e6e6;
            }
            .textoTituloResumoCompraV2{
                font-size: 16px;
                font-weight: 600;
                padding: 8px 0 12px;
                display: inline-block;
            }
            .detalheV2{
                list-style: none;
                display: flex;
                justify-content: space-between;
                padding: .4rem 0;
            }


            /*endereco*/
            .cxa_selecioneEnderecoV2{
                background-color: #f5f5f5;
                padding: 20px 32px;
                width: 100%;
                text-align: left;
                border-radius: 9px;
            }

            .iconEnderecoV2{
                width: 21px;
                padding-top: 14px;
            }
            .cxa_iconV2{
                float: left;
                padding-right: 24px;
                text-align: center;
                padding-top: 8px;
            }
            .cxa_estiloIconV2{
                width: 60px;
                height: 60px;
                background-color: white;
                border-radius: 100%;
            }

            .cxa_infoV2{
                display: table-cell;
                width: 100%;
                
            }
            .txt_ruaENumeroV2{
                font-size: 16px;
                margin-bottom: 5px;
                font-weight: 600;
            }
        </style>
    </head>


    <body>
        <nav class="cabecalho">
            <a href="CardsProdutos">
                <h1 class="logo">FAVY</h1>
            </a>
            <div class="caminho-compra">
                <div>Carrinho</div>
                <div class="hoje">Pagamento</div>
                <div>Obrigado, volte sempre!</div>
            </div>
        </nav>



        <section class="container" style="max-width: 1286px; margin-top: 150px;">
            
            <div class="row">
                <div class="col-md-8">
                    <h2> Endereço selecionado </h2>

                    <div class="cxa_selecioneEnderecoV2">
                        <div class="cxa_iconV2">
                            <div class="cxa_estiloIconV2">
                                <img src="icones/icon-endereco.png" class="iconEnderecoV2">
                            </div>
                        </div>

                        <div class="cxa_infoV2">
                            <span class="txt_ruaENumeroV2"> ${sessionScope.email_cli.ruaEnt1}&nbsp${sessionScope.email_cli.numEnt1} </span>
                            <br>
                            <p style="margin-bottom: 5px;"><span class="txt_enderecoV2"> ${sessionScope.email_cli.cidadeEnt1}, ${sessionScope.email_cli.ufEnt1} - CEP ${sessionScope.email_cli.cepEnt1}  </span></p>
                            <span class="txt_enderecoV2"> ${sessionScope.email_cli.nomeCliente} </span>
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
                                    <input name="numerocartao" type="text" placeholder="numero cartão">
                                </div>
                                <div>
                                    <input name="nomecartao" type="text" placeholder="nome impresso no cartão">
                                </div>
                                <div>
                                    <input name="validade" type="number" placeholder="validade">
                                    <input name="cvv" type="number" placeholder="cvv" id="cvv">
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



                </div>

                <div class="col-6 col-md-4" style="background-color: #f8f8f8;">

                    <div class="cxa_resumoComparCenterV2">
                        <h3 class="cxa_tituloResumoCompraV2"> 
                            <span class="textoTituloResumoCompraV2">Resumo da compra</span>
                        </h3>
                        
                        <div>
                            <c:forEach items="${sessionScope.listaProdutos}" var="produto">
                                <li class="detalheV2">
                                    <span> ${produto.nomeProduto}(${produto.qntCarrinho}) </span>
                                    <span> R$ ${produto.precoProduto} </span>
                                </li>
                            </c:forEach>
                            <div class="cxa_tituloResumoCompraV2">
                                <li class="detalheV2">
                                    <span> Frete </span>
                                    <span> R$ ${sessionScope.frete} </span>
                                </li>
                            </div>
                        </div>
                        <div>
                            <li class="detalheV2">
                                <span> Total </span>
                                <span> R$${sessionScope.totalCompra + sessionScope.frete} </span>
                            </li>
                        </div>
                        
                    </div>

                </div>
            </div>

        </section>
        <div class="informacoes-finalizar-entrega">
            <c:if test="${sessionScope.email_cli.cepEnt1 != null}"> 
                <form>
                    <input class="form-check-input" type="radio" id="entrega01" name="entrega01" value="entrega1">
                    <div class="div-endereco-entrega" id="entrega01">
                        <h3>Endereço Entrega</h3>      
                        <input name="nomeCliente1" disabled value="${sessionScope.email_cli.nomeCliente}">
                        <input name="cidadeEnt1" disabled value="${sessionScope.email_cli.cidadeEnt1}">
                        <input name="ruaEnt1" disabled value="${sessionScope.email_cli.ruaEnt1}">
                        <input name="bairroEnt1" disabled value="${sessionScope.email_cli.bairroEnt1}">
                        <input name="ufEnt1" disabled value="${sessionScope.email_cli.ufEnt1}">
                        <input name="numEnt1" disabled value="${sessionScope.email_cli.numEnt1}">
                        <input name="complEnt1" disabled value="${sessionScope.email_cli.complEnt1}">
                        <input name="cepEnt1" disabled value="${sessionScope.email_cli.cepEnt1}">  
                    </div>
                </form>
                    
            </c:if>
            <c:if test="${sessionScope.email_cli.cepEnt2 != null}">
                <form>
                    <input class="form-check-input" type="radio" id="entrega02" name="entrega02" value="entrega2">
                    <div class="div-endereco-entrega2">                 
                        <h3>Endereço Entrega 02</h3>
                        <input name="nomeCliente2" disabled value="${sessionScope.email_cli.nomeCliente}">
                        <input name="cidadeEnt2" disabled value="${sessionScope.email_cli.cidadeEnt2}">
                        <input name="ruaEnt2" disabled value="${sessionScope.email_cli.ruaEnt2}">
                        <input name="bairroEnt2" disabled value="${sessionScope.email_cli.bairroEnt2}">
                        <input name="ufEnt2" disabled value="${sessionScope.email_cli.ufEnt2}">
                        <input name="numEnt2" disabled value="${sessionScope.email_cli.numEnt2}">
                        <input name="complEnt2" disabled value="${sessionScope.email_cli.complEnt2}">
                        <input name="cepEnt2" disabled value="${sessionScope.email_cli.cepEnt2}">  
                    </div>
                </form>
            </c:if>
        </div>

    <div style="display: none;">
        <div class="informacoes-finalizar">
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
                        <input name="numerocartao" type="text" placeholder="numero cartão">
                    </div>
                    <div>
                        <input name="nomecartao" type="text" placeholder="nome impresso no cartão">
                    </div>
                    <div>
                        <input name="validade" type="number" placeholder="validade">
                        <input name="cvv" type="number" placeholder="cvv" id="cvv">
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

    </div>


        <form action="<c:url value="/PedidosServlet"/>" method="POST">

        <div style="display: none;">

            <input required name="codCliente" value="${sessionScope.email_cli.codCliente}" type="text" class="form-control" id="cod_cliente" placeholder="">
            <input required name="cepCompra" type="number" class="form-control" id="cepCompra" placeholder="">
            <input required name="logradouroCompra" type="text" class="form-control" id="logradouroCompra" placeholder="">
            <input required name="bairroCompra" type="text" class="form-control" id="bairroCompra" placeholder="">
            <input required name="localidadeCompra" type="text" class="form-control" id="localidadeCompra" placeholder="">
            <input required name="ufCompra" type="text" class="form-control" id="ufCompra" placeholder="">
            <input required name="numeroCompra" type="number" class="form-control" id="numero" placeholder="">
            <input required name="complementoCompra" type="text" class="form-control" id="text" placeholder="">
            <input required name="totalCompra" type="text" value="${sessionScope.totalCompra}" class="form-control" id="complemento" placeholder="">
            <input required name="frete" type="text" value="${sessionScope.frete}" class="form-control" id="frete" placeholder="">
            <% int i = 1;%> 
            <c:forEach items="${sessionScope.listaProdutos}" var="produto">
                <input required name="qnt<%=i%>" value="${produto.qntCarrinho}">
                <input required name="nome<%=i%>" value="${produto.nomeProduto}">
                <input required name="preco<%=i%>" value="${produto.precoProduto}">
                <%=i++%>
            </c:forEach>
            <input required name="qntProduto" value="<%=i%>">
            <input required name="formaPagamento" type="text" class="form-control" id="formaPagamento" placeholder="">    
            <input name="numeroCartaoCompra" type="text" class="form-control" id="numeroCartao" placeholder="">
            <input name="nomeCartaoCompra" type="text" class="form-control" id="nomeCartao" placeholder="">
            <input name="validadeCompra" type="number" class="form-control" id="validade" placeholder="">
            <input name="cvvCompra" type="number" class="form-control" id="cvv" placeholder="">
            
        </div>    
            
            <input type="submit" value="Enviar">
        </form>
        <script>
            // campos faturamento
            var $campoCep = document.querySelector('[name="cepEnt1"]');
            var $campoRua = document.querySelector('[name="ruaEnt1"]');
            var $campoBairro = document.querySelector('[name="bairroEnt1"]');
            var $campoCidade = document.querySelector('[name="cidadeEnt1"]');
            var $campoEstado = document.querySelector('[name="ufEnt1"]');
            var $campoNumero = document.querySelector('[name="numEnt1"]');
            var $campoComplemento = document.querySelector('[name="complEnt1"]');

            // campos entrega 01
            var $campoCep01 = document.querySelector('[name="cepEnt2"]');
            var $campoRua01 = document.querySelector('[name="ruaEnt2"]');
            var $campoBairro01 = document.querySelector('[name="bairroEnt2"]');
            var $campoCidade01 = document.querySelector('[name="cidadeEnt2"]');
            var $campoEstado01 = document.querySelector('[name="ufEnt2"]');
            var $campoNumero01 = document.querySelector('[name="numEnt2"]');
            var $campoComplemento01 = document.querySelector('[name="complEnt2"]');

            // campos compra
            var $campoCepCompra = document.querySelector('[name="cepCompra"]');
            var $campoRuaCompra = document.querySelector('[name="logradouroCompra"]');
            var $campoBairroCompra = document.querySelector('[name="bairroCompra"]');
            var $campoCidadeCompra = document.querySelector('[name="localidadeCompra"]');
            var $campoEstadoCompra = document.querySelector('[name="ufCompra"]');
            var $campoNumeroCompra = document.querySelector('[name="numeroCompra"]');
            var $campoComplementoCompra = document.querySelector('[name="complementoCompra"]');
            var $campoFormaPagamento = document.querySelector('[name="formaPagamento]');
            var $campoNumeroCartaoCompra = document.querySelector('[name="numeroCartaoCompra"]');
            var $campoNomeCartaoCompra = document.querySelector('[name="nomeCartaoCompra"]');
            var $campoValidadeCompra = document.querySelector('[name="validadeCompra"]');
            var $campoCvvCompra = document.querySelector('[name="cvvCompra"]');

            // campos pagamento
            var $campoNumeroCartao = document.querySelector('[name="numerocartao"]');
            var $campoNomeCartao = document.querySelector('[name="nomecartao"]');
            var $campoValidade = document.querySelector('[name="validade"]');
            var $campoCvv = document.querySelector('[name="cvv"]');

            $("input[name=entrega01]").click(function () {
                if ($(this).prop("checked") == true) {
                    $campoCepCompra.value = $campoCep.value;
                    $campoRuaCompra.value = $campoRua.value;
                    $campoBairroCompra.value = $campoBairro.value;
                    $campoCidadeCompra.value = $campoCidade.value;
                    $campoEstadoCompra.value = $campoEstado.value;
                    $campoNumeroCompra.value = $campoNumero.value;
                    $campoComplementoCompra.value = $campoComplemento.value;
                    $("input[name=entrega02]").prop("checked", false);
                }
            });
            $("input[name=entrega02]").click(function () {
                if ($(this).prop("checked") == true) {
                    $campoCepCompra.value = $campoCep01.value;
                    $campoRuaCompra.value = $campoRua01.value;
                    $campoBairroCompra.value = $campoBairro01.value;
                    $campoCidadeCompra.value = $campoCidade01.value;
                    $campoEstadoCompra.value = $campoEstado01.value;
                    $campoNumeroCompra.value = $campoNumero01.value;
                    $campoComplementoCompra.value = $campoComplemento01.value;
                    $("input[name=entrega01]").prop("checked", false);
                }
            });
            $("#cvv").focusout(function () {
                $campoNumeroCartaoCompra.value = $campoNumeroCartao.value;
                $campoNomeCartaoCompra.value = $campoNomeCartao.value;
                $campoValidadeCompra.value = $campoValidade.value;
                $campoCvvCompra.value = $campoCvv.value;
            });
            $("#botao-cartao").click(function () {
                $("#cartao").show();
                $("#boleto").hide();
                $("#botao-cartao li").addClass('ativo');
                $("#botao-boleto li").removeClass('ativo');
                $('[name="formaPagamento"]').val("c");
                $('[name="numeroCartaoCompra"]').val("");

            });
            $("#botao-boleto").click(function () {
                $("#boleto").show();
                $("#cartao").hide();
                $("#botao-cartao li").removeClass('ativo');
                $("#botao-boleto li").addClass('ativo');
                $('[name="formaPagamento"]').val("b");
                $('[name="numeroCartaoCompra"]').val("0000000000000000");
                $('[name="nomeCartaoCompra"]').val("");
                $('[name="validadeCompra"]').val("");
                $('[name="cvvCompra"]').val("");
                $('[name="numerocartao"]').val("");
                $('[name="nomecartao"]').val("");
                $('[name="validade"]').val("");
                $('[name="cvv"]').val("");
            });
        </script>

    </body>

</html>