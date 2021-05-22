/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.servlet;

import br.senac.sp.dao.PedidoDAO;
import br.senac.sp.dao.UsuariosDAO;
import br.senac.sp.entidade.Usuario;
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
 * @author PICHAU
 */
public class StatusPedido extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Integer codPedido = Integer.parseInt(request.getParameter("codPedido"));
        char statusPedido = request.getParameter("status" + codPedido).charAt(0);
        try {
            PedidoDAO.statusPedido(codPedido, statusPedido);
            response.sendRedirect("ListarPedidos?numeroPagina=1");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AtivarProduto.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
