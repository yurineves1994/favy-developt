package br.senac.sp.servlet;

import br.senac.sp.dao.ClienteDAO;
import br.senac.sp.entidade.Cliente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PICHAU
 */
public class LoginCliente extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email_cli");
        String senha = request.getParameter("senha_cli");

        Cliente cliente = ClienteDAO.getAcesso(email);
        if (cliente == null || !cliente.validarSenha(senha)) {
            response.sendRedirect(request.getContextPath() + "/login_cliente.jsp?erro=UserNotFound");
        } else {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("email_cli", cliente);
            response.sendRedirect(request.getContextPath() + "/protected/cliente/tela-editar-cliente.jsp");
        }

    }

}
