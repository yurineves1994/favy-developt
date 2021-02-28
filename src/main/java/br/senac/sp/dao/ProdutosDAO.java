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

    public static List<Produto> listarProdutos() {
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
                String imagemProduto = rs.getString("imagem_produto");
                listaProdutos.add(new Produto(codProduto, nomeProduto, descricao, statusProduto, precoProduto, qtdProduto, qtdEstrela, imagemProduto));
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

    public static void addProduto(Produto produtos) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.obterConexao();
        String query = "insert into produtos(nome_produto, descricao, status_produto, preco_produto, qtd_produto, qtd_estrela, imagem_produto) values (?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, produtos.getNomeProduto());
        ps.setString(2, produtos.getDescricao());
        ps.setString(3, produtos.getStatusProduto());
        ps.setLong(4, produtos.getPrecoProduto());
        ps.setLong(5, produtos.getQtdProduto());
        ps.setInt(6, produtos.getQtdEstrela());
        ps.setString(7, produtos.getImagemProduto());
        ps.execute();
    }
}
