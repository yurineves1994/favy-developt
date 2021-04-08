package br.senac.sp.dao;

import br.senac.sp.db.ConexaoDB;
import br.senac.sp.entidade.Produto;
import br.senac.sp.servlet.ServletBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProdutosDAO {

    public static List<Produto> listarProdutosCards() {
       List<Produto> listaProdutos = new ArrayList();
       try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from produtos";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codProduto = rs.getInt("cod_produto");
                String nomeProduto = rs.getString("nome_produto");
                String descricao = rs.getString("descricao");
                String statusProduto = rs.getString("status_produto");
                long precoProduto = rs.getLong("preco_produto");
                long qtdProduto = rs.getLong("qtd_produto");
                int qtdEstrela = rs.getInt("qtd_estrela");
                String imagemProduto1 = rs.getString("imagem_produto_1");
                String imagemProduto2 = rs.getString("imagem_produto_2");
                String imagemProduto3 = rs.getString("imagem_produto_3");
                String imagemProduto4 = rs.getString("imagem_produto_4");
                listaProdutos.add(new Produto(codProduto, nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto1, imagemProduto2, imagemProduto3, imagemProduto4));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaProdutos;
    }
    
    public static int quantidadePagina(){
      int quantidadePagina = 1;
      double totalPessoaPorPagina = 10.0;
      try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select count(1) as totalProduto from produtos";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
              double totalProdutos = rs.getDouble("totalProduto");
              if(totalProdutos > totalPessoaPorPagina){                 
                  double quantidadePessoaPorPaginaTemp = Float.parseFloat("" + (totalProdutos / totalPessoaPorPagina));
                  
                  if(!(quantidadePessoaPorPaginaTemp % 2 == 0)){
                      quantidadePagina = new Double(quantidadePessoaPorPaginaTemp).intValue() + 1;
                  } else {
                      quantidadePagina = new Double(quantidadePessoaPorPaginaTemp).intValue();
                  }
              } else {
                  quantidadePagina = 1;
              }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return quantidadePagina;
    }
    
    public static List<Produto> listarProdutos(String numeroPagina) {
        List<Produto> listaProdutos = new ArrayList();
        int totalPorPagina = 10;

        int offset = (Integer.parseInt(numeroPagina) * totalPorPagina) - totalPorPagina;

        if (offset < 0) {
            offset = 0;
        }

        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from produtos limit " + totalPorPagina + " offset " + offset + ";";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codProduto = rs.getInt("cod_produto");
                String nomeProduto = rs.getString("nome_produto");
                String descricao = rs.getString("descricao");
                String statusProduto = rs.getString("status_produto");
                long precoProduto = rs.getLong("preco_produto");
                long qtdProduto = rs.getLong("qtd_produto");
                int qtdEstrela = rs.getInt("qtd_estrela");
                String imagemProduto1 = rs.getString("imagem_produto_1");
                String imagemProduto2 = rs.getString("imagem_produto_2");
                String imagemProduto3 = rs.getString("imagem_produto_3");
                String imagemProduto4 = rs.getString("imagem_produto_4");
                listaProdutos.add(new Produto(codProduto, nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto1, imagemProduto2, imagemProduto3, imagemProduto4));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaProdutos;
    }
    
     public static List<Produto> PesquisarProduto(String nomePesquisa) {
        List<Produto> listaPesquisaProduto = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from produtos where nome_produto like '%" + nomePesquisa + "%'";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codProduto = rs.getInt("cod_produto");
                String nomeProduto = rs.getString("nome_produto");
                String descricao = rs.getString("descricao");
                String statusProduto = rs.getString("status_produto");
                long precoProduto = rs.getLong("preco_produto");
                long qtdProduto = rs.getLong("qtd_produto");
                int qtdEstrela = rs.getInt("qtd_estrela");
                String imagemProduto1 = rs.getString("imagem_produto_1");
                String imagemProduto2 = rs.getString("imagem_produto_2");
                String imagemProduto3 = rs.getString("imagem_produto_3");
                String imagemProduto4 = rs.getString("imagem_produto_4");
                listaPesquisaProduto.add(new Produto(codProduto, nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto1, imagemProduto2, imagemProduto3, imagemProduto4));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaPesquisaProduto;
    }

    public static void addProduto(Produto produtos) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.obterConexao();
        String query = "insert into produtos(nome_produto, descricao, status_produto, preco_produto, qtd_produto, qtd_estrela, imagem_produto_1, imagem_produto_2, imagem_produto_3, imagem_produto_4) values (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, produtos.getNomeProduto());
        ps.setString(2, produtos.getDescricao());
        ps.setString(3, produtos.getStatusProduto());
        ps.setLong(4, produtos.getPrecoProduto());
        ps.setLong(5, produtos.getQtdProduto());
        ps.setInt(6, produtos.getQtdEstrela());
        ps.setString(7, produtos.getImagemProduto1());
        ps.setString(8, produtos.getImagemProduto2());
        ps.setString(9, produtos.getImagemProduto3());
        ps.setString(10, produtos.getImagemProduto4());
        ps.execute();
        ps.close();
    }
    
     public static void updateProduto(Produto produtos) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update produtos set nome_produto=?, descricao=?, status_produto=?, preco_produto=?, qtd_produto=?, qtd_estrela=?, imagem_produto_1=?, imagem_produto_2=?, imagem_produto_3=?, imagem_produto_4=? where cod_produto=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, produtos.getNomeProduto());
        ps.setString(2, produtos.getDescricao());
        ps.setString(3, produtos.getStatusProduto());
        ps.setLong(4, produtos.getPrecoProduto());
        ps.setLong(5, produtos.getQtdProduto());
        ps.setInt(6, produtos.getQtdEstrela());
        ps.setString(7, produtos.getImagemProduto1());
        ps.setString(8, produtos.getImagemProduto2());
        ps.setString(9, produtos.getImagemProduto3());
        ps.setString(10, produtos.getImagemProduto4());
        ps.setInt(11, produtos.getCodProduto());
        ps.execute();
        ps.close();
    }

    public static void ativarProduto(Integer codProduto) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update produtos set status_produto='a' where cod_produto=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, codProduto);
        ps.execute();
        ps.close();
    }
    
    public static void desativarProduto(Integer codProduto) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update produtos set status_produto='i' where cod_produto=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, codProduto);
        ps.execute();
        ps.close();
    }

    public static Produto obterProduto(Integer codProduto) {
        Produto produto = null;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from produtos where cod_produto=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codProduto);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomeProduto = rs.getString("nome_produto");
                String descricao = rs.getString("descricao");
                String statusProduto = rs.getString("status_produto");
                long precoProduto = rs.getLong("preco_produto");
                long qtdProduto = rs.getLong("qtd_produto");
                int qtdEstrela = rs.getInt("qtd_estrela");
                String imagemProduto1 = rs.getString("imagem_produto_1");
                String imagemProduto2 = rs.getString("imagem_produto_2");
                String imagemProduto3 = rs.getString("imagem_produto_3");
                String imagemProduto4 = rs.getString("imagem_produto_4");
                produto = new Produto(codProduto, nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto1, imagemProduto2, imagemProduto3, imagemProduto4);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return produto;
    }
}
