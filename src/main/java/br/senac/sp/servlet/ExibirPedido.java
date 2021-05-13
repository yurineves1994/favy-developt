package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.entidade.Pedido;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PICHAU
 */
public class ExibirPedido extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido pedido = PedidoDAO.exibirPedido();

        request.setAttribute("pedido", pedido);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/compra_finalizada.jsp");
        requestDispatcher.forward(request, response);

    }
}
