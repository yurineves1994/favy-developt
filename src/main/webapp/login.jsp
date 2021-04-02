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
    </head>
    <body>
        <c:if test="${not empty param.erro}">
            <div class="alert alert-danger" role="alert">
                Usuario/Senha inválidos!
            </div>
        </c:if> 
        <form action="Login" method="POST">
            <h3 >Faça seu Acesso:</h3>
            <div class="form-group">
                <label class="h3">Usuário</label>
                <input name="email_user" required class="form-control" autofocus="autofocus"/>
            </div>            
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha_user" required class="form-control"/>
            </div>
            <div class="btn-area">
                <button type="submit" class="btn btn-primary ">Login</button>
            </div>

        </form>
    </body>
</html>
