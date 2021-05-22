/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Pedido;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PICHAU
 */
public class ListarPedidos extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String numeroPagina = request.getParameter("numeroPagina");
        if (numeroPagina == null) {
            numeroPagina = "1";
        }

        List<Pedido> listaPedidoEstoque = PedidoDAO.listarPedidoEstoque(numeroPagina);

        request.setAttribute("listaPedidoEstoque", listaPedidoEstoque);
        request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
        
        int quantidadePagina = PedidoDAO.quantidadePagina();
        request.setAttribute("quantidadePagina", quantidadePagina);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/estoque/listar-pedido-estoque.jsp?quantidadePagina=" + quantidadePagina + "&numeroPagina=" + numeroPagina);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
