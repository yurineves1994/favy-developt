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
            .container {
                margin: 0 auto;
                width: 800px;
            }
            .campo-left {
                display: flex;
                justify-content: left;
                margin-bottom: 10px;
            }

            .campo-left label {
                margin-right: 10px;
            }

            .campo-left input {
                width: 350px;
            }

            .campo-center {
                display: flex;
                justify-content: center;
                margin-bottom: 10px;
            }
            .campo-center i{
                margin-left: 4px;
            }

            .campo-center input {
                width: 350px;
            }

            .campo-center label {
                margin-right: 10px;
            }

            .campo-center checkbox {
                margin-right: 10px;
            }

            .grupo-imagem {

                width: 100%;
                height: 200px;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            .imagem {
                width: 100px;
                border: 1px solid black;
                height: 100px;
            }

            .grupo-imagem button {
                border: 2px solid black;
                width: 180px;
                height: 20px;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            #check-image {
                width: 40px;
            }
            #lupinha {
                padding-left: 2px;
                width: 15px;
            }

            .campo-right {
                display: flex;
                justify-content: flex-end;
            }

            .campo-right input {
                margin: 10px;
                width: 100px;
            }

            .logo {
                width: 250px;
            }

            .login a {
                font-size: 18px;
                text-decoration: none;
                font-weight: bold;
            }

            .login a:hover {
                font-size: 19px;
                color: red;
            }

            #topo-site {
                display: flex;
                justify-content: space-around;
                align-items: center;
                margin: 20px 0px;
            }

            #busca {
                width: 500px;
                height: 30px;
                border: 1px solid blueviolet;
            }

            #menu-principal {
                background: wheat;
                display: flex;
                justify-content: space-around;
                align-items: center;
                list-style-type: none;
            }

            #menu-principal li {
                display: flex;
                align-items: center;
                justify-content: space-around;
                width: 100%;
                height: 50px;

            }

            #menu-principal li:hover {
                background: white;
            }

            #menu-principal a {
                text-decoration: none;
            }
            .grupo-imagens {
                display: flex;
                justify-content: space-between;
                flex-flow: wrap;
            }
        </style>
    </head>
    <body>
        <section>
            <div class="container">
                <form action="EditarProduto" method="POST">
                    <fieldset>
                        <legend>Alterar Produto: ${produto.codProduto}</legend>
                        <div class="campo-left">
                            <label for="nome_produto">Nome:</label>
                            <input type="text" value="${produto.nomeProduto}" name="nome_produto">
                            <input type="text" value="${produto.codProduto}" id="cod_produto" name="cod_produto">
                        </div>
                        <div class="campo-left">
                            <label for="descricao">Descrição:</label>
                            <textarea name="descricao" value="${produto.descricao}" cols="45" rows="3"></textarea>
                        </div>
                        <div class="campo-left">
                            <label for="qtd_estrela">Quantidada Estrela:</label>
                            <input type="number" value="${produto.qtdEstrela}" name="qtd_estrela">
                        </div>
                        <div class="campo-left">
                            <label for="qtd_produto">Quantidada:</label>
                            <input type="number" value="${produto.qtdProduto}" name="qtd_produto">
                        </div>
                        <div class="campo-left">
                            <label for="status_produto">Status</label>
                            <select name="status_produto" value="${produto.statusProduto}">
                                <option value="a">Ativo</option>
                                <option value="i">Inativo</option>
                            </select>
                        </div>
                        <div class="campo-left">
                            <label for="preco_produto">Preço:</label>
                            <input type="number" value="${produto.precoProduto}" name="preco_produto">
                        </div>
                        <div class="grupo-imagens">
                            <div class="campo-center">
                                <label for="imagem_produto_1">Caminho Imagem 01:</label>
                                <img style="width: 200px" src="data:image/png;base64, ${produto.imagemProduto1}" alt="Red dot" />
                                <input type="file" id="lupinha" name="imagem_produto_1" class="fa fa-search fa-1x">
                            </div>
                            <div class="campo-center">
                                <label for="imagem_produto_2">Caminho Imagem 02:</label>
                                <img style="width: 200px" src="data:image/png;base64, ${produto.imagemProduto2}" alt="Red dot" />
                                <input type="file" id="lupinha" name="imagem_produto_2" class="fa fa-search fa-1x">
                            </div>
                            <div class="campo-center">
                                <label for="imagem_produto_3">Caminho Imagem 03:</label>
                                <img style="width: 200px" src="data:image/png;base64, ${produto.imagemProduto3}" alt="Red dot" />
                                <input type="file" id="lupinha" name="imagem_produto_3" class="fa fa-search fa-1x">
                            </div>
                            <div class="campo-center">
                                <label for="imagem_produto_4">Caminho Imagem 04:</label>
                                <img style="width: 200px" src="data:image/png;base64, ${produto.imagemProduto4}" alt="Red dot" />
                                <input type="file" id="lupinha" name="imagem_produto_4" class="fa fa-search fa-1x">
                            </div>
                        </div>
                        <!--                        <div class="campo-center">
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
                                                </fieldset>-->
                    </fieldset>
                    <div class="campo-right">
                        <input type="reset" value="Cancelar">
                        <input type="submit" value="Enviar">
                    </div>
                </form>

            </div>
        </section>

    </body>

</html>