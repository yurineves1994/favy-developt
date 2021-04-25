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
 <fieldset class="row" id="endereco-faturamento">
                        <legend>Endereço Faturamento</legend>
                        <div class="form-group col-sm-2">
                            <label for="cep"> CEP </label>
                            <input required name="cep" type="number" class="form-control" id="cep" placeholder="">
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="logradouro"> RUA </label>
                            <input required name="logradouro" type="text" class="form-control" id="logradouro" placeholder="">
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="bairro"> BAIRRO </label>
                            <input required name="bairro" type="text" class="form-control" id="bairro" placeholder="">
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="localidade"> CIDADE </label>
                            <input required name="localidade" type="text" class="form-control" id="localidade" placeholder="">
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="uf"> ESTADO </label>                    
                            <select id="uf" name="uf" class="form-control">
                                <option value="AC">AC</option>
                                <option value="AL">AL</option>
                                <option value="AP">AP</option>
                                <option value="AM">AM</option>
                                <option value="BA">BA</option>
                                <option value="CE">CE</option>
                                <option value="DF">DF</option>
                                <option value="ES">ES</option>
                                <option value="GO">GO</option>
                                <option value="MA">MA</option>
                                <option value="MT">MT</option>
                                <option value="MS">MS</option>
                                <option value="MG">MG</option>
                                <option value="PA">PA</option>
                                <option value="PB">PB</option>
                                <option value="PR">PR</option>
                                <option value="PE">PE</option>
                                <option value="PI">PI</option>
                                <option value="RJ">RJ</option>
                                <option value="RN">RN</option>
                                <option value="RS">RS</option>
                                <option value="RO">RO</option>
                                <option value="RR">RR</option>
                                <option value="SC">SC</option>
                                <option value="SP">SP</option>
                                <option value="SE">SE</option>
                                <option value="TO">TO</option>                               
                            </select>
                        </div>        
                        <div class="form-group col-sm-2">
                            <label for="numero"> NUMERO </label>
                            <input required name="numero" type="number" class="form-control" id="numero" placeholder="">
                        </div>                      
                    </fieldset>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="checkEndereco" name="eigual" value="sim">
                            <label class="form-check-label" for="checkEndereco">
                                O endereço de entrega é o mesmo do endereço de faturamento
                            </label>
                        </div>
                    </div>
                    <fieldset class="endereco-entrega01">
                        <legend>Endereço Entrega 01</legend>                       
                        <div class="row" class="grupoEnderecoEntrega1">
                            <div class="form-group col-sm-2">
                                <label for="cepEntrega1"> CEP </label>
                                <input required name="cepEntrega1" type="number" class="form-control" id="cepEntrega1" placeholder="">
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="logradouroEntrega1"> RUA </label>
                                <input required name="logradouroEntrega1" type="text" class="form-control" id="logradouro" placeholder="">
                            </div>
                            <div class="form-group col-sm-2">
                                <label for="bairroEntrega1"> BAIRRO </label>
                                <input required name="bairroEntrega1" type="text" class="form-control" id="bairro" placeholder="">
                            </div>
                            <div class="form-group col-sm-2">
                                <label for="localidadeEntrega1"> CIDADE </label>
                                <input required name="localidadeEntrega1" type="text" class="form-control" id="localidade" placeholder="">
                            </div>
                            <div class="form-group col-sm-2">
                                <label for="ufEntrega1"> ESTADO </label>                    
                                <select id="uf" name="ufEntrega1" class="form-control">
                                    <option value="AC">AC</option>
                                    <option value="AL">AL</option>
                                    <option value="AP">AP</option>
                                    <option value="AM">AM</option>
                                    <option value="BA">BA</option>
                                    <option value="CE">CE</option>
                                    <option value="DF">DF</option>
                                    <option value="ES">ES</option>
                                    <option value="GO">GO</option>
                                    <option value="MA">MA</option>
                                    <option value="MT">MT</option>
                                    <option value="MS">MS</option>
                                    <option value="MG">MG</option>
                                    <option value="PA">PA</option>
                                    <option value="PB">PB</option>
                                    <option value="PR">PR</option>
                                    <option value="PE">PE</option>
                                    <option value="PI">PI</option>
                                    <option value="RJ">RJ</option>
                                    <option value="RN">RN</option>
                                    <option value="RS">RS</option>
                                    <option value="RO">RO</option>
                                    <option value="RR">RR</option>
                                    <option value="SC">SC</option>
                                    <option value="SP">SP</option>
                                    <option value="SE">SE</option>
                                    <option value="TO">TO</option>                               
                                </select>
                            </div>        
                            <div class="form-group col-sm-2">
                                <label for="numeroEntrega1"> NUMERO </label>
                                <input required name="numeroEntrega1" type="number" class="form-control" id="numero" placeholder="">
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="endereco-entrega02">
                        <legend>Endereço Entrega 02</legend> 
                        <div class="row" class="grupoEnderecoEntrega2">
                            <div class="form-group col-sm-2">
                                <label for="cepEntrega2"> CEP </label>
                                <input required name="cepEntrega2" type="number" class="form-control" id="cepEntrega2" placeholder="">
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="logradouro"> RUA </label>
                                <input required name="logradouroEntrega2" type="text" class="form-control" id="logradouro" placeholder="">
                            </div>
                            <div class="form-group col-sm-2">
                                <label for="bairro"> BAIRRO </label>
                                <input required name="bairroEntrega2" type="text" class="form-control" id="bairro" placeholder="">
                            </div>
                            <div class="form-group col-sm-2">
                                <label for="localidade"> CIDADE </label>
                                <input required name="localidadeEntrega2" type="text" class="form-control" id="localidade" placeholder="">
                            </div>
                            <div class="form-group col-sm-2">
                                <label for="uf"> ESTADO </label>                    
                                <select id="uf" name="ufEntrega2" class="form-control">
                                    <option value="AC">AC</option>
                                    <option value="AL">AL</option>
                                    <option value="AP">AP</option>
                                    <option value="AM">AM</option>
                                    <option value="BA">BA</option>
                                    <option value="CE">CE</option>
                                    <option value="DF">DF</option>
                                    <option value="ES">ES</option>
                                    <option value="GO">GO</option>
                                    <option value="MA">MA</option>
                                    <option value="MT">MT</option>
                                    <option value="MS">MS</option>
                                    <option value="MG">MG</option>
                                    <option value="PA">PA</option>
                                    <option value="PB">PB</option>
                                    <option value="PR">PR</option>
                                    <option value="PE">PE</option>
                                    <option value="PI">PI</option>
                                    <option value="RJ">RJ</option>
                                    <option value="RN">RN</option>
                                    <option value="RS">RS</option>
                                    <option value="RO">RO</option>
                                    <option value="RR">RR</option>
                                    <option value="SC">SC</option>
                                    <option value="SP">SP</option>
                                    <option value="SE">SE</option>
                                    <option value="TO">TO</option>                               
                                </select>
                            </div>        
                            <div class="form-group col-sm-2">
                                <label for="numeroEntrega2"> NUMERO </label>
                                <input required name="numeroEntrega2" type="number" class="form-control" id="numero" placeholder="">
                            </div>
                        </div>
                    </fieldset>
                    <div>
                        <input id="botao-add-grupo" class="col-sm-1 mb-2" type="button" value="+"></input>
                        <input id="botao-excluir-grupo" class="col-sm-1 mb-2" type="button" value="-"></input>
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
        //validação senha
        function validaSenha(input) {
            var bt1 = document.getElementById('senha1').value;
            var bt2 = document.getElementById('senha2').value;

            if (bt1 != bt2) {
                input.setCustomValidity("Senhas diferentes!");
                return false;
            }
        }
        // campos faturamento
        var $campoCep = document.querySelector('[name="cep"]');
        var $campoRua = document.querySelector('[name="logradouro"]');
        var $campoBairro = document.querySelector('[name="bairro"]');
        var $campoCidade = document.querySelector('[name="localidade"]');
        var $campoEstado = document.querySelector('[name="uf"]');
        var $campoNumero = document.querySelector('[name="numero"]');

        // campos entrega 01
        var $campoCep01 = document.querySelector('[name="cepEntrega1"]');
        var $campoRua01 = document.querySelector('[name="logradouroEntrega1"]');
        var $campoBairro01 = document.querySelector('[name="bairroEntrega1"]');
        var $campoCidade01 = document.querySelector('[name="localidadeEntrega1"]');
        var $campoEstado01 = document.querySelector('[name="ufEntrega1"]');
        var $campoNumero01 = document.querySelector('[name="numeroEntrega1"]');

        // campos entrega 02
        var $campoCep02 = document.querySelector('[name="cepEntrega2"]');
        var $campoRua02 = document.querySelector('[name="logradouroEntrega2"]');
        var $campoBairro02 = document.querySelector('[name="bairroEntrega2"]');
        var $campoCidade02 = document.querySelector('[name="localidadeEntrega2"]');
        var $campoEstado02 = document.querySelector('[name="ufEntrega2"]');
        var $campoNumero02 = document.querySelector('[name="numeroEntrega2"]');

        if ($("input[name=eigual]").val() == "sim") {
            $(".endereco-entrega01").hide();
            $(".endereco-entrega02").hide();
            $("#botao-add-grupo").hide();
            $("#botao-excluir-grupo").hide();
        }
        $("#botao-add-grupo").click(function () {
            $(".endereco-entrega02").show();
        });

        $("#botao-excluir-grupo").click(function () {
            $(".endereco-entrega02").hide();
        });

        $("input[name=eigual]").click(function () {
            if ($(this).prop("checked") == true) {
                $(".endereco-entrega01").show();
                $("#botao-add-grupo").show();
                $("#botao-excluir-grupo").show();
                $('[name="cepEntrega1"]').val("");
                $('[name="logradouroEntrega1"]').val("");
                $('[name="bairroEntrega1"]').val("");
                $('[name="localidadeEntrega1"]').val("");
                $('[name="ufEntrega1"]').val("");
                $('[name="numeroEntrega1"]').val("");
            } else {
                $(".endereco-entrega01").hide();
                $("#botao-add-grupo").hide();
                $("#botao-excluir-grupo").hide();
                $campoCep01.value = $campoCep.value;
                $campoRua01.value = $campoRua.value;
                $campoBairro01.value = $campoBairro.value;
                $campoCidade01.value = $campoCidade.value;
                $campoEstado01.value = $campoEstado.value;
                $campoNumero01.value = $campoNumero.value;
            }
        });
        
        $campoNumero.addEventListener("blur", function(){
            $campoNumero01.value = $campoNumero.value;
        });

        // API de CEP Endereço Faturamento
        $campoCep.addEventListener("blur", infoDoEvento => {
            const cep = infoDoEvento.target.value;
            fetch("https://viacep.com.br/ws/" + cep + "/json/")
                    .then((respostaDoServer) => {
                        return respostaDoServer.json();
                    }).then((dadosDoCep) => {
                $campoRua.value = dadosDoCep.logradouro;
                $campoBairro.value = dadosDoCep.bairro;
                $campoCidade.value = dadosDoCep.localidade;
                $campoEstado.value = dadosDoCep.uf;
                $campoCep01.value = $campoCep.value;
                $campoRua01.value = $campoRua.value;
                $campoBairro01.value = $campoBairro.value;
                $campoCidade01.value = $campoCidade.value;
                $campoEstado01.value = $campoEstado.value;
                $campoNumero01.value = $campoNumero.value;
            });
        });

        // API de CEP Endereço de Entrega01
        $campoCep01.addEventListener("blur", infoDoEvento => {
            const cep01 = infoDoEvento.target.value;
            fetch("https://viacep.com.br/ws/" + cep01 + "/json/")
                    .then((respostaDoServer) => {
                        return respostaDoServer.json();
                    }).then((dadosDoCep) => {
                $campoRua01.value = dadosDoCep.logradouro;
                $campoBairro01.value = dadosDoCep.bairro;
                $campoCidade01.value = dadosDoCep.localidade;
                $campoEstado01.value = dadosDoCep.uf;
            });
        }
        );

        // API de CEP Endereço de Entrega01
        $campoCep02.addEventListener("blur", infoDoEvento => {
            const cep02 = infoDoEvento.target.value;
            fetch("https://viacep.com.br/ws/" + cep02 + "/json/")
                    .then((respostaDoServer) => {
                        return respostaDoServer.json();
                    }).then((dadosDoCep) => {
                $campoRua02.value = dadosDoCep.logradouro;
                $campoBairro02.value = dadosDoCep.bairro;
                $campoCidade02.value = dadosDoCep.localidade;
                $campoEstado02.value = dadosDoCep.uf;
            });
        });

    </script>
</html>