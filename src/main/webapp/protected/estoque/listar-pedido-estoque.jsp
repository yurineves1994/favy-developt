<%-- 
    Document   : listar-pedido-estoque
    Created on : 22/05/2021, 12:39:33
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header-usuario-estoque.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body {
                background-color: rgb(241, 240, 240);
                margin: 0;
            }

            .container {
                max-width: 1920px;
                width: 100%;
            }
            .buscar-registro {
                display: flex;
                justify-content:flex-start;
                margin-top: 10px;
            }
            input {
                background-color: #fff;
                width: 30%;
                border-radius: 10px;
                border-color: transparent;
                padding: 5px;
                font-size: 18px;

            }
            button{
                background-color: #152b4b;
                text-transform: uppercase;
                color: #fff;
                cursor: pointer;
                transition: .5s;
                border-radius: 0 10px;
            }

            .tabela-produtos{
                border-collapse: initial;
                position: relative;
                margin-left: auto;
                margin-right: auto;
                width: 90%;
                margin-top: 3em;
                border-radius: 5px 5px 0 0;

            }
            thead {
                background: #152b4b;
                color: white;
            }
            tr,td,th {
                padding: 10px;
                text-align: center;
            }

            .iconTabela {
                width: 50px;
                height: 40px;
            }
            
        </style>

    </head>
    <body>

        <section>
            <table class="tabela-produtos">
                <thead>
                    <tr>
                        <th>Id Pedido</th>
                        <th>Email User</th>
                        <th>Forma de Pagamento</th>
                        <th>data do Pedido</th>
                        <th>valor Final</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>
                    <% int x = 1;%> 
                    <c:forEach items="${listaPedidoEstoque}" var="pedido">
                        <tr>
                            <td>${pedido.codPedido}</td>
                            <td>${pedido.emailUser}</td>
                            <c:choose>
                                <c:when test="${pedido.formaPagamento == 'b'}">
                                    <td><p>Boleto</p></td>
                                </c:when>
                                <c:otherwise>
                                    <td><p>Cartão de Crédito</p></td>
                                </c:otherwise>
                            </c:choose> 
                            <td>${pedido.dataPedido}</td>
                            <td>${pedido.valorFinal}</td>
                            <td> 
                                <span id="status<%=x%>" style="display: none;">${pedido.statusPedido}</span>

                                <span id="textPedido<%=x%>">...</span>
                                <form action="<c:url value="/StatusPedido?codPedido=${pedido.codPedido}"/>" method="POST" >
                                    <select name="status${pedido.codPedido}" id="status<%=x%>" value="${pedido.statusPedido}" title="Status">
                                        <option value="a"> Status </option>
                                        <option value="a"> Aguardando Pagamento </option>
                                        <option value="p"> Pagamento Rejeitado </option>
                                        <option value="s"> Pagamento com Sucesso </option>
                                        <option value="r"> Aguardando Retirada </option>
                                        <option value="t"> Em Trânsito </option>
                                        <option value="e"> Entregue </option>
                                    </select>
                                    <input type="submit" value="Confirmar">
                                </form>
                                <!--
                                    <%=x++%>
                                -->
                            </td>
                        </tr>
                    </c:forEach>
                    <span id="contador" style="display: none;"><%=x%></span>
                </tbody>
            </table>


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

            var VERMELHO = "#000000";
            var LARANJA = "#000000";
            var VERDE = "#000000";

            var cont = Number(document.getElementById('contador').innerText);

            console.log( cont );

            for (var i = 1; i < cont; i++) {
                let txtStatus = document.getElementById('textPedido' + i);
                let status = document.getElementById('status' + i).innerText;


                /*let data = document.getElementById('data' + i).innerText;
                let ajustaData = document.getElementById('ajustaData' + i);
                let dma = data.split('-');
                console.log(dma);
                ajustaData.innerHTML = dma[2] + "/" + dma[1] + "/" + dma[0];*/

                console.log( txtStatus );
                console.log( status );

                if (status == "a") {
                    txtStatus.innerHTML = "Aguardando pagamento";

                    txtStatus.style.color = LARANJA;


                } else if (status == "p") {
                    txtStatus.innerHTML = "Pagamento Rejeitado";

                    txtStatus.style.color = VERMELHO;


                } else if (status == "s") {
                    txtStatus.innerHTML = "Pagamento com sucesso";

                    txtStatus.style.color = VERDE;


                } else if (status == "r") {
                    txtStatus.innerHTML = "Aguardando retirada";

                    txtStatus.style.color = VERMELHO;


                } else if (status == "t") {
                    txtStatus.innerHTML = "Em transito";

                    txtStatus.style.color = LARANJA;


                } else if (status == "e") {
                    txtStatus.innerHTML = "Entregue";

                    txtStatus.style.color = VERDE;


                }
            }

            /*
             for( var i=0; i < status.length; i++){
             status[i].style.color = "red";
             }*/
        </script>
    </body>
</html>
