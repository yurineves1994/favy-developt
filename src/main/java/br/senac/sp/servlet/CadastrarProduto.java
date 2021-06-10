package br.senac.sp.servlet;

import br.senac.sp.entidade.Produto;
import br.senac.sp.dao.ProdutosDAO;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.util.Base64;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//@MultipartConfig
@MultipartConfig(location = "C:\\favy-developt\\src\\main\\webapp\\img")
public class CadastrarProduto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String nomeProduto = request.getParameter("nome_produto");
        String descricao = request.getParameter("descricao");
        int qtdEstrela = Integer.parseInt(request.getParameter("qtd_estrela"));
        long qtdProduto = Long.parseLong(request.getParameter("qtd_produto"));
        String statusProduto = request.getParameter("status_produto");
        long precoProduto = Long.parseLong(request.getParameter("preco_produto"));
        
        String validador = request.getParameter("nomesImg");
        
        String nomesImagens[] = validador.split(",");
        
        for( String n: nomesImagens ){
            System.out.println(n);
        }
        
        int qtdImagens = Integer.parseInt( request.getParameter("qtdImgs") );
        List<String> imagens = new ArrayList<String>();
        
        System.out.println("\n \n \n ---- TESTES ABAIXO");
        System.out.println( qtdImagens );
        System.out.println("-------------------- \n \n \n");
        
        String CAMINHO = "C:\\favy-developt\\src\\main\\webapp\\img";
        for( String n: nomesImagens ){
            System.out.println(n);
            Part filePart = request.getPart( n ); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix. 
            
            filePart.write(fileName);
                        
            File file = new File( CAMINHO+"/"+fileName );
            
            imagens.add( encodeFileToBase64Binary(file) );
        }
        /*
        for (int i = 1; i <= qtdImagens; i++) { 
            Part filePart = request.getPart("addImg"+i+""); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix. 
            
            filePart.write(fileName);
                        
            File file = new File( CAMINHO+"/"+fileName );
            
            imagens.add( encodeFileToBase64Binary(file) );
            
        }
        */
        
        
        Produto produtos = new Produto(nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagens );
        try {
            ProdutosDAO.addProduto(produtos);
            ProdutosDAO.addImagens(imagens);
            
            response.sendRedirect("ListarProdutos?numeroPagina=1");
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
