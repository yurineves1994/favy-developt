<%-- 
    Document   : tela-listar-pedido
    Created on : 13/05/2021, 21:29:31
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
    <body style="background-color: #e7e7e7;">
        <h1>DADOS COMPRA</h1>
        <br>
        <h2>PRODUTOS PEDIDO</h2>
        <br>
        <span>CODIGO DE RASTREIO ${sessionScope.email_cli.codCliente * 987654698908203832}</span>
        <br>
        <h2>codigo cliente: ${sessionScope.email_cli.codCliente}</h2>
        <br>
        
        <section>
            <% int i = 1;%> 
            <c:forEach items="${listarPedido}" var="pedido">
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
                        <span class="info">2020/05/20</span>
                        <br>
                        <br>
                        <span class="info">R$${pedido.valorFinal}</span>
                    </div>
                </div>
                <div style="display: none;"> 
                    <p id="status<%=i%>" >${pedido.statusPedido}</p> 
                    <%=i++%>
                </div>
            </c:forEach>

            <div style="display: none;"> 
                <p id="contador" ><%=i%></p> 
            </div>

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

            for(var i=1; i < cont; i++){
                let txtStatus = document.getElementById('textPedido'+i);
                let status = document.getElementById('status'+i).innerText;

                let imgColor = document.getElementById('imgColor'+i);
                let circleColor = document.getElementById('circleColor'+i);

                console.log(status);

                if(status == "a"){
                    txtStatus.innerHTML = "Aguardando pagamento";

                    txtStatus.style.color= LARANJA;
                    imgColor.style.color= LARANJA;
                    circleColor.style.border= "solid 2px "+LARANJA;
                
                } else if(status == "p"){
                    txtStatus.innerHTML = "Pagamento Rejeitado";

                    txtStatus.style.color= VERMELHO;
                    imgColor.style.color= VERMELHO;
                    circleColor.style.border= "solid 2px "+VERMELHO;

                } else if(status == "s"){
                    txtStatus.innerHTML = "Pagamento com sucesso";

                    txtStatus.style.color= VERDE;
                    imgColor.style.color= VERDE;
                    circleColor.style.border= "solid 2px "+VERDE;
                
                } else if(status == "r"){
                    txtStatus.innerHTML = "Aguardando retirada";

                    txtStatus.style.color= VERMELHO;
                    imgColor.style.color= VERMELHO;
                    circleColor.style.border= "solid 2px "+VERMELHO;
                
                } else if(status == "t"){
                    txtStatus.innerHTML = "Em transito";

                    txtStatus.style.color= LARANJA;
                    imgColor.style.color= LARANJA;
                    circleColor.style.border= "solid 2px "+LARANJA;
                
                } else if(status == "e"){
                    txtStatus.innerHTML = "Entregue";

                    txtStatus.style.color= VERDE;
                    imgColor.style.color= VERDE;
                    circleColor.style.border= "solid 2px "+VERDE;
                
                }
            }
            
            /*
            for( var i=0; i < status.length; i++){
                status[i].style.color = "red";
            }*/
        </script>
    </body>
</html>
