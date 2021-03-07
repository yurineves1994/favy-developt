package br.senac.sp.servlet;

import br.senac.sp.entidade.Produto;
import br.senac.sp.dao.ProdutosDAO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.misc.BASE64Decoder;

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
        String encodstring = request.getParameter("imagem_produto");
        File file = new File(getServletContext().getRealPath("/img") + "/" + encodstring);
        String imagemProduto = encodeFileToBase64Binary(file);
        System.out.println(imagemProduto);
        Produto produtos = new Produto(nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto);
        try {
            ProdutosDAO.addProduto(produtos);
            response.sendRedirect("sucesso.jsp");
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
