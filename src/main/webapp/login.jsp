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
            .center {
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
        </style>
    </head>
    <body> 
        <c:if test="${param.erro != null}">
            <div class="alert alert-danger" role="alert">
                Usuário/Senha inválidos!
            </div>
        </c:if>
        <section class="container">              
            <h2>Faça seu Acesso:</h2>
            <form action="Login" method="POST">            
                <div class="input-field">   
                    
                    <input name="email_user" placeholder="Login"  autofocus="autofocus" required/>
                </div>            
                <div class="input-field"> 
                    
                    <input type="password" placeholder="Senha" name="senha_user" required  />
                </div>               
                <div class="center">
                    <button type="submit" >Login</button>
                </div>
                <div class="links">
                    <a href="#"></a>
                    <a href="#"></a>
                </div>
            </form>
        </section>      
    </body>
</html>
