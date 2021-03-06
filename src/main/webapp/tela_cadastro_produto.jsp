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
                <form action="CadastrarProduto" method="POST">
                    <!-- Nome produto -->
                    <div class="form-group">
                        <input name="nome_produto" type="text" class="form-control" id="exampleFormControlInput1" placeholder=" Nome do Produto ">
                    </div>
                    <!-- Descrição -->
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descrição </label>
                        <textarea name="descricao" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
                    <!-- Quantidade Estrela -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Qtd Estrelas </label>
                        <select name="qtd_estrela" class="form-control" id="exampleFormControlSelect1">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                        </select>
                    </div>
                    <!-- Quantidade -->
                    <div class="form-group">
                        <input name="qtd_produto" type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Qtd Estoque ">
                    </div>
                    <!-- Status -->
                    <div class="form-group">
                        <select name="status_produto" class="form-control" id="exampleFormControlSelect1">
                          <option value="d">Ativo</option>
                          <option value="i">Inativo</option>
                        </select>
                    </div>
                    <!-- Preço -->
                    <div class="form-group">
                        <input name="preco_produto" type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Preço (MAX - 99 / Double)">
                    </div>

                    <a href="cadastro_imagem.jsp">
                        assdasdasdasd
                    </a>
                    
                    <div class="campo-right">
                        <input type="submit" value="Enviar" class="btn btn-success">
                        <input type="reset" value="Cancelar" class="btn btn-secondary">
                    </div>
                    
                </form>

            </div>
        </section>


        <!--
        <section>
            <div class="container">
                <form action="CadastrarProduto" method="POST">
                    <fieldset>
                        <legend>Cadastrar Produto</legend>
                        <div class="campo-left">
                            <label for="nome_produto">Nome:</label>
                            <input type="text" name="nome_produto">
                        </div>
                        <div class="campo-left">
                            <label for="descricao">Descrição:</label>
                            <textarea name="descricao" cols="45" rows="3"></textarea>
                        </div>
                        <div class="campo-left">
                            <label for="qtd_estrela">Quantidada Estrela:</label>
                            <input type="number"  name="qtd_estrela">
                        </div>
                        <div class="campo-left">
                            <label for="qtd_produto">Quantidada:</label>
                            <input type="number" name="qtd_produto">
                        </div>
                        <div class="campo-left">
                            <label for="status_produto">Status</label>
                            <select name="status_produto" >
                                <option value="d">Ativo</option>
                                <option value="i">Inativo</optin>o
                            </select>
                        </div>
                        <div class="campo-left">
                            <label for="preco_produto">Preço:</label>
                            <input type="number" name="preco_produto">
                        </div>




                   <div class="campo-center">
                            <label for="url-imagem">Caminho Imagem:</label>
                            <input type="text" id="url-imagem" name="lupinha">
                            <input type="file" id="lupinha" name="lupinha" class="fa fa-search fa-1x">
                        </div>
                        <div class="campo-center">
                            <input type="checkbox" id="check-image" name="check-image">
                            <label for="url-imagem">Imagem da Pagina Principal</label>
                        </div>
                        <fieldset>
                            <legend>Adicionar/Remover Imagem</legend>
                            <div class="campo-center">
                                <div class="grupo-imagem">
                                    <div class="imagem"></div>
                                    <div class="imagem"></div>
                                    <div class="imagem"></div>
                                    <div class="imagem"></div>
                                    <button>Remover Selecionado</button>
                                </div>
                            </div>
                        </fieldset>
                    </fieldset>
                    <div class="campo-right">
                        <input type="reset" value="Cancelar">
                        <input type="submit" value="Enviar">
                    </div>
                </form>

            </div>
        </section>
        -->

    </body>
</html>