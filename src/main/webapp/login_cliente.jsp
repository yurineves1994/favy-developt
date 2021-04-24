<%-- 
    Document   : login
    Created on : 28/03/2021, 17:09:39
    Author     : PICHAU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <c:if test="${param.erro != null}">
           <div class="alert alert-danger" role="alert">
            Usuário/Senha inválidos!
           </div>
        </c:if>
        <section class="container mt-5">              
            <div class="row justify-content-center align-items-center">
                <div class="col-4">
                    <div class="card">
                        <h3 class="align-items-center m-2">Faça seu Acesso:</h3>
                        <div class="card-body">
                            <form action="LoginCliente" method="POST" class="form-signin">            
                                <div class="form-group">
                                    <label>Cliente</label>
                                    <input required name="email_cli" class="form-control" autofocus="autofocus" >
                                </div>            
                                <div class="form-group">
                                    <label>Senha</label>
                                    <input required type="password" name="senha_cli" class="form-control" >
                                </div>
                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">Remember password</label>
                                </div>
                                <div class="btn-area">
                                    <button type="submit" class="btn btn-primary ">Login</button>
                                </div>
                                <div class="btn-area">
                                    <label>Não tem um cadastro?</label><br>
                                    <a href="tela-cadastro-cliente.jsp" >Cadastre agora</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            if()
        </script>
</html>
