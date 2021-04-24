<%-- 
    Document   : tela-cadastro_cliente
    Created on : 11/04/2021, 17:10:34
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header-usuario.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Cadastro de Usuários </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="estilos/estiloCadastroProduto.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <section>
            <div class="container mt-4">               
                <form action="CadastrarEndereco" method="POST">                  
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
        if($("input[name=eigual]").val() == "sim"){
            $(".endereco-entrega01").hide();
            $(".endereco-entrega02").hide();           
        }
        $("#botao-add-grupo").click(function(){
            $(".endereco-entrega02").show();
        });

        $("#botao-excluir-grupo").click(function(){
            $(".endereco-entrega02").hide();
        });

        $("input[name=eigual]").click(function(){
            if($(this).prop("checked") == true){
                $(".endereco-entrega01").show();
            } else {
                $(".endereco-entrega01").hide(); 
            }
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
