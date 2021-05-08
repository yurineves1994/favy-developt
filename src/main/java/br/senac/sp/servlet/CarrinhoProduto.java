package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Produto;
import java.io.IOException;
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
        String codAndAction = request.getParameter("codProduto");
        String values[] = codAndAction.split(" ");
        
        // Variáveis de controle
        int codProduto = 0;
        String action = "";
        if( values.length == 1 ){
            action = "add";
            codProduto = Integer.parseInt(values[0]);
        } else {
            action = "remove";
            codProduto = Integer.parseInt(values[0]);
        }                
        
        Produto produto = ProdutosDAO.obterProduto(codProduto);

        double totalCompra = 0;
        double subTotal = produto.getPrecoProduto();
        int qntProduto = 0;
        
        List<Produto> listaProdutos;
        if (sessao.getAttribute("listaProdutos") == null) {
            listaProdutos = new ArrayList<>();
        } else {
            listaProdutos = (List<Produto>) sessao.getAttribute("listaProdutos");
        }
        
        if( action.equals("add") && produto.getQntCarrinho() < produto.getQtdProduto() ){
            if (sessao.getAttribute("totalCompra") == null) {
                totalCompra = subTotal;
            } else {
                totalCompra = (double) sessao.getAttribute("totalCompra");                
                totalCompra += subTotal;
            }
            
        } else if( action.equals("remove") ){
            if (sessao.getAttribute("totalCompra") == null) {
                totalCompra = subTotal;
            } else {
                //produto.setQntCarrinho( produto.getQntCarrinho()-1 );
                totalCompra = (double) sessao.getAttribute("totalCompra");
                totalCompra -= subTotal;
            }  
        }
                
        
        boolean jaExiste = false;
        for (Produto prod : listaProdutos) {
            
            if( prod.getCodProduto() == codProduto && action.equals("add")){
                jaExiste = true;
                
                if( prod.getQntCarrinho() < prod.getQtdProduto() ){
                    prod.setQntCarrinho(prod.getQntCarrinho() + 1);
                    break;
                } else if(prod.getQntCarrinho() >= prod.getQtdProduto()){
                    totalCompra -= subTotal;
                    break;
                }
                
                
            } else if( prod.getCodProduto() == codProduto && action.equals("remove") ){
                jaExiste = true;
                
                prod.setQntCarrinho(prod.getQntCarrinho() - 1);
                if(prod.getQntCarrinho() == 0){
                    listaProdutos.remove(prod);
                }
                break;
                
                
            }
        }         
        
        if (!jaExiste) {
            listaProdutos.add(produto);
        }
        sessao.setAttribute("listaProdutos", listaProdutos);
        sessao.setAttribute("totalCompra", totalCompra);
        sessao.setAttribute("qntProduto", qntProduto);

    }
}
