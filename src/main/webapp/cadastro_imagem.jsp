<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="header.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <div class="campo-center">
        <label for="url-imagem">Caminho Imagem:</label>
        <input type="text" id="url-imagem" name="lupinha">
        <input type="file" id="lupinha" name="lupinha" class="fa fa-search fa-1x">
    </div>
    <div class="campo-center">
        <input type="checkbox" id="check-image" name="check-image">
        <label for="url-imagem">Imagem da Pagina Principal</label>
    </div>
    <fieldset>
        <legend>Adicionar/Remover Imagem</legend>
        <div class="campo-center">
            <div class="grupo-imagem">
                <div class="imagem"></div>
                <div class="imagem"></div>
                <div class="imagem"></div>
                <div class="imagem"></div>
                <button>Remover Selecionado</button>
            </div>
        </div>
    </fieldset>
</fieldset>
<div class="campo-right">
    <input type="reset" value="Cancelar">
    <input type="submit" value="Enviar">
</div>

</body>
</html>