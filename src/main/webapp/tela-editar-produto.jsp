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
        <style>
            #cod_produto {
                display:none;
            }
            
            #lupinha {
                padding-left: 2px;
                 width: 31px;
            }          
        </style>
    </head>
    <body>
        <section>
            <div class="container mt-5">
                <form action="EditarProduto" method="POST">
                    <h1>Alterar Produto - COD: ${produto.codProduto} / Nome: ${produto.nomeProduto}</h1>   
                    <div class="form-group"> 
                        <label for="nome_produto">Nome:</label>
                        <input required class="form-control" type="text" value="${produto.nomeProduto}" name="nome_produto">
                        <input type="text" value="${produto.codProduto}" id="cod_produto" name="cod_produto">
                    </div>
                    <div class="form-group"> 
                        <label for="descricao">Descrição:</label>
                        <input required class="form-control" name="descricao" value="${produto.descricao}"></input>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-3"> 
                            <label for="qtd_estrela">Quantidada Estrela:</label>
                            <input required class="form-control" type="number" value="${produto.qtdEstrela}" name="qtd_estrela">
                        </div>
                        <div class="form-group col-sm-3"> 
                            <label for="qtd_produto">Quantidada:</label>
                            <input required class="form-control" type="number" value="${produto.qtdProduto}" name="qtd_produto">
                        </div>
                        <div class="form-group col-sm-3"> 
                            <label for="status_produto">Status</label>
                            <select required class="form-control" name="status_produto" value="${produto.statusProduto}">
                                <option value="a">Ativo</option>
                                <option value="i">Inativo</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-3"> 
                            <label for="preco_produto">Preço:</label>
                            <input required class="form-control" type="number" value="${produto.precoProduto}" name="preco_produto">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="form-group col-sm-6">                            
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" />
                            <input type="file" id="lupinha" name="imagem_produto_1" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group col-sm-6">
                            
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" />
                            <input type="file" id="lupinha" name="imagem_produto_2" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group col-sm-6">
                            
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" />
                            <input type="file" id="lupinha" name="imagem_produto_3" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group col-sm-6">                          
                            <img width="400" height="300" src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" />
                            <input type="file" id="lupinha" name="imagem_produto_4" class="fa fa-search fa-2x">
                        </div>
                    </div>                 
                    <div>
                        <a class="btn btn-dark" href="ListarProdutos">Cancelar</a>
                        <button type="submit" class="btn btg-lg btn-dark">Enviar</button>
                    </div>
                </form>

            </div>
        </section>

    </body>

</html>