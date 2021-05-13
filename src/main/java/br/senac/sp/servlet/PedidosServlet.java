package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.entidade.ItemVenda;
import br.senac.sp.entidade.Pedido;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Pedido> listaPedido = PedidoDAO.listarPedido();

        request.setAttribute("listarPedido", listaPedido);
        
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/compra_finalizada.jsp");
        requestDispatcher.forward(request, response);
    
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
        String dataPedido = "2021/05/13";
        int codCliente = Integer.parseInt(request.getParameter("codCliente"));
        
        ArrayList<ItemVenda> listaItens = new ArrayList<ItemVenda>();
        
        int qntProduto = Integer.parseInt(request.getParameter("qntProduto"));
        double totalProduto;
        for (int i = 1; i <= qntProduto - 1; i++) {
            int qntItem = Integer.parseInt(request.getParameter("qnt" + i));
            String nomeItem = request.getParameter("nome" + i);
            double precoItem = Double.parseDouble(request.getParameter("preco" + i));
            totalProduto = precoItem * qntItem;
            listaItens.add(new ItemVenda(nomeItem, qntItem, precoItem, totalProduto));
        }
        
        Pedido pedido = new Pedido(cepEndereco,ruaEndereco,bairroEndereco,cidadeEndereco,ufEndereco,numEndereco,complementoCompra,valorFrete,formaPagamento,valorFinal,dataPedido,statusPedido,codCliente);
        
        try {
            PedidoDAO.addPedido(pedido);
            PedidoDAO.addItemVenda(listaItens);
            response.sendRedirect("ExibirPedido");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }

    
}
