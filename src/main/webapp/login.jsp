<%-- 
    Document   : login
    Created on : 28/03/2021, 17:09:39
    Author     : PICHAU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Login" method="POST">
            <h3 >Faça seu Acesso:</h3>
            <div class="form-group">
                <label class="h3">Usuário</label>
                <input name="login" required class="form-control" autofocus="autofocus"/>
            </div>            
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha" required class="form-control"/>
            </div>
            <div class="btn-area">
                <button type="submit" class="btn btn-primary ">Login</button>
            </div>

        </form>
    </body>
</html>
