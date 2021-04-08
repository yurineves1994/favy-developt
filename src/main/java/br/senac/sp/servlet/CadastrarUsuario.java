package br.senac.sp.servlet;

import br.senac.sp.dao.UsuariosDAO;
import br.senac.sp.entidade.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String status = request.getParameter("status");
        String cargo = request.getParameter("cargo");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        /* 1 = Estoquista  /  2 = Admistrador */
        int carg = cargo.equals("Estoquista") ? 2 : 1;

        Usuario user = new Usuario(nome, email, status, senha, carg);

        try {
            UsuariosDAO.addUsuario(user);
            response.sendRedirect("ListarUsuarios?numeroPagina=1");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }

    }

}
