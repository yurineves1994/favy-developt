package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AtivarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codProduto = Integer.parseInt(request.getParameter("codProduto"));
        try {
            ProdutosDAO.ativarProduto(codProduto);
            response.sendRedirect("sucesso.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AtivarProduto.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }

}
