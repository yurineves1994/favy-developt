
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
		::-webkit-scrollbar {
			width: 10px;
			border-radius: 5px;
		}

		::-webkit-scrollbar-thumb {
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

		.menu-pagamento {
			display: flex;
			justify-content: center;
			list-style: none;
			text-transform: uppercase;
		}

		.menu-pagamento li {
			margin: 10px 0 0 10px;
			border: 1px solid black;
			padding: 10px;
		}

		.cabecalho {
			width: 100%;
			height: 70px;
			background-color: rgb(238, 106, 106);
			position: fixed;
			top: 0;
			left: 0;
			z-index: 5005;
			border-bottom: solid 1px white;
		}

		.logo {
			float: left;
			font-size: 40px;
			letter-spacing: 13px;
			color: aliceblue;
			position: relative;
			left: 7%;
			top: 50%;
			transform: translate(-50%, -50%);
		}

		.menu-pagamento a {
			text-decoration: none;
			color: black;
		}

		#boleto {
			display: none;
		}

		.ativo {
			background: rgb(238, 106, 106);
			color: white;
		}

		.informacoes-finalizar-entrega {
			display: flex;
			justify-content: space-around;
			margin-top: 75px;

		}

		.informacoes-finalizar {
			display: flex;
			justify-content: space-around;
			margin-top: 75px;
		}

		.div-endereco-entrega {
			width: 100%;
		}

		.div-endereco-entrega input {
			background: rgb(241, 240, 240);
			border: none;
		}

		.div-endereco-entrega2 {
			width: 100%;
		}

		.div-endereco-entrega2 input {
			background: rgb(241, 240, 240);
			border: none;
		}

		.div-resumo-compra {
			width: 40%;
		}

		.caminho-compra {
			display: flex;
			justify-content: space-around;
			align-items: center;
		}

		.caminho-compra>div.hoje {
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
		.cxa_resumoComparCenterV2 {
			padding: 48px;
		}

		.cxa_tituloResumoCompraV2 {
			margin-bottom: 20px;
			border-bottom: 1px solid #e6e6e6;
		}

		.textoTituloResumoCompraV2 {
			font-size: 16px;
			font-weight: 600;
			padding: 8px 0 12px;
			display: inline-block;
		}

		.detalheV2 {
			list-style: none;
			display: flex;
			justify-content: space-between;
			padding: .4rem 0;
		}


		/*endereco*/
		.cxa_selecioneEnderecoV2 {
			background-color: #f5f5f5;
			padding: 20px 32px;
			width: 100%;
			text-align: left;
			border-radius: 9px;
		}

		.iconEnderecoV2 {
			width: 21px;
			padding-top: 14px;
		}

		.cxa_iconV2 {
			float: left;
			padding-right: 24px;
			text-align: center;
			padding-top: 8px;
		}

		.cxa_estiloIconV2 {
			width: 60px;
			height: 60px;
			background-color: white;
			border-radius: 100%;
		}

		.cxa_infoV2 {
			display: table-cell;
			width: 100%;

		}

		.txt_ruaENumeroV2 {
			font-size: 16px;
			margin-bottom: 5px;
			font-weight: 600;
		}

		/* inicio css popup finalizar compra */
		#popup-pagamento {
			display: none;
			position: fixed;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			background: rgba(0, 0, 0, 0.7);
		}

		#popup-pagamento .conteudo {
			position: fixed;
			left: 50%;
			top: 50%;
			max-width: 90%;
			max-height: 500px;
			background: white;
			z-index: 15;
			padding: 15px 30px;
			color: #003333;
			border-radius: 15px;
			transform: translate(-50%, -50%);
		}

		#popup-pagamento .conteudo .fechar {
			position: absolute;
			right: 10px;
			top: 5px;
			width: 30px;
			height: 30px;
			padding: 0 5px;
			color: #fff;
			font-size: 26px;
			border-radius: 62px;
			background: rgb(238, 106, 106);
			font-family: arial, sans-serif;
			text-align: center;
			overflow: hidden;
			line-height: 1em;
			font-style: normal;
			cursor: pointer;
		}

		#popup-pagamento .conteudo form {
			width: 100%;
		}

		#popup-pagamento .conteudo input {
			font-size: 14px;
			line-height: 1.4em;
			margin: 5px 0;
			width: 100%;
			border: none;
		}

		#popup-pagamento .conteudo input:focus {
			box-shadow: 0 0 0 0;
			outline: 0;
		}

		#popup-pagamento .conteudo input[type=submit] {
			width: 100%;
			height: 50px;
			background: #ee6a6a;
			color: white;
			border-radius: 10px;
		}

		.aparecer-popup {
			width: 250px;
			height: 50px;
			background: #ee6a6a;
			color: white;
			border-radius: 10px;
			margin: 20px;
		}

		/* configuração endereço*/
		.informacoes-finalizar-entrega {
			width: 100%;
		}

		.informacoes-finalizar-entrega form {
			width: 80%;
			height: auto;
			margin: 25px;
			border: 1px solid black;
			border-radius: 10px;
			background: rgba(238, 106, 106, 0.2);
		}

		.informacoes-finalizar-entrega form input {
			font-size: 14px;
			line-height: 1.1em;
			margin: 5px 0;
			width: 100%;
			border: none;
			background: rgba(238, 106, 106, 0.2);
		}
		.active {			
			background: rgba(238, 106, 106, 0.7);
		}
		.informacoes-finalizar-entrega input[type=radio]{
			display: none;
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
                                    <input name="numerocartao" type="text" placeholder="numero cartão" maxlength="16" minlength="16">
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
					<!-- <h3>Endereço Entrega</h3> -->
					<div class="row">
						<div class="col-sm-6">
							<input name="cidadeEnt1" disabled value="${sessionScope.email_cli.cidadeEnt1}">
						</div>
						<div class="col-sm-6">
							<input name="ruaEnt1" disabled value="${sessionScope.email_cli.ruaEnt1}">
						</div>
						<div class="col-sm-4">
							<input name="bairroEnt1" disabled value="${sessionScope.email_cli.bairroEnt1}">
						</div>
						<div class="col-sm-4">
							<input name="ufEnt1" disabled value="${sessionScope.email_cli.ufEnt1}">
						</div>
						<div class="col-sm-4">
							<input name="numEnt1" disabled value="${sessionScope.email_cli.numEnt1}">
						</div>
						<div class="col-sm-6">
							<input name="complEnt1" disabled value="${sessionScope.email_cli.complEnt1}">
						</div>
						<div class="col-sm-6">
							<input name="cepEnt1" disabled value="${sessionScope.email_cli.cepEnt1}">
						</div>
					</div>
				</div>
			</form>

		</c:if>
		<c:if test="${sessionScope.email_cli.cepEnt2 != null}">
			<form>
				<input class="form-check-input" type="radio" id="entrega02" name="entrega02" value="entrega2">
				<div class="div-endereco-entrega2">
					<!-- <h3>Endereço Entrega 02</h3> -->
					<div class="row">
						<div class="col-sm-6">
							<input name="cidadeEnt2" disabled value="${sessionScope.email_cli.cidadeEnt2}">
						</div>
						<div class="col-sm-6">
							<input name="ruaEnt2" disabled value="${sessionScope.email_cli.ruaEnt2}">
						</div>
						<div class="col-sm-4">
							<input name="bairroEnt2" disabled value="${sessionScope.email_cli.bairroEnt2}">
						</div>
						<div class="col-sm-4">
							<input name="ufEnt2" disabled value="${sessionScope.email_cli.ufEnt2}">
						</div>
						<div class="col-sm-4">
							<input name="numEnt2" disabled value="${sessionScope.email_cli.numEnt2}">
						</div>
						<div class="col-sm-6">
							<input name="complEnt2" disabled value="${sessionScope.email_cli.complEnt2}">
						</div>
						<div class="col-sm-6">
							<input name="cepEnt2" disabled value="${sessionScope.email_cli.cepEnt2}">
						</div>
					</div>
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
                        <input name="numerocartao" type="text" placeholder="numero cartão" maxlength="16" minlength="16">
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
                    <li>-> O boleto e pague no banco</li>
                    <li>-> Ou pague pela internet utilizando o código de barras do boleto</li>
                    <li>-> O prazo de validade do boleto é de 1 dia util</li>
                    <h2>TOTAL: R$ ${sessionScope.totalCompra}</h2>
                </ul>
            </div>
        </div>

    </div>


        <button class="aparecer-popup">Finalizar Compra</button>
	<div id="popup-pagamento">
		<div class="conteudo">
			<div class="info">
				<i class="fechar">X</i>
				<form action="<c:url value="/PedidosServlet"/>" method="POST">
					<div class="row">
						<div class="col-sm-6">
							<input required name="codCliente" value="${sessionScope.email_cli.codCliente}" type="text"
								id="cod_cliente" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
                                                    <input required name="cepCompra" type="number" id="cepCompra" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<input required name="logradouroCompra" type="text" id="logradouroCompra" placeholder=""
								readonly>
						</div>
						<!-- fim da primeira linha-->
						<div class="col-sm-6">
							<input required name="bairroCompra" type="text" id="bairroCompra" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<input required name="localidadeCompra" type="text" id="localidadeCompra" placeholder=""
								readonly>
						</div>
						<div class="col-sm-6">
							<input required name="ufCompra" type="text" id="ufCompra" placeholder="" readonly>
						</div>
						<!-- fim da segunda linha-->
						<div class="col-sm-6">
							<input required name="numeroCompra" type="number" id="numero" placeholder="" readonly maxlength="16" minlength="16">
						</div>
						<div class="col-sm-6">
							<input required name="complementoCompra" type="text" id="text" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<input required name="totalCompra" type="text" value="${sessionScope.totalCompra}"
								id="complemento" placeholder="" readonly>
						</div>
						<!-- fim da terceira linha-->
						<div class="col-sm-6">
							<input required name="frete" type="text" value="${sessionScope.frete}" id="frete"
								placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<!-- <% int i = 1;%> -->
							<!-- <c:forEach items="${sessionScope.listaProdutos}" var="produto"> -->
							<input required name="qnt<%=i%>" value="${produto.qntCarrinho}" readonly>
						</div>
						<div class="col-sm-6">
							<input required name="nome<%=i%>" value="${produto.nomeProduto}" readonly>
						</div>
						<div class="col-sm-6">
							<input required name="preco<%=i%>" value="${produto.precoProduto}" readonly>
							<!-- <%=i++%>
							</c:forEach> -->
						</div>
						<div class="col-sm-6">
							<input required name="qntProduto" value="<%=i%>" readonly>
						</div>
						<div class="col-sm-6">
							<input required name="formaPagamento" type="text" id="formaPagamento" placeholder=""
								readonly>
						</div>
						<div class="col-sm-6">
							<input name="numeroCartaoCompra" type="text" id="numeroCartao" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<input name="nomeCartaoCompra" type="text" id="nomeCartao" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<input name="validadeCompra" type="number" id="validade" placeholder="" readonly>
						</div>
						<div class="col-sm-6">
							<input name="cvvCompra" type="number" id="cvv" placeholder="" readonly>
						</div>
					</div>
					<input type="submit" value="Confirmar Pedido">
				</form>
			</div>
		</div>
	</div>
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
        <script>
		jQuery(function () {
			$("#popup-pagamento .fechar").on("click", function () {
				$("#popup-pagamento").fadeOut(250);
			});
		});
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

		$(".div-endereco-entrega").click(function () {
			$('#entrega01').prop("checked", true)
			$(".div-endereco-entrega").addClass('active');
			$(".div-endereco-entrega2").removeClass('active');
			if ($('#entrega01').prop("checked") == true) {
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
		$(".div-endereco-entrega2").click(function () {
			$('#entrega02').prop("checked", true);
			$(".div-endereco-entrega2").addClass('active');
			$(".div-endereco-entrega").removeClass('active');
			if ($('#entrega02').prop("checked") == true) {
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

		$(".aparecer-popup").click(function () {
			$("#popup-pagamento").show();
		});
	</script>

    </body>

</html>