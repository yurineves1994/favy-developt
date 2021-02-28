package br.senac.sp.servlet;

import br.senac.sp.entidade.Produto;
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

        String nomeProduto = request.getParameter("nomeProduto");
        String nomeProdutoExtenso = request.getParameter("nomeProdutoExtenso"); 
        Long qtd_estrela = Long.parseLong(request.getParameter("qtd_estrela"));
        String status = request.getParameter("status");
        String categoria = request.getParameter("categoria");
        String descricao = request.getParameter("descricao");

        Produto produtos = new Produto(nomeProduto, nomeProdutoExtenso, qtd_estrela, status ,categoria, descricao);
        try {
            ProdutoDAO.addProduto(produtos);
            response.sendRedirect("sucesso.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
