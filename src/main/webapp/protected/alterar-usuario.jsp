<%-- 
    Document   : alterar-usuario
    Created on : 04/04/2021, 15:00:57
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <section>
            <div class="container mt-4">
                <!-- enctype="multipart/form-data" -->
                <form action="CadastrarUsuario" method="POST" >
                    
                    <!-- Usuario -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Nome </label>
                        <input style="display:none;" value="${usuario.codUsuario}" required name="cod_usuario" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                        <input value="${usuario.nomeUsuario}" required name="nome" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
                    </div>
                    
                    <!-- Status -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Status </label>
                        <select name="status" class="form-control" id="exampleFormControlSelect1" value="${usuario.statusUsuario}">
                            <option value="a"> Ativo </option>
                            <option value="i"> Inativo </option>
                        </select>
                    </div>
                    
                    <!-- Cargo -->
                    <div class="form-group">
                        <label for="exampleFormControlSelect1"> Cargo </label>
                        <select name="cargo" class="form-control" id="exampleFormControlSelect1" value="${usuario.cargo}">
                          <option > Estoquista </option>
                          <option > Admistrador </option>
                        </select>
                    </div>
                    
                    <!-- Email -->
                    <div class="form-group" value="${usuario.emailUsuario}">
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
</html>
