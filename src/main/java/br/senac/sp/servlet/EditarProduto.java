package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Produto;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yurin
 */
public class EditarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codProduto = Integer.parseInt(request.getParameter("codProduto"));
        Produto produto = ProdutosDAO.obterProduto(codProduto);

        request.setAttribute("produto", produto);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/estoque/tela-editar-produto.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer codProduto = Integer.parseInt(request.getParameter("cod_produto"));
        String nomeProduto = request.getParameter("nome_produto");
        String descricao = request.getParameter("descricao");
        int qtdEstrela = Integer.parseInt(request.getParameter("qtd_estrela"));
        long qtdProduto = Long.parseLong(request.getParameter("qtd_produto"));
        String statusProduto = request.getParameter("status_produto");
        long precoProduto = Long.parseLong(request.getParameter("preco_produto"));
        String encodstring1 = request.getParameter("imagem_produto_1");
        File file1 = new File(getServletContext().getRealPath("/img") + "/" + encodstring1);
        String imagemProduto1 = encodeFileToBase64Binary(file1);
        String encodstring2 = request.getParameter("imagem_produto_2");
        File file2 = new File(getServletContext().getRealPath("/img") + "/" + encodstring2);
        String imagemProduto2 = encodeFileToBase64Binary(file2);
        String encodstring3 = request.getParameter("imagem_produto_3");
        File file3 = new File(getServletContext().getRealPath("/img") + "/" + encodstring3);
        String imagemProduto3 = encodeFileToBase64Binary(file3);
        String encodstring4 = request.getParameter("imagem_produto_4");
        File file4 = new File(getServletContext().getRealPath("/img") + "/" + encodstring4);
        String imagemProduto4 = encodeFileToBase64Binary(file4);

        Produto produto = ProdutosDAO.obterProduto(codProduto);
        produto.setNomeProduto(nomeProduto);
        produto.setDescricao(descricao);
        produto.setQtdEstrela(qtdEstrela);
        produto.setQtdProduto(qtdProduto);
        produto.setStatusProduto(statusProduto);
        produto.setPrecoProduto(precoProduto);
        produto.setImagemProduto1(imagemProduto1);
        produto.setImagemProduto2(imagemProduto2);
        produto.setImagemProduto3(imagemProduto3);
        produto.setImagemProduto4(imagemProduto4);

        try {
            ProdutosDAO.updateProduto(produto);
            response.sendRedirect("ListarProdutos");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }

    private static String encodeFileToBase64Binary(File file) {
        String encodedfile = null;
        try {
            FileInputStream fileInputStreamReader = new FileInputStream(file);
            byte[] bytes = new byte[(int) file.length()];
            fileInputStreamReader.read(bytes);
            encodedfile = Base64.getEncoder().encodeToString(bytes);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return encodedfile;
    }

}
