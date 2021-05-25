package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Pedido;
import br.senac.sp.entidade.Produto;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PesquisarStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        char statusPesquisa = request.getParameter("status_pesquisa").charAt(0);
        List<Pedido> listaPedidoEstoque = PedidoDAO.filtraStatus(statusPesquisa);

        request.setAttribute("listaPedidoEstoque", listaPedidoEstoque);
        String numeroPagina = "1";
        if (numeroPagina == null) {
            numeroPagina = "1";
        }

        request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
        
        int quantidadePagina = PedidoDAO.quantidadePagina();
        request.setAttribute("quantidadePagina", quantidadePagina);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/estoque/listar-pedido-estoque.jsp?quantidadePagina=" + quantidadePagina + "&numeroPagina=" + numeroPagina);
        requestDispatcher.forward(request, response);
    }
}
