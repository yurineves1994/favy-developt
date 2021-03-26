package br.senac.sp.servlet;

import br.senac.sp.entidade.Produto;
import br.senac.sp.dao.ProdutosDAO;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Base64;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@MultipartConfig
public class CadastrarProduto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        
        System.out.println("----------"+encodstring1 );
        System.out.println("----------"+ imagemProduto1 );

        
        Produto produtos = new Produto(nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto1, imagemProduto2, imagemProduto3, imagemProduto4);
        try {
            ProdutosDAO.addProduto(produtos);
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
