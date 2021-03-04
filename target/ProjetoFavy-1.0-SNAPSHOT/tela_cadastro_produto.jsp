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

        <!-- Estilo input -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <section>
            <div class="container mt-4">
                <form action="CadastrarProduto" method="POST">
                    
                    <div class="form-group">
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder=" Nome do Produto ">
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlTextarea1"> Descrição </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Qtd Estrelas </label>
                        <select class="form-control" id="exampleFormControlSelect1">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <select class="form-control" id="exampleFormControlSelect1">
                          <option>Status</option>
                          <option>Ativo</option>
                          <option>Inativo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Qtd Estoque ">
                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control" id="exampleFormControlInput1" placeholder=" Preço ">
                    </div>

                    <div class="campo-right">
                        <input type="submit" value="Enviar" class="btn btn-success">
                        <input type="reset" value="Cancelar" class="btn btn-secondary">
                    </div>
                </form>

            </div>
        </section>

    </body>

</html>