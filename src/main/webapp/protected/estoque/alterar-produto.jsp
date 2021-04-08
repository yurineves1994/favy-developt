<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" enctype="multipart/form-data">
        <title>JSP Page</title> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="estilos/estiloCadastroProduto.css">
        <style>
            #lupinha {
                padding-left: 2px;
                width: 31px;
            }
            .grupo-imagem {
                display: flex;
                justify-content: space-around;
            }
        </style>
    </head>
    <body>
        <script src="scripts/scriptCadastrarProduto.js"></script>
        <section>
            <div class="container mt-4">
                <!-- enctype="multipart/form-data" -->
                <form action="<c:url value="/EditarProduto"/>" method="POST" enctype="multipart/form-data">
                    <!-- Nome produto -->
                    <div class="form-group">
                        <input type="text" value="${produto.codProduto}" id="cod_produto" name="cod_produto" style="visibility:hidden">
                        <input required name="nome_produto" type="text" class="form-control" id="exampleFormControlInput1" value="${produto.codProduto}" placeholder=" Nome do Produto ">
                    </div>
                    <!-- Descrição -->
                    <div class="form-group">
                        <label for="descricao">Descrição:</label>
                        <label for="exampleFormControlTextarea1"> Descrição </label>
                        <textarea name="descricao" class="form-control" id="exampleFormControlTextarea1" rows="3">${produto.descricao}</textarea>
                    </div>
                    <!-- Quantidade Estrela -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Qtd Estrelas </label>
                        <select name="qtd_estrela" class="form-control" id="exampleFormControlSelect1" value="${produto.qtdEstrela}">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                        </select>
                    </div>
                    <!-- Quantidade -->
                    <div class="form-group">
                        <label for="qtd_produto">Quantidade:</label>
                        <input required name="qtd_produto" type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Qtd Estoque " value="${produto.qtdProduto}">
                    </div>
                    <!-- Status -->
                    <div class="form-group">
                        <label for="status_produto">Status</label>
                        <select name="status_produto" class="form-control" id="exampleFormControlSelect1" value="${produto.statusProduto}">
                          <option value="a">Ativo</option>
                          <option value="i">Inativo</option>
                        </select>
                    </div>
                    <!-- Preço -->
                    <div class="form-group">
                        <label for="preco_produto">Preço:</label>
                        <input required name="preco_produto" type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Preço (MAX - 99 / Double)" value="${produto.precoProduto}">
                    </div>
                      
                    <div class="grupo-imagem">
                        <div class="form-group">
                            <label for="imagem_produto_1">Caminho Imagem 01:</label>
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" />
                            <input type="file" name="imagem_produto_1" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group">
                            <label for="imagem_produto_2">Caminho Imagem 02:</label>
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" />
                            <input  type="file" name="imagem_produto_2" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group">
                            <label for="imagem_produto_3">Caminho Imagem 03:</label>
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" />
                            <input  type="file" name="imagem_produto_3" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group">
                            <label for="imagem_produto_4">Caminho Imagem 04:</label>
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" />
                            <input  type="file" name="imagem_produto_4" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                    </div>
                    
                    <div class="campo-right">
                        <input type="submit" value="Enviar" class="btn btn-success">
                        <input type="reset" value="Cancelar" class="btn btn-secondary">
                    </div>
                    
                </form>

            </div>

        </section>
        <script>
            var teste = document.querySelector("input#lupinha").value;
            console.log(teste);
        </script>
    </body>

</html>