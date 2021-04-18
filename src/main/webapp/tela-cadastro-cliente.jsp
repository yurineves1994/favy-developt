<%-- 
    Document   : tela_cadastro_cliente
    Created on : 01/04/2021, 19:42:28
    Author     : Ferreira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Cadastro de Usuários </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="../estilos/estiloCadastroProduto.css">
    </head>
    <body>
        <section>
            <div class="container mt-4">
                <!-- enctype="multipart/form-data" -->
                <form action="<c:url value="/CadastrarCliente"/>" method="POST" >

                    <!-- Usuario -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Nome </label>
                        <input required name="nome" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>

                    <!-- Cpf -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Cpf </label>
                        <input required name="cpf" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Email </label>
                        <input required name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>

                    <!-- Senha -->
                    <div class="form-group">
                        <label for="senha1"> Senha </label>
                        <input id="senha1" required name="senha" type="password" class="form-control" placeholder=" ">
                    </div>
                    <!-- *Senha -->
                    <div class="form-group">
                        <label for="senha2"> Confirme sua senha </label>
                        <input id="senha2" required type="password" class="form-control" placeholder=" ">
                    </div>

                    <div class="campo-right">
                        <input type="submit" value="Enviar" class="btn btn-success">
                        <input type="reset" value="Cancelar" class="btn btn-secondary">
                    </div>

                </form>
            </div>
        </section>
    </body>
    <script>

        function validaSenha(input) {
            var bt1 = document.getElementById('senha1').value;
            var bt2 = document.getElementById('senha2').value;

            if (bt1 != bt2) {
                input.setCustomValidity("Senhas diferentes!");
                return false;
            }
        }
    </script>
</html>
