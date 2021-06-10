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
        <form class="formulario cadastro_produto" action="<c:url value="/CadastrarProduto"/>" method="POST" enctype="multipart/form-data">
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
            <div>
                <input type="button" onclick="addImg()" value="+">                
                <table id="myTable">

                </table>
            </div>
            <input type="text" id="imgLenght" name="qtdImgs" value="0" style="display: none;">
            
            <input type="text" id="nomesImg" name="nomesImg" style="display: none;">

            
            
            <div class="grupo-botoes">
                <input type="submit" value="Enviar" onclick="pegarNomes()">
                <input type="reset" value="Cancelar">
            </div>
        </form>
    </section>
        <script>
            index = document.getElementById('imgLenght');

            nomes = [];

            function pegarNomes(){
                document.getElementById("nomesImg").value = nomes;
            }

           function addImg(){
                let tabela = document.getElementById("myTable");
                let linha = document.createElement('tr');

                index.value++;

                let celula = document.createElement('td');

                tabela.appendChild(linha);
                linha.appendChild(celula);

                celula.innerHTML = "<input type='button' value='Delete' onclick='deleteRow(this.parentNode.parentNode.rowIndex)'>Remover</button>\n\
                <input type='file' name='addImg"+index.value+"'>";

                //nomes += "addImg"+index.value+" ";
                nomes.push( "addImg"+index.value );
                console.log("----------CADASTRO-------------")
                nomes.forEach( exibir );

                celula.appendChild(myTable);                
           }
           
           function exibir( e ){
               console.log( e );
           }
           

           function deleteRow(i){
                console.log(i);

                nomes.splice( i, 1 );
                //nomes.splice( i+1, 1 ); se o de cima não funcionar eu funciono hehe
                
                console.log("---------DELETADOS--------------")
                nomes.forEach( exibir );

                document.getElementById('myTable').deleteRow(i);
           }

       </script>
    </body>

</html>