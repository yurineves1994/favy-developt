<%-- 
    Document   : tela01
    Created on : 27/02/2021, 17:18:52
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <script>
            var img = document.querySelector(".link_produto")
            img.setAttribute('src','icones/icon-produto-ativo.png')
        </script>
        
        <section>
            <div class="container mt-4">
                <form action="EditarProduto" method="POST">
                    <!-- Nome produto -->
                    <div class="form-group">
                        <input value="${produto.nomeProduto}" name="nome_produto" type="text" class="form-control" id="exampleFormControlInput1" placeholder=" Nome do Produto ">
                        <input type="text" value="${produto.codProduto}" id="cod_produto" name="cod_produto" style="display: none;">
                    </div>
                    <!-- Descrição -->
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descrição </label>
                        <textarea value="${produto.descricao}" name="descricao" class="form-control" id="exampleFormControlTextarea1" rows="3">${produto.descricao}</textarea>
                    </div>
                    <!-- Quantidade Estrela -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Qtd Estrelas </label>
                        <select value="${produto.qtdEstrela}" name="qtd_estrela" class="form-control" id="exampleFormControlSelect1">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                        </select>
                    </div>
                    <!-- Quantidade -->
                    <div class="form-group">
                        <input value="${produto.qtdProduto}" name="qtd_produto" type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Qtd Estoque ">
                    </div>
                    <!-- Status -->
                    <div class="form-group">
                        <select value="${produto.statusProduto}" name="status_produto" class="form-control" id="exampleFormControlSelect1">
                          <option value="d">Ativo</option>
                          <option value="i">Inativo</option>
                        </select>
                    </div>
                    <!-- Preço -->
                    <div class="form-group">
                        <input value="${produto.precoProduto}" name="preco_produto" type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Preço (MAX - 99 / Double)">
                    </div>

                    <div class="campo-right">
                        <input type="submit" value="Enviar" class="btn btn-success">
                        <input type="reset" value="Cancelar" class="btn btn-secondary">
                    </div>
                </form>

            </div>
        </section>
    </body>
</html>