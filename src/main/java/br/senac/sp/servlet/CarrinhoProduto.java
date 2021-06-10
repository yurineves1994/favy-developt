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
    
    // FUNÇÂO PARA ADICIONAR PRODUTO
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
    // FUNÇÂO PARA REMOVER PRODUTO
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
    // FUNÇÂO PARA CALCULAR FRETE
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
        // cria sessão
        HttpSession sessao = request.getSession();
        // pega o codigo ação e o codigo produto
        String codAndAction = request.getParameter("codProduto");
        // separa o cod produto do codigo ação
        String values[] = codAndAction.split(" ");

        // Variáveis de controle
        int codProduto = Integer.parseInt(values[0]);
        int acao = Integer.parseInt(values[1]);
        
        
        Produto produto = ProdutosDAO.obterProduto(codProduto);

        double subTotal = produto.getPrecoProduto();
        double totalCompra = 0;
        
        int qntProduto = 0;
        
        // CRIA UMA LISTA DE COMPRA  e SOMA O VALOR TOTAL DA COMPRA
        List<Produto> listaProdutos;
        if (sessao.getAttribute("listaProdutos") == null) {
            listaProdutos = new ArrayList<>();
        } else {
            listaProdutos = (List<Produto>) sessao.getAttribute("listaProdutos");
        }
        if (sessao.getAttribute("totalCompra") == null) {
            
        } else {
            totalCompra = (double) sessao.getAttribute("totalCompra");
        }
                
        switch(acao){
            // CASO 01 - REMOVE PRODUTO
            case 1:
                totalCompra = removerProduto(listaProdutos, codProduto, subTotal, totalCompra);
            break;
            // CASO 02 - ADICIONA PRODUTO
            case 2:
                totalCompra = adicionarProduto(listaProdutos, codProduto, produto, subTotal, totalCompra);
            break;
            // CASO 03 - CALCULAR FRETE COMPRA
            case 3:
                int frete = calcularFrete();
                sessao.setAttribute("frete", frete);
            return;
            // CASO 04 - LIMPAR CARRINHO
            case 4:
                totalCompra = 0; 
                listaProdutos = new ArrayList<>();
            break;
        }
        sessao.setAttribute("listaProdutos", listaProdutos);
        sessao.setAttribute("totalCompra", totalCompra);
        sessao.setAttribute("qntProduto", qntProduto);
        return;
    }
}
