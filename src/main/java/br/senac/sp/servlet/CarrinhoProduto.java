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
    
    
    public static double adicionarProduto(List<Produto> produtos, int id, Produto produto, double subTotal, double totalCompra){
        totalCompra += subTotal;
        boolean jaExiste = false;

        for (Produto prod : produtos) {

            if (prod.getCodProduto() == id){
                jaExiste = true;
                if (prod.getQntCarrinho() < prod.getQtdProduto()) {
                    prod.setQntCarrinho(prod.getQntCarrinho() + 1);
                    break;
                } else if (prod.getQntCarrinho() >= prod.getQtdProduto()) {
                    totalCompra -= subTotal;
                    break;
                }
            }
        }
        if (!jaExiste) {
            produtos.add(produto);
        }
        return totalCompra;
    }
    
    public static double removerProduto(List<Produto> produtos, int id, double subTotal, double totalCompra){

        totalCompra -= subTotal;

        for (Produto prod : produtos) {

            if (prod.getCodProduto() == id){
                prod.setQntCarrinho(prod.getQntCarrinho() - 1);
                if (prod.getQntCarrinho() == 0) {
                    produtos.remove(prod);
                }
            }
        }
        
        return totalCompra;
    }
    
    public static int calcularFrete(){
        int random;
        do {
            random = 1 + (int) (Math.random() * 50);
        } while (random < 5);

        return random;
    }
    
    public static void limparCarrinho(){
    
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        String codAndAction = request.getParameter("codProduto");
        String values[] = codAndAction.split(" ");

        // Variáveis de controle
        int codProduto = Integer.parseInt(values[0]);
        int acao = Integer.parseInt(values[1]);
        
        
        Produto produto = ProdutosDAO.obterProduto(codProduto);

        double subTotal = produto.getPrecoProduto();
        double totalCompra;
        
        int qntProduto = 0;
        
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
        }
                
        switch(acao){
            case 1:
                totalCompra = removerProduto(listaProdutos, codProduto, subTotal, totalCompra);
            break;
            case 2:
                totalCompra = adicionarProduto(listaProdutos, codProduto, produto, subTotal, totalCompra);
            break;
            case 3:
                int frete = calcularFrete();
                sessao.setAttribute("frete", frete);
            return;
            case 4:
                totalCompra = 0; 
                listaProdutos = new ArrayList<>();
                //limparCarrinho();
            break;
        }
        sessao.setAttribute("listaProdutos", listaProdutos);
        sessao.setAttribute("totalCompra", totalCompra);
        sessao.setAttribute("qntProduto", qntProduto);
        return;
        
        /*
        if (validaFrete == 2) {
            action = "add";
            codProduto = Integer.parseInt(values[0]);
        } else if (validaFrete == 1) {
            action = "remove";
            codProduto = Integer.parseInt(values[0]);
        }

        frete = 0;
        if (validaFrete == 3) {  
            do {
                int random = 1 + (int) (Math.random() * 50);
                frete = random;
            } while (frete < 5);
            sessao.setAttribute("frete", frete);
            return;
        }
        subTotal = produto.getPrecoProduto();

        if (action.equals("add") && produto.getQntCarrinho() < produto.getQtdProduto()) {
            if (sessao.getAttribute("totalCompra") == null) {
                totalCompra = subTotal;
            } else {
                totalCompra = (double) sessao.getAttribute("totalCompra");
                totalCompra += subTotal;
            }

        } else if (action.equals("remove")) {
            if (sessao.getAttribute("totalCompra") == null) {
                totalCompra = subTotal;
            } else {
                //produto.setQntCarrinho( produto.getQntCarrinho()-1 );
                totalCompra = (double) sessao.getAttribute("totalCompra");
                totalCompra -= subTotal;
            }
        }

        boolean jaExiste = false;
        if (action.equals("remove") || action.equals("add")) {
            for (Produto prod : listaProdutos) {

                if (prod.getCodProduto() == codProduto && action.equals("add")) {
                    jaExiste = true;

                    if (prod.getQntCarrinho() < prod.getQtdProduto()) {
                        prod.setQntCarrinho(prod.getQntCarrinho() + 1);
                        break;
                    } else if (prod.getQntCarrinho() >= prod.getQtdProduto()) {
                        totalCompra -= subTotal;
                        break;
                    }

                } else if (prod.getCodProduto() == codProduto && action.equals("remove")) {
                    jaExiste = true;

                    prod.setQntCarrinho(prod.getQntCarrinho() - 1);
                    if (prod.getQntCarrinho() == 0) {
                        listaProdutos.remove(prod);
                    }
                    break;

                }
            }
        }

        if (!jaExiste) {
            listaProdutos.add(produto);
        }
        sessao.setAttribute("listaProdutos", listaProdutos);
        sessao.setAttribute("totalCompra", totalCompra);
        sessao.setAttribute("qntProduto", qntProduto);
        */
    }
}
