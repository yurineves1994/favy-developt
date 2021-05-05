package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PICHAU
 */
public class CarrinhoProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        String codProduto = request.getParameter("codProduto");
        Produto produto = ProdutosDAO.obterProduto(Integer.parseInt(codProduto));

        double totalCompra = 0;
        double subTotal = produto.getPrecoProduto();

        List<Produto> listaProdutos;
        if (sessao.getAttribute("listaProdutos") == null) {
            listaProdutos = new ArrayList<>();
        } else {
            listaProdutos = (List<Produto>) sessao.getAttribute("listaProdutos");
        }       

        if (sessao.getAttribute("totalCompra") == null) {
            totalCompra = subTotal;
        } else {
            totalCompra = (double) sessao.getAttribute("totalCompra");
            totalCompra += subTotal;
        }

        if (!listaProdutos.contains(produto)) {
            listaProdutos.add(produto);
        }
        sessao.setAttribute("listaProdutos", listaProdutos);
        sessao.setAttribute("totalCompra", totalCompra);
    }
}
