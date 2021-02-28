package br.senac.sp.servlet;

import br.senac.sp.entidade.Produto;
import br.senac.sp.dao.ProdutosDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastrarProduto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nomeProduto = request.getParameter("nome_produto");
        String descricao = request.getParameter("descricao");
        String statusProduto = request.getParameter("status_produto");
        long precoProduto = Long.parseLong(request.getParameter("preco_produto"));
        long qtdProduto = Long.parseLong(request.getParameter("qtd_produto"));
        int qtdEstrela = Integer.parseInt(request.getParameter("qtd_estrela"));
        String imagemProduto = request.getParameter("imagem_produto");

        Produto produtos = new Produto(nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto);
        try {
            ProdutosDAO.addProduto(produtos);
            response.sendRedirect("sucesso.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
