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

import java.text.SimpleDateFormat;
import java.util.Date;

public class PedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String numeroPagina = request.getParameter("numeroPagina");
        if (numeroPagina == null) {
            numeroPagina = "1";
        }

        Integer codCliente = Integer.parseInt(request.getParameter("codCliente"));
        List<Pedido> listaPedido = PedidoDAO.listarPedido(codCliente, numeroPagina);

        request.setAttribute("listarPedido", listaPedido);
        request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
        
        int quantidadePagina = PedidoDAO.quantidadePagina();
        request.setAttribute("quantidadePagina", quantidadePagina);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/cliente/tela-listar-pedido.jsp?quantidadePagina=" + quantidadePagina + "&numeroPagina=" + numeroPagina);
        requestDispatcher.forward(request, response);
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String cepEndereco = request.getParameter("cepCompra");
        String ruaEndereco = request.getParameter("logradouroCompra");
        String bairroEndereco = request.getParameter("bairroCompra");
        String cidadeEndereco = request.getParameter("localidadeCompra");
        String ufEndereco = request.getParameter("ufCompra");
        String numEndereco = request.getParameter("numeroCompra");
        String complementoCompra = request.getParameter("complementoCompra");
        double valorFrete = Double.parseDouble(request.getParameter("frete"));
        String formaPagamento = request.getParameter("formaPagamento");
        String numeroCartaoCompleto = request.getParameter("numeroCartaoCompra");
        String numeroCartaoCompra = numeroCartaoCompleto.substring(12);
        char statusPedido = 'a';
        double valorFinal = Double.parseDouble(request.getParameter("totalCompra"));
        
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        String dataPedido = df.format(date);
        
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
        
        Pedido pedido = new Pedido(cepEndereco,ruaEndereco,bairroEndereco,cidadeEndereco,ufEndereco,numEndereco,complementoCompra,valorFrete,formaPagamento,numeroCartaoCompra,valorFinal,dataPedido,statusPedido,codCliente);
        
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
