package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.entidade.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cepEndereco = request.getParameter("cepCompra");
        String ruaEndereco = request.getParameter("logradouroCompra");
        String bairroEndereco = request.getParameter("bairroCompra");
        String cidadeEndereco = request.getParameter("localidadeCompra");
        String ufEndereco = request.getParameter("ufCompra");
        String numEndereco = request.getParameter("numeroCompra");
        String complementoCompra = request.getParameter("complementoCompra");
        double valorFrete = 2;
        String formaPagamento = request.getParameter("formaPagamento");
        char statusPedido = 'a';
        double valorFinal = Double.parseDouble(request.getParameter("totalCompra"));
        String dataPedido = "2000/01/01";
        int codCliente = Integer.parseInt(request.getParameter("codCliente"));
        
        Pedido pedido = new Pedido(cepEndereco,ruaEndereco,bairroEndereco,cidadeEndereco,ufEndereco,numEndereco,complementoCompra,valorFrete,formaPagamento,valorFinal,dataPedido,statusPedido,codCliente);
        
        try {
            PedidoDAO.addPedido(pedido);
            response.sendRedirect("compra_finalizada.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }

    
}
