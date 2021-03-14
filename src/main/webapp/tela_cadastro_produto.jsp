<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" enctype="multipart/form-data">
        <title>JSP Page</title> 
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
        <section>
            <div class="container mt-5">
                <form action="CadastrarProduto" method="POST">
                    <legend>Cadastrar Produto</legend>
                    <div class="form-group"> 
                        <label for="nome_produto">Nome:</label>
                        <input minlength="3" required="" class="form-control" type="text" name="nome_produto">
                    </div>
                    <div class="form-group">
                        <label for="descricao">Descrição:</label>
                        <textarea required="" class="form-control" name="descricao" cols="45" rows="3"></textarea>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-3">
                            <label for="qtd_estrela">Quantidada Estrela:</label>
                            <input required class="form-control" type="number"  name="qtd_estrela">
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="qtd_produto">Quantidada:</label>
                            <input required class="form-control" type="number" name="qtd_produto">
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="status_produto">Status</label>
                            <select required="required" class="form-control" name="status_produto" >
                                <option value="a">Ativo</option>
                                <option value="i">Inativo</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="preco_produto">Preço:</label>
                            <input required class="form-control" type="number" name="preco_produto">
                        </div>
                    </div>
                    <div class="grupo-imagem">
                        <div class="form-group">
                            <label for="imagem_produto_1">Caminho Imagem 01:</label>
                            <input type="file" name="imagem_produto_1" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group">
                            <label for="imagem_produto_2">Caminho Imagem 02:</label>
                            <input  type="file" name="imagem_produto_2" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group">
                            <label for="imagem_produto_3">Caminho Imagem 03:</label>
                            <input  type="file" name="imagem_produto_3" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                        <div class="form-group">
                            <label for="imagem_produto_4">Caminho Imagem 04:</label>
                            <input  type="file" name="imagem_produto_4" id="lupinha" class="fa fa-search fa-2x">
                        </div>
                    </div>
                    <div>
                        <a class="btn btn-dark" href="ListarProdutos">Cancelar</a>
                        <button type="submit" class="btn btn-dark">Enviar</button>
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