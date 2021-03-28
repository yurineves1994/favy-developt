<%-- 
    Document   : header
    Created on : 08/10/2020, 18:48:19
    Author     : yurin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="estilos/cabecalho.css">

    </head>
    <body>
        <header>

            <div class="menu_voltar">
                <div class="ajusta_icone_menu">
                    <a href="CardsProdutos">
                        <img src="icones/icon-sair.png" alt="sair" class="menu_voltar_icon centraliza_icone">
                    </a>
                </div>
            </div>

            <!-- Sub menu -->
            <div class="menu_opcoes">
                <!-- Tabelas -->
                <div class="menu_tabela_produtos">
                    <a href="ListarProdutos" >
                        <img src="icones/icon-tabela.png" alt="tabela" class="icone_menu centraliza_icone link_tabelas" title="Listar Produto">
                    </a>
                </div>
                <!-- Cadastro Produto -->
                <div class="menu_cadastro_produtos">
                    <a href="tela_cadastro_produto.jsp">
                        <img src="icones/icon-produto.png" alt="produto" class="icone_menu centraliza_icone link_produto" title="Cadastrar Produto">
                    </a>
                </div>
            </div>
        </header>
    </body>
    <!--
    <body>
        <header>        
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <ul class="navbar-nav mr-auto">
                    <div class="collapse navbar-collapse">
                        <li><a class="nav-link" href="tela_cadastro_produto.jsp">Cadastrar Produtos</a></li>
                        <li><a class="nav-link" href="ListarProdutos">Listar Produtos</a></li>
                        <li><a class="nav-link" href="CardsProdutos">Cards Produtos</a></li>
                    </div>
                </ul>
            </nav>
            <div class="abre-menu" style="width: 100%; height: 13px; background: #343A40; text-align: center;">
                <i class="fa fa-angle-up fa-1x" style="background: #343A40; padding: 3px; border-radius: 10px; color:#FFFFFF;"></i>
            </div>
        </header>       
        <script>
            document.querySelectorAll('.abre-menu').forEach(faq => {
                faq.onclick = function (e) {
                    const faqsup = faq.previousElementSibling;
                    const d = faqsup.style.display;
                    faqsup.style.display = d == 'block' ? 'none' : 'block';
                }
            });
            document.querySelectorAll('table').values;
        </script>
    -->
</body>
</html>
