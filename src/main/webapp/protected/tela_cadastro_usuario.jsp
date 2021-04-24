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
        <style>
            body {
                background-color: rgb(241, 240, 240);
                margin: 0;
            }

            .container {
                max-width: 1920px;
                width: 100%;
            }

            #lupinha {           
                width: 55px !important;
                font-size: 50px;
                padding: 10px;
                background-color: rgb(241, 240, 240);
            }

            .grupo-imagem {
                display: flex;
                justify-content: space-between;
            }
            .grupo-botoes {
                display: flex;

            }

            .formulario {
                position: relative;
                width: 90%;
                margin-left: auto;
                margin-right: auto;
                padding-top: 3em;
                padding-bottom: 5em;
                text-align: center;
            }

            .formulario input,
            .formulario select {
                background-color: #fff;
                width: 100%;
                border-radius: 5px;
                border-color: transparent;
                padding: 10px 20px;
                font-size: 18px;
                margin:10px;
            }

            .formulario input[type=submit],
            .formulario input[type=reset] {
                background-color: #152b4b;
                text-transform: uppercase;
                color: #fff;
                cursor: pointer;
                transition: .5s;
            }
        </style> 
    </head>
    <body>
        <section  class="container">
            <!-- enctype="multipart/form-data" -->
            <form class="formulario cadastro_usuario" action="<c:url value="/CadastrarUsuario"/>" method="POST" >
                <!-- Usuario -->         
                <input required name="nome" type="text" id="exampleFormControlInput1" placeholder="Nome">
                <!-- Status -->
                <select name="status" id="status" required>
                    <option value>Status</option>
                    <option value="a"> Ativo </option>
                    <option value="i"> Inativo </option>
                </select>
                <!-- Cargo -->
                <select name="cargo" id="cargo" required>
                    <option value>Cargo</option>
                    <option > Estoquista </option>
                    <option > Admistrador </option>
                </select>
                <!-- Email -->           
                <input required name="email" type="email" id="exampleFormControlInput1" placeholder="Email">
                <!-- Senha -->     
                <input id="senha1" required name="senha" type="password" placeholder="Senha">      
                <!-- *Senha -->    
                <input id="senha2" required type="password" placeholder="Confirmar Senha">
                <div class="grupo-botoes">
                    <input type="submit" value="Enviar">
                    <input type="reset" value="Cancelar">
                    </form>
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
