package br.senac.sp.servlet;

import br.senac.sp.dao.ClienteDAO;
import br.senac.sp.entidade.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codCliente = Integer.parseInt(request.getParameter("codCliente"));
        Cliente cliente = ClienteDAO.obterCliente(codCliente);

        request.setAttribute("cliente", cliente);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/cliente/tela-editar-cliente.jsp");
        requestDispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codCliente = Integer.parseInt(request.getParameter("cod_cliente"));
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha1");

        Cliente cliente = ClienteDAO.obterCliente(codCliente);
        cliente.setNomeCliente(nome);
        cliente.setCpfCliente(cpf);
        cliente.setEmailCliente(email);
        cliente.setSenhaCliente(senha);
        
        try {
            ClienteDAO.updateCliente(cliente);
            response.sendRedirect("cards-produtos.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
