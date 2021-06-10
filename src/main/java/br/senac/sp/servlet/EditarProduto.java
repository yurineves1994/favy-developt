package br.senac.sp.servlet;

import br.senac.sp.dao.ProdutosDAO;
import br.senac.sp.entidade.Produto;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author yurin
 */
@MultipartConfig(location = "C:\\favy-developt\\src\\main\\webapp\\img")
public class EditarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Integer codProduto = Integer.parseInt(request.getParameter("codProduto"));
        Produto produto = ProdutosDAO.obterProduto(codProduto);

        request.setAttribute("produto", produto);

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/estoque/tela-editar-produto.jsp");
        requestDispatcher.forward(request, response);
    }

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
        
        System.out.println("-------------------------------");
        for( String n: nomesImagens ){
            System.out.println(n);
        }
        
        List<String> imagens = new ArrayList<String>();
        String CAMINHO = "C:\\favy-developt\\src\\main\\webapp\\img";
        for( String n: nomesImagens ){
            System.out.println(n);
            Part filePart = request.getPart( n ); // Retrieves <input type="file" name="file">
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix. 
            
            
            System.out.println("asdasdasdasdasdasdasd");
            System.out.println( "------------ "+fileName );
            if( !"".equals(fileName) && fileName != null ){
                filePart.write(fileName);
            }
                        
            File file = new File( CAMINHO+"/"+fileName );
            
            imagens.add( encodeFileToBase64Binary(file) );
        }
        
        Integer codProduto = Integer.parseInt(request.getParameter("cod_produto"));
        
        Produto produto = ProdutosDAO.obterProduto(codProduto);
        produto.setNomeProduto(nomeProduto);
        produto.setDescricao(descricao);
        produto.setQtdEstrela(qtdEstrela);
        produto.setQtdProduto(qtdProduto);
        produto.setStatusProduto(statusProduto);
        produto.setPrecoProduto(precoProduto);
        produto.setImagemProduto(imagens);
        
        try {
            ProdutosDAO.updateProduto( produto );
            ProdutosDAO.deletarImagens( codProduto );
            ProdutosDAO.cadastrarImagens( codProduto, imagens );
            
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
