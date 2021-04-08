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
                <form action="<c:url value="/CadastrarUsuario"/>" method="POST" >
                    
                    <!-- Usuario -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Nome </label>
                        <input required name="nome" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>
                    
                    <!-- Status -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Status </label>
                        <select name="status" class="form-control" id="exampleFormControlSelect1">
                            <option value="a"> Ativo </option>
                            <option value="i"> Inativo </option>
                        </select>
                    </div>
                    
                    <!-- Cargo -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Cargo </label>
                        <select name="cargo" class="form-control" id="exampleFormControlSelect1">
                          <option > Estoquista </option>
                          <option > Admistrador </option>
                        </select>
                    </div>
                    
                    <!-- Email -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Email </label>
                        <input required name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>
                    
                    <!-- Senha -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Senha </label>
                        <input id="senha2" required name="senha" type="password" class="form-control" id="exampleFormControlInput1" placeholder=" ">
                    </div>
                    <!-- *Senha -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Confirme sua senha </label>
                        <input id="senha2" required type="password" class="form-control" id="exampleFormControlInput1" placeholder=" ">
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
        
    </script>
</html>
