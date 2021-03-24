package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Produto;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PesquisarNome extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomePesquisa = request.getParameter("nome_pesquisa");
        List<Produto> listaProdutos = ProdutosDAO.PesquisarProduto(nomePesquisa);

        request.setAttribute("listaProdutos", listaProdutos);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tela_listar_produto.jsp");
        requestDispatcher.forward(request, response);
    }
}
