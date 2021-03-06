<%-- 
    Document   : tela03
    Created on : 27/02/2021, 17:30:01
    Author     : yurin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <title>CADASTRO PRODUTO</title>
        <style>
            .container {
                margin: 0 auto;
                width: 1250px;
            }

            .grupo-partils {
                display: flex;
                justify-content: center;
            }

            .partils {
                margin: 10px;
                width: 60%;
                height: 500px;
                border: 1px solid black;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>VISUALIZAÇÃO PRODUTO</h2>
            <div class="grupo-partils">
                <div class="partils">
                        <h2>${produto.nomeProduto}</h2>
                        <h4>${produto.precoProduto}</h4>
                </div>
                <div class="partils">
                    <p>${produto.descricao}</p>
                </div>
            </div>
        </div>
    </body>

</html>