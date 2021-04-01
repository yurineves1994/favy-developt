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

public class ListarProdutos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numeroPagina = request.getParameter("numeroPagina");

        List<Produto> listaProdutos = ProdutosDAO.listarProdutos(numeroPagina);

        request.setAttribute("listaProdutos", listaProdutos);
        request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
        
        int quantidadePagina = ProdutosDAO.quantidadePagina();
        request.setAttribute("quantidadePagina", quantidadePagina);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tela_listar_produto.jsp?quantidadePagina=" + quantidadePagina + "&numeroPagina=" + numeroPagina);
        requestDispatcher.forward(request, response);
    }
}
