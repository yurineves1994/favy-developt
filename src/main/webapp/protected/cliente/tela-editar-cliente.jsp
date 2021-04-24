<%-- 
    Document   : tela-editar-usuario
    Created on : 04/04/2021, 15:12:00
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
   <%@include file="../../header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Cadastro de Cliente </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../estilos/estiloCadastroProduto.css">
    </head>
    <body>
       <section>
            <div class="container mt-4">
                <!-- enctype="multipart/form-data" -->
                <form action="<c:url value="/EditarCliente"/>" method="POST" >
                    
                    <!-- Nome -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Nome </label>
                        <input style="display:none;" value="${cliente.codCliente}" required name="cod_cliente" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                        <input value="${cliente.nomeCliente}" required name="nome" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>
                    
                    <!-- CPF -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> CPF </label>
                        <input required name="cpf" type="cpf" class="form-control" id="exampleFormControlInput1" placeholder="" value="${cliente.cpf}">
                    </div>
                    
                    <!-- Email -->
                    <div class="form-group" >
                        <label for="exampleFormControlSelect1"> Email </label>
                        <input required name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="" value="${cliente.email}">
                    </div>
                    
                    <!-- Senha -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Senha </label>
                        <input id="senha1" required name="senha1" type="password" class="form-control" id="exampleFormControlInput1" placeholder=" ">
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
</html>