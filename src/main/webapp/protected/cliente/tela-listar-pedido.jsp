<%-- 
    Document   : tela-listar-pedido
    Created on : 13/05/2021, 21:29:31
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header-loja.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <style>
            *{
                margin: 0;
            }

            ::-webkit-scrollbar{
                width: 10px;
            }
            ::-webkit-scrollbar-thumb{
                -webkit-box-shadow: inset 0 0 20px #ee6a6a;
            }

            /* Centralizando o container das divs */
            section{
                width: 80%;
                height: auto;
                margin: auto;
            }

            /* Container pedido */
            .cxa_dadosDaCompra{
                width: 91%;
                padding: 20px 32px;
                background-color: white;
                color: black;
                cursor: pointer;
                margin-top: 15px;
                box-shadow: -1px 2px 5px 0px #0000005c;
                border-radius: 5px;

                display: inline-flex;
                flex-wrap: nowrap;
                flex-direction: row;
                justify-content: flex-start;
                align-items: stretch;

                transition-duration: 0.5s;
            }
            .cxa_dadosDaCompra:hover{
                box-shadow: -11px 10px 5px 0px #0000005c;
                transform: translateX(1%);
            }
            /* dados pedido */
            .cicloImg{
                background-color: #e7e7e7;
                width: 66px;
                height: 60px;
                border-radius: 100%;
                text-align: center;
                border: solid 2px #ff9942;

                transition-duration: 0.5s;
            }
            
            .cxa_dadosDaCompra:hover > .cicloImg{
                box-shadow: inset -7px 8px 5px #00000070;
            }
            
            .centerImg{
                padding-top: 14px;
            }

            .cxa_codAndStatus{
                width: 70%;
                height: 60px;
                float: left;
            }
            .cxa_dataAndTotal{
                width: 30%;
                height: 60px;
                float: right;
                text-align: end;
            }

            .titulo{
                font-family: Verdana;
                font-weight: bolder;
                color: #ff9942;
                
                
            }
            .info{
                font-family: Verdana;
            }
            .cabecalho{
                background-color: #ee6a6a;
            }
           
            .linhaEF{
                margin-top: 0;
                margin-bottom: 0;

                width: 80px;
                position:absolute;
            }

        </style>

    </head>
    <body  background="img/parisFUNDO.jpg">

        
        <section style="margin-top: 110px;">
            <% int i = 1;%> 
            <c:forEach items="${listarPedido}" var="pedido">
                <a href="ProdutosPedido?codPedido=${pedido.codPedido}">
                    <div class="cxa_dadosDaCompra">
                        <div class="cicloImg" id="circleColor<%=i%>">
                            <span id="imgColor<%=i%>" class="material-icons centerImg" style="font-size: 2rem; color: #F79E2A; cursor: pointer;">
                                shopping_cart
                            </span>
                        </div>

                        <div class="cxa_codAndStatus">
                            <span class="titulo" id="textPedido<%=i%>" style="margin-left: 16px;">...</span>
                            <hr NOSHADE class="linhaEF" id="linhaText<%=i%>">
                            <br>
                            <br>
                            
                            <span class="info" style="margin-left: 16px;">Codigo da compra: 00${pedido.codPedido} -
                                <c:choose>
                                    <c:when test="${pedido.formaPagamento == 'b'}"> Boleto  </c:when>
                                    <c:otherwise>Cartão de Crédito **** **** **** ${pedido.numeroCartaoCompra}</c:otherwise>
                                </c:choose>
                            </span>
                        </div>

                        <div class="cxa_dataAndTotal">
                            <div style="display: none;">
                                <span class="info" id="data<%=i%>">${pedido.dataPedido}</span>
                            </div>
                            <span class="info" id="ajustaData<%=i%>">...</span>
                            <br>
                            <br>
                            <span class="info">R$${pedido.valorFinal + pedido.valorFrete}</span>
                        </div>
                    </div>
                    <div style="display: none;"> 
                        <p id="status<%=i%>" >${pedido.statusPedido}</p> 
                        <%=i++%>
                    </div>
                </a>              
            </c:forEach>

            <div style="display: none;"> 
                <p id="contador" ><%=i%></p> 
            </div>
            
            <br><br><br><br>
        </section>
        
        <c:forEach items="${listarPedido}" var="pedido">
            <div style="display: none;">
            <span>${pedido.codPedido}</span>
            <br>
            <span>${pedido.cepEndereco}</span>
            <br>
            <span>${pedido.ruaEndereco}</span>
            <br>
            <span>${pedido.bairroEndereco}</span>
            <br>
            <span>${pedido.cidadeEndereco}</span>
            <br>
            <span>${pedido.ufEndereco}</span>
            <br>
            <span>${pedido.numEndereco}</span>
            <br>
            <span>${pedido.complEndereco}</span>

            <br>
            <span>${pedido.formaPagamento}</span>
            <br>
            <span>${pedido.valorFinal}</span>
            <br>
            <span>${pedido.statusPedido}</span>
            <br><br><br><br>
            </div>
        </c:forEach>
            
            
        <%
            int quantidadePagina = Integer.parseInt(request.getParameter("quantidadePagina"));
            int numeroPagina = Integer.parseInt(request.getParameter("numeroPagina"));
            int codCliente = Integer.parseInt(request.getParameter("codCliente"));
        %>
        <nav>
            <ul class="pagination justify-content-start">
                <%
                    if (numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0) {
                        out.println("<li class='page-item'><a class='page-link' href=PedidosServlet?codCliente=" + codCliente + "&numeroPagina=" + (numeroPagina - 1) + ">Anterior</a></li>");
                    }
                    out.println("<li class='page-item'><a class='page-link' href=PedidosServlet?codCliente=" + codCliente + "&numeroPagina=" + numeroPagina + ">" + numeroPagina + "</a></li>");

                    if (quantidadePagina > numeroPagina) {
                        out.println("<li class='page-item'><a class='page-link' href=PedidosServlet?codCliente=" + codCliente + "&numeroPagina=" + (numeroPagina + 1) + ">Proximo</a></li>");
                    }
                %>
            </ul>
        </nav>

        <script>
            /*
                A - Aguardando pagamento    Laranja     test #ff9942
                P - Pagamento Rejeitado	    Vermelho    test #F74A16
                S - Pagamento com sucesso	Verde	    test #6DF789

                R - Aguardando retirada    	Vermelho
                T - Em transito		        Laranja
                E - Entregue		        Verde
            */

            var COMECO_V1 = "#F74A16";
            var MEIO_V1 = "#ffb100";
            var FIM_V1 = "#6DF789";

            var COMECO_V2 = "#F74A16";
            var MEIO_V2 = "#ffb100";

            var NEUTRO = "#5d5757";

            var cont = Number(document.getElementById('contador').innerText);

            for(var i=1; i < cont; i++){
                let txtStatus = document.getElementById('textPedido'+i);
                let status = document.getElementById('status'+i).innerText;

                let imgColor = document.getElementById('imgColor'+i);
                let circleColor = document.getElementById('circleColor'+i);

                let data = document.getElementById('data'+i).innerText;
                let ajustaData = document.getElementById('ajustaData'+i);
                let dma = data.split('-');
                console.log(dma);
                ajustaData.innerHTML = dma[2]+"/"+dma[1]+"/"+dma[0];

                let linha = document.getElementById('linhaText'+i);

                if(status == "a"){
                    txtStatus.innerHTML = "Aguardando pagamento";

                    linha.style.backgroundColor = MEIO_V1;
                    txtStatus.style.color= NEUTRO;
                    imgColor.style.color= NEUTRO;
                    circleColor.style.border= "solid 2px "+MEIO_V1;
                
                } else if(status == "p"){
                    txtStatus.innerHTML = "Pagamento Rejeitado";

                    linha.style.backgroundColor = COMECO_V1;
                    txtStatus.style.color= COMECO_V1;
                    imgColor.style.color= COMECO_V1;
                    circleColor.style.border= "solid 2px "+COMECO_V1;

                } else if(status == "s"){
                    txtStatus.innerHTML = "Pagamento com sucesso";

                    linha.style.backgroundColor = FIM_V1;
                    txtStatus.style.color= NEUTRO;
                    imgColor.style.color= NEUTRO;
                    circleColor.style.border= "solid 2px "+FIM_V1;
                
                } else if(status == "r"){
                    txtStatus.innerHTML = "Aguardando retirada";

                    linha.style.backgroundColor = FIM_V1;
                    circleColor.style.border= "solid 2px "+FIM_V1;

                    txtStatus.style.color= NEUTRO;
                    imgColor.style.color= COMECO_V2;
                
                } else if(status == "t"){
                    txtStatus.innerHTML = "Em transito";

                    linha.style.backgroundColor = FIM_V1;
                    circleColor.style.border= "solid 2px "+FIM_V1;

                    txtStatus.style.color= NEUTRO;
                    imgColor.style.color= MEIO_V2;
                
                } else if(status == "e"){
                    txtStatus.innerHTML = "Entregue";

                    linha.style.backgroundColor = FIM_V1;
                    circleColor.style.border= "solid 2px "+FIM_V1;

                    txtStatus.style.color= FIM_V1;
                    imgColor.style.color= FIM_V1;
                
                }
            }
            
            /*
            for( var i=0; i < status.length; i++){
                status[i].style.color = "red";
            }*/
        </script>
    </body>
</html>
