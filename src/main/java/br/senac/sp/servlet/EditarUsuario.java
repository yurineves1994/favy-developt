package br.senac.sp.servlet;

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

public class EditarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codUsuario = Integer.parseInt(request.getParameter("codUsuario"));
        Usuario usuario = UsuariosDAO.obterUsuario(codUsuario);

        request.setAttribute("usuario", usuario);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/tela-editar-usuario.jsp");
        requestDispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codUsuario = Integer.parseInt(request.getParameter("cod_usuario"));
        String nome = request.getParameter("nome");
        String status = request.getParameter("status");
        String cargo = request.getParameter("cargo");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        /* 1 = Estoquista  /  2 = Admistrador */
        int carg = cargo.equals("Estoquista")? 2 : 1;

        Usuario usuario = UsuariosDAO.obterUsuario(codUsuario);
        usuario.setNomeUsuario(nome);
        usuario.setStatusUsuario(status);
        usuario.setCargo(carg);
        usuario.setEmailUsuario(email);
        usuario.setSenhaUsuario(senha);
        
        try {
            UsuariosDAO.updateUsuario(usuario);
            response.sendRedirect("ListarUsuarios?numeroPagina=1");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
