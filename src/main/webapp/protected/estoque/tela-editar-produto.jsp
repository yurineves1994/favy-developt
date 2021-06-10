<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header-usuario.jsp" %>
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
                <form action="<c:url value="/EditarProduto"/>" method="POST" enctype="multipart/form-data">
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
                        
                        <div>
                            <input type="button" onclick="addImg()" value="+">                
                            <table id="myTable">
                                <% int i = 1;%> 
                                <c:forEach items="${produto.imagemProduto}" var="produt">
                                    <tr>
                                        <td>
                                            <img  width = "200" height = "200" src = "data:image/png;base64, ${produt}" alt = "Red dot">      
                                            <input type="button" value="Delete" onclick="deleteRow(this.parentNode.parentNode.rowIndex)">
                                            <input type="file" name="addImg<%=i%>" src = "data:image/png;base64, ${produt}">
                                        </td>
                                    </tr>
                                    
                                    <div style="display: none;" >
                                        <%=i++%>
                                    </div>
                                </c:forEach>
                            </table>
                        </div>
                        <input type="text" id="imgLenght" name="qtdImgs" value="<%=i-1%>" style="display: none;">
            
                        <input type="text" id="nomesImg" name="nomesImg" style="display: none;">
                        
                    </div>                 
                    <div class="row ">
                        <a class="btn btn-dark mr-2" href="ListarProdutos">Cancelar</a>
                        <button type="submit" class="btn btg-lg btn-dark" onclick="pegarNomes()">Enviar</button>
                    </div>
                </form>

            </div>
        </section>

        <script>
            index = document.getElementById('imgLenght');
            
            nomes = [];
            
            for( let i = 1; i <= index.value; i++ ){
                nomes.push( "addImg"+i );
            }

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
