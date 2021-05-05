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

        <link rel="stylesheet" href="estilos/estiloCarrinhoVendas.css">
        <%@include file="header-loja.jsp"%>
    </head>

    <body style="background-color: rgb(255, 255, 255);">
        
        <section class="container" style="max-width: 1286px; margin-top: 150px;">
            <c:if test="${sessionScope.listaProdutos != null}">
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
                                          <img src="data:image/png;base64, ${produto.imagemProduto1}" class="imgProduto">
                                      </div>
                                      <div class="descricaoProduto">
                                          ${produto.descricao}
                                      </div>
                                  </div>
                              </td>
                              <!-- Quantidade -->
                              <td style="vertical-align: middle;">
                                  <div class="cxa_quantidade">
                                      <span class="material-icons" style="font-size: 1rem; color: black; cursor: pointer;">remove</span>
                                      <input type="number" class="quantidade" disabled="disabled" value="1" min="0" max="9999">
                                      <span class="material-icons" style="font-size: 1rem; color: black; cursor: pointer;">add</span>
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
                    
                </div>

                <!-- Container Resumo do pedido -->
                <div class="col-6 col-md-4" style="background-color: #f8f8f8;">
                    
                    <h3 class="resumoTitulo">resumo do pedido</h3>
                    <ul class="sumario-detalhes">
                        <c:forEach items="${sessionScope.listaProdutos}" var="produto">
                        <li class="detalhe">
                            <!-- Quantidade -->
                            <span>${produto.nomeProduto}</span>
                            <!-- Valor -->
                            <span>R$ ${produto.precoProduto}</span>
                        </li>
                        </c:forEach>
                    </ul>

                    <div class="caixaTotal">
                        <span class="txtTotal">total</span>
                        <span class="txtTotal">R$ ${sessionScope.totalCompra}</span>
                    </div>

                    <button class="btnComprar">
                        continuar
                    </button>
                </div>
            </div>
            </c:if>
            
            <h1> TEM NADA AQUI </h1>
        </section>
    </body>
    <!--
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
    -->
</html>
