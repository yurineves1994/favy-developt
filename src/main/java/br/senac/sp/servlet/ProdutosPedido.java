package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.entidade.ItemVenda;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProdutosPedido extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Integer codPedido = Integer.parseInt(request.getParameter("codPedido"));
        List<ItemVenda> listarProdutosPedido = PedidoDAO.listarProdutosPedido(codPedido);

        request.setAttribute("listarProdutosPedido", listarProdutosPedido);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/cliente/pedidosCompra.jsp");
        requestDispatcher.forward(request, response);
    }

}
