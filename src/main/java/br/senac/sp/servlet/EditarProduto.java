package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yurin
 */
public class EditarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codProduto = Integer.parseInt(request.getParameter("codProduto"));
        Produto produto = ProdutosDAO.obterProduto(codProduto);

        request.setAttribute("produto", produto);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tela-editar-produto.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codProduto = Integer.parseInt(request.getParameter("cod_produto"));
        String nomeProduto = request.getParameter("nome_produto");
        String descricao = request.getParameter("descricao");
        int qtdEstrela = Integer.parseInt(request.getParameter("qtd_estrela"));
        long qtdProduto = Long.parseLong(request.getParameter("qtd_produto"));
        String statusProduto = request.getParameter("status_produto");
        long precoProduto = Long.parseLong(request.getParameter("preco_produto"));

        Produto produto = ProdutosDAO.obterProduto(codProduto);
        produto.setNomeProduto(nomeProduto);
        produto.setDescricao(descricao);
        produto.setQtdEstrela(qtdEstrela);
        produto.setQtdProduto(qtdProduto);
        produto.setStatusProduto(statusProduto);
        produto.setPrecoProduto(precoProduto);

        try {
            ProdutosDAO.updateProduto(produto);
            response.sendRedirect("sucesso.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }

}
