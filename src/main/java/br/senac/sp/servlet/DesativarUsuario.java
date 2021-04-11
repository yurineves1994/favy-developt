package br.senac.sp.servlet;

import br.senac.sp.dao.UsuariosDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DesativarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codUsuario = Integer.parseInt(request.getParameter("codUsuario"));
        try {
            UsuariosDAO.desativarUsuario(codUsuario);
            response.sendRedirect("ListarUsuarios?numeroPagina=1");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DesativarProduto.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
