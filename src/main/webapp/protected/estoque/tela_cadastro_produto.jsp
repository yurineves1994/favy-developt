<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" enctype="multipart/form-data">
        <title>JSP Page</title> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../../estilos/formularios.css">
    </head>
    <body>
        <script src="scripts/scriptCadastrarProduto.js"></script>
        <section class="container">
        <!-- enctype="multipart/form-data" -->
        <form class="formulario cadastro_produto" action="<c:url value="/CadastrarProduto"/>" method="POST">
            <!-- Nome produto -->
            <input required name="nome_produto" type="text" placeholder=" Nome do Produto ">
            <!-- Descrição -->
            <input name="descricao" id="descricao" rows="3" placeholder="Descrição"></input>
            <!-- Quantidade Estrela -->
            <select name="qtd_estrela" id="qtd_estrela">
                <option>Estrelas</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
            <!-- Quantidade -->
            <input required name="qtd_produto" type="number" placeholder="Qtd Estoque" min="1" max="100">
            <!-- Status -->
            <select name="status_produto" id="status_produto">
                <option value="a">Ativo</option>
                <option value="i">Inativo</option>
            </select>
            <!-- Preço -->
            <input required name="preco_produto" type="number" placeholder="Preço (MAX - 99 / Double)" min="1">
            <!-- Grupo Imagem -->
            <div class="grupo-imagem">
                <!--  Imagem -->
                <label for="imagem_produto_1">Caminho Imagem 01:</label>
                <input type="file" name="imagem_produto_1" id="lupinha" class="fa fa-search fa-2x">
                <!--  Imagem -->
                <label for="imagem_produto_2">Caminho Imagem 02:</label>
                <input type="file" name="imagem_produto_2" id="lupinha" class="fa fa-search fa-2x">
                <!--  Imagem -->
                <label for="imagem_produto_3">Caminho Imagem 03:</label>
                <input type="file" name="imagem_produto_3" id="lupinha" class="fa fa-search fa-2x">
                <!--  Imagem -->
                <label for="imagem_produto_4">Caminho Imagem 04:</label>
                <input type="file" name="imagem_produto_4" id="lupinha" class="fa fa-search fa-2x">
            </div>
            
            <div class="grupo-botoes">
                <input type="submit" value="Enviar">
                <input type="reset" value="Cancelar">
            </div>
        </form>
    </section>
        <script>
            var teste = document.querySelector("input#lupinha").value;
            console.log(teste);
        </script>
    </body>

</html>