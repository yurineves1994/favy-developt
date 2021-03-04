<%-- 
    Document   : tela03
    Created on : 27/02/2021, 17:30:01
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
        </style>
    </head>
    <body>
        <section>
            <div class="container">
                <form action="#">
                    <fieldset>
                        <legend>Cadastrar Produto</legend>
                        <div class="campo-left">
                            <label for="nome">Nome:</label>
                            <input type="text" id="nome" name="nome">
                        </div>
                        <div class="campo-left">
                            <label for="nome">Nome Extenso:</label>
                            <textarea name="nome_extenso" id="nome_extenso" cols="40" rows="3"></textarea>
                        </div>
                        <div class="campo-left">
                            <label for="qtdestrela">Quantidada Estrela:</label>
                            <input type="number" id="qtdestrela" name="qtdestrela">
                        </div>
                        <div class="campo-left">
                            <label for="status">Quantidada Estrela:</label>
                            <select name="status" id="status">
                                <option value="Disponivel">Disponivel</option>
                                <option value="Indisponivel">Indisponivel</option>
                            </select>
                        </div>
                        <div class="campo-left">
                            <label for="preco">Preço:</label>
                            <input type="number" id="preco" name="preco">
                        </div>
                        <div class="campo-center">
                            <label for="url-imagem">Caminho Imagem:</label>
                            <input type="url" id="url-imagem" name="url-imagem">
                            <input type="file" id="lupinha" name="lupinha" class="fa fa-search fa-1x">
                        </div>
                        <div class="campo-center">
                            <input type="checkbox" id="check-image" name="check-image">
                            <label for="url-imagem">Imagem da Pagina Principal</label>    
                    </fieldset>
                    <div class="campo-right">
                        <input type="reset" value="Cancelar">
                        <input type="submit" value="Inativar">
                    </div>
                </form>

            </div>
        </section>
    </body>

</html>