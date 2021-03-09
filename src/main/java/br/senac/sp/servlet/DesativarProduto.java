package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yurin
 */
public class DesativarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codProduto = Integer.parseInt(request.getParameter("codProduto"));
        try {
            ProdutosDAO.desativarProduto(codProduto);
            response.sendRedirect("ListarProdutos");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DesativarProduto.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }

}
