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
            #cod_produto {
                display:none;
            }
            
        </style>
    </head>
    <body>
        <script src="scripts/scriptCadastrarProduto.js"></script>
        <section>
            <div class="container mt-5">
<<<<<<< HEAD:src/main/webapp/tela-editar-produto.jsp
                <form action="EditarProduto" method="POST">
=======
                <form action="<c:url value="/EditarProduto"/>" method="POST">
>>>>>>> vilela:src/main/webapp/protected/estoque/tela-editar-produto.jsp
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

                        <div class="form-group col-sm-3">
                            <c:if test="${produto.imagemProduto1 != null}">
                                <img width="200" height="200" src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" />
                            </c:if>
                            <input type="file" id="lupinha" name="imagem_produto_1" class="fa fa-search fa-2x">
                        </div>


                        <div class="form-group col-sm-3">
                            <c:if test="${produto.imagemProduto2 != null}">
                                <img width="200" height="200" src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" />
                            </c:if>
                            <input type="file" id="lupinha" name="imagem_produto_2" class="fa fa-search fa-2x">
                        </div>


                        <div class="form-group col-sm-3">  
                            <c:if test="${produto.imagemProduto3 != null}">
                                <img width="200" height="200" src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" />
                            </c:if>
                            <input type="file" id="lupinha" name="imagem_produto_3" class="fa fa-search fa-2x">
                        </div>


                        <div class="form-group col-sm-3">     
                            <c:if test="${produto.imagemProduto4 != null}">
                                <img width="200" height="200" src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" />
                            </c:if>
                            <input type="file" id="lupinha" name="imagem_produto_4" class="fa fa-search fa-2x">
                        </div>

                    </div>                 
                    <div class="row ">
                        <a class="btn btn-dark mr-2" href="ListarProdutos">Cancelar</a>
                        <button type="submit" class="btn btg-lg btn-dark">Enviar</button>
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
