package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.dao.UsuariosDAO;
import br.senac.sp.entidade.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarUsuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numeroPagina = request.getParameter("numeroPagina");
        
        List<Usuario> listaUsuarios = UsuariosDAO.listarUsuarios(numeroPagina);

        request.setAttribute("listaUsuarios", listaUsuarios);
        
        request.setAttribute("numeroPagina", (numeroPagina != null ? numeroPagina : 1));
        
        int quantidadePagina = ProdutosDAO.quantidadePagina();
        request.setAttribute("quantidadePagina", quantidadePagina);
        
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/tela_listar_usuario.jsp?quantidadePagina=" + quantidadePagina + "&numeroPagina=" + numeroPagina);
        requestDispatcher.forward(request, response);
    }
}
