<%-- 
    Document   : pedidosCompra
    Created on : 18/05/2021, 19:13:36
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../header-loja.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <style>
            *{
                margin: 0;
                font-family: 'Roboto', sans-serif;
            }
            ::-webkit-scrollbar{
                width: 6px;
            }
            ::-webkit-scrollbar-thumb{
                -webkit-box-shadow: inset 0 0 20px #ee6a6a;
            }

            .cxa_tabela{
                width: auto;
                margin: 50px;
                
                border: 1px solid black;

                font-weight: 600;
                background-color: #fff8f8db;
                height: auto;
                
            }
            .cxa_itens{
                overflow-x: auto;
                height: 300px;
            }
    
            table{
                width: 100%;
                text-transform: uppercase;
                
            }
            .tituloTabela{
                color: white;
                background-color: #ee6a6a;
                border-bottom: 1px solid black;
                border-top: 1px solid black;
            }
            .itens{
                border-bottom: 1px solid black !important;
            }

            th{
               padding: 20px;
               width: 158px;

               text-align: center;
            }
            td{
                padding: 20px;
                width: 158px;

                text-align: center;
            }

            tr:hover{
                background-color: #ee6a6a75;
            }

            .cabecalho{
                background-color: #ee6a6a;
            }

            button{
                background: #ee6a6a;
                color: white;
                height: 40px;
                width: 100px;
            
                margin-left: 50px;
                border-radius: 5px;
            }
            
        </style>
    
</head>
<body background="img/parisFUNDO.jpg">
    
    <div class="cxa_tabela" style="margin-top: 110px;">
            <table class="tituloTabela">

                <thead>
                    <tr>
                        <!--
                        <th>Codigo Pedido</th>
                        <th>Codigo Item</th>
                        -->
                        <th>Nome Item</th>
                        <th>Quantidade Comprada</th>
                        <th>Valor Unitario</th>
                        <th>Valor Total</th>
                    </tr>
                </thead>

            </table>
            <div class="cxa_itens">
                <table>

                    <% int i = 1;%> 
                    <tbody>
                        <c:forEach items="${listarProdutosPedido}" var="produtos">
                                <tr>
                                    <!--
                                    <td>${produtos.codPedido}</td>
                                    <td>${produtos.codItem}</td>
                                    -->
                                    <td>${produtos.nomeItem}</td>
                                    <td>${produtos.qtdItem}</td>
                                    <td>R$ ${produtos.precoUnitario}</td>    
                                    <td>R$${produtos.precoTotal}</td>
                                <tr>

                                <div style="display: none;">
                                    <span id="valorSomar<%=i%>"> ${produtos.precoTotal} </span>
                                    <span><%=i++%></span>
                                </div>
                        </c:forEach>

                        <span style="display: none;" id="contador"><%=i%></span>

                    </tbody>
                </table>
            </div>

            <table class="tituloTabela">
                <thead>                    
                        <tr>
                            <!--
                            <th>Codigo Pedido</th>
                            <th>Codigo Item</th>
                            -->
                            <th>Frete: R$ ${listarProdutosPedido[0].freteTotal}</th>
                            <th>Valor Total: R$<span id="total">...</span></th>
                        </tr>
                </thead>
            </table>
        </div>

        <a class="Pedidos" href="<c:url value="/PedidosServlet?codCliente=${sessionScope.email_cli.codCliente}"/>"><button>VOLTAR</button></a>
        
        <script>
            var tamanho = document.getElementById('contador').innerHTML;
            var valores = 1;
            var soma = 0;
            for(var i=1; i < tamanho; i++){
                valores = Number( document.getElementById('valorSomar'+i).innerHTML );
                soma += valores;
            }

            document.getElementById('total').innerText = soma;
        </script>
</body>
</html>
