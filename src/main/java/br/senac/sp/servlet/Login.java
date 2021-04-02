package br.senac.sp.servlet;

import br.senac.sp.dao.UsuariosDAO;
import br.senac.sp.entidade.Usuario;
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
public class Login extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailUsuario = request.getParameter("email_user");
        String senhaUsuario = request.getParameter("senha_user");

        Usuario usuario = UsuariosDAO.getAcesso(emailUsuario);
        if (usuario == null || !usuario.validarSenha(senhaUsuario)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?erro=UserNotFound");
        } else {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("email_user", usuario);
            response.sendRedirect(request.getContextPath() + "/tela_listar_produto.jsp");
        }

    }

}
