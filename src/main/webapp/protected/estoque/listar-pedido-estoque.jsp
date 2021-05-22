<%-- 
    Document   : listar-pedido-estoque
    Created on : 22/05/2021, 12:39:33
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">    
        <style>
            *{
                margin: 0;
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
                margin-left: 17px;
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
        </style>

    </head>
    <body>

        <section>
            <% int i = 1;%> 
            <c:forEach items="${listaPedidoEstoque}" var="pedido">
                <a href="ProdutosPedido?codPedido=${pedido.codPedido}">
                    <div class="cxa_dadosDaCompra">
                        <div class="cicloImg" id="circleColor<%=i%>">
                            <span id="imgColor<%=i%>" class="material-icons centerImg" style="font-size: 2rem; color: #F79E2A; cursor: pointer;">
                                shopping_cart
                            </span>
                        </div>

                        <div class="cxa_codAndStatus">
                            <span class="titulo" id="textPedido<%=i%>">...</span>
                            <br>
                            <br>
                            <span class="info">Codigo da compra: 00${pedido.codPedido}</span>
                        </div>

                        <div class="cxa_dataAndTotal">
                            <div style="display: none;">
                                <span class="info" id="data<%=i%>">${pedido.dataPedido}</span>
                            </div>
                            <span class="info" id="ajustaData<%=i%>">...</span>
                            <br>
                            <br>
                            <span class="info">R$${pedido.valorFinal}</span>
                        </div>
                    </div>
                    <div style="display: none;"> 
                        <p id="status<%=i%>" >${pedido.statusPedido}</p>
                    </div>
                </a>

                <!-- Status -->
                <form action="<c:url value="/StatusPedido?codPedido=${pedido.codPedido}"/>" method="POST" >
                    <select name="status<%=i%>" id="status<%=i%>" value="${pedido.statusPedido}" title="Status">
                        <option value="a"> Aguardando Pagamento </option>
                        <option value="p"> Pagamento Rejeitado </option>
                        <option value="s"> Pagamento com Sucesso </option>
                        <option value="r"> Aguardando Retirada </option>
                        <option value="t"> Em Trânsito </option>
                        <option value="e"> Entregue </option>
                    </select>
                    <input type="submit" value="Confirmar Status">
                        <%=i++%>
                </form>
            </c:forEach>

            <div style="display: none;"> 
                <p id="contador" ><%=i%></p> 
            </div>

        </section>

        <%
            int quantidadePagina = Integer.parseInt(request.getParameter("quantidadePagina"));
            int numeroPagina = Integer.parseInt(request.getParameter("numeroPagina"));
        %>
        <nav>
            <ul class="pagination justify-content-start">
                <%
                    if (numeroPagina <= quantidadePagina && (numeroPagina - 1) > 0) {
                        out.println("<li class='page-item'><a class='page-link' href=ListarPedidos?numeroPagina=" + (numeroPagina - 1) + ">Anterior</a></li>");
                    }
                    out.println("<li class='page-item'><a class='page-link' href=ListarPedidos?numeroPagina=" + numeroPagina + ">" + numeroPagina + "</a></li>");

                    if (quantidadePagina > numeroPagina) {
                        out.println("<li class='page-item'><a class='page-link' href=ListarPedidos?numeroPagina=" + (numeroPagina + 1) + ">Proximo</a></li>");
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

            var VERMELHO = "#F74A16";
            var LARANJA = "#ff9942";
            var VERDE = "#6DF789";

            var cont = Number(document.getElementById('contador').innerText);

            for (var i = 1; i < cont; i++) {
                let txtStatus = document.getElementById('textPedido' + i);
                let status = document.getElementById('status' + i).innerText;

                let imgColor = document.getElementById('imgColor' + i);
                let circleColor = document.getElementById('circleColor' + i);

                let data = document.getElementById('data' + i).innerText;
                let ajustaData = document.getElementById('ajustaData' + i);
                let dma = data.split('-');
                console.log(dma);
                ajustaData.innerHTML = dma[2] + "/" + dma[1] + "/" + dma[0];

                if (status == "a") {
                    txtStatus.innerHTML = "Aguardando pagamento";

                    txtStatus.style.color = LARANJA;
                    imgColor.style.color = LARANJA;
                    circleColor.style.border = "solid 2px " + LARANJA;

                } else if (status == "p") {
                    txtStatus.innerHTML = "Pagamento Rejeitado";

                    txtStatus.style.color = VERMELHO;
                    imgColor.style.color = VERMELHO;
                    circleColor.style.border = "solid 2px " + VERMELHO;

                } else if (status == "s") {
                    txtStatus.innerHTML = "Pagamento com sucesso";

                    txtStatus.style.color = VERDE;
                    imgColor.style.color = VERDE;
                    circleColor.style.border = "solid 2px " + VERDE;

                } else if (status == "r") {
                    txtStatus.innerHTML = "Aguardando retirada";

                    txtStatus.style.color = VERMELHO;
                    imgColor.style.color = VERMELHO;
                    circleColor.style.border = "solid 2px " + VERMELHO;

                } else if (status == "t") {
                    txtStatus.innerHTML = "Em transito";

                    txtStatus.style.color = LARANJA;
                    imgColor.style.color = LARANJA;
                    circleColor.style.border = "solid 2px " + LARANJA;

                } else if (status == "e") {
                    txtStatus.innerHTML = "Entregue";

                    txtStatus.style.color = VERDE;
                    imgColor.style.color = VERDE;
                    circleColor.style.border = "solid 2px " + VERDE;

                }
            }

            /*
             for( var i=0; i < status.length; i++){
             status[i].style.color = "red";
             }*/
        </script>
    </body>
</html>
