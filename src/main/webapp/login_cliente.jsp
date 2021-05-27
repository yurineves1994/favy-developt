<%-- 
    Document   : login
    Created on : 28/03/2021, 17:09:39
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>JSP Page</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;

            }
            body{
                background-size:cover;
                background: url("icones/background-login.jpg");
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .barra-alert {
                position: fixed;
                top: 0;
                left:0;
                color: white;
                font-size: 20px;
                font-weight:bolder;
                line-height: 10px;
                width: 100%;
                height: 50px;
                background: #D0263E;
            }
            .barra-alert p{
                padding: 20px
            }
            h2{
                font-size: 30px;
                color: #fff;
                text-align: center;
                margin: 20px;
            }
            .container{
                width: 350px;
                background: rgba(0, 0, 0, 0.527);
                color: white;
                border-radius: 20% 0;
                box-shadow: 1px 2px 10px #000, 3px 6px 20px #000;
                padding: 50px 20px;
            }

            input {
                width: 100%;
                height: 46px;
                background: transparent;
                border: none;
                outline: none;
                border-bottom: 1px solid white;
                color:white;
            }
            .input-field {
                position: relative;
                margin-bottom: 20px;
            }
            label {
                position: absolute;
                top: 0;
                left: 0;
                color: #fff;
                transform: translateY(18px);
                transition: .25s ease-in-out;   
            }
            input:focus {
                border-bottom: 2px solid #9A27A9;
                box-shadow: 0 1px 0 0 #9A27A9;
            }
            .grupo-botoes {
                position: relative;
                top: 30px;
                text-align: center;
            }
            button {
                padding: 15px 50px;
                margin: 20px;
                background: transparent;
                border: 2px solid white;
                color: white;
                text-transform: uppercase;
                border-radius: 20px;
                cursor: pointer;
            }
            button:hover {
                background: #150038;
                opacity: 0.7;
            }
            a {
                text-decoration: none;
                color: white;
                transition: .25s ease-in-out;
                font-size: 18px;
            }
            a:hover {
                color: #9A27A9;
            }
            .div-mostrar-senha{
                width: 100%;
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: absolute;
            }
            .mostrar-senha-label{
                position: absolute;
                top: -8px;
                left: 25px;               
            }  
            .mostrar-senha-input{
                width: 13px;
                padding: 0px;                
                top: 8px;
                position: relative
            }
            .cadastrar{
                position: relative;
                top: 20px;
            }
        </style>
    </head>
    <body> 
        <c:if test="${param.erro != null}">
            <div class="barra-alert" role="alert">
                <p>Usuário/Senha inválidos!</p>
            </div>
        </c:if>
        <section class="container">              
            <h2>Faça seu Acesso:</h2>
            <form action="LoginCliente" method="POST" >            
                <div class="input-field">                    
                    <input required name="email_cli" placeholder="Login" autofocus="autofocus" >
                </div>            
                <div class="input-field">
                    <input required type="password" placeholder="Senha" name="senha_cli"  >
                    <span class="div-mostrar-senha">
                        <label class="mostrar-senha-label">Mostrar Senha</label>
                        <a class="mostrar-senha-input" href="#"><i class="fa fa-eye"></i></a>
                    </span>
                </div>  

                <div class="grupo-botoes">
                    <button type="submit">Login</button>
                </div>
                <div class="cadastrar">           
                    <span>Não tem um cadastro? <a href="tela-cadastro-cliente.jsp" >Cadastre-se agora</a></span>
                </div>
            </form>
        </section>      
    </body>
    <script>
        let btn = document.querySelector('.mostrar-senha-input');
        btn.addEventListener('click', function () {
            let input = document.querySelector('input[name=senha_cli]');
            if (input.getAttribute('type') == 'password') {
                input.setAttribute('type', 'text');
            } else {
                input.setAttribute('type', 'password');
            }
        });
    </script>
</html>
