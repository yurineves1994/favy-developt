package br.senac.sp.dao;

import br.senac.sp.db.ConexaoDB;
import br.senac.sp.entidade.ItemVenda;
import br.senac.sp.entidade.Pedido;
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

public class PedidoDAO {
    
    public static void addPedido(Pedido pedidos) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.obterConexao();
        String query = "insert into pedidos(cep_end, rua_end, bairro_end, cidade_end, estado_end, numero_end, compl_end, valor_frete, forma_pagamento, numero_cartao, valor_final, data_pedido, status_pedido, cod_cliente) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, pedidos.getCepEndereco());
        ps.setString(2, pedidos.getRuaEndereco());
        ps.setString(3, pedidos.getBairroEndereco());
        ps.setString(4, pedidos.getCidadeEndereco());
        ps.setString(5, pedidos.getUfEndereco());
        ps.setString(6, pedidos.getNumEndereco());
        ps.setString(7, pedidos.getComplEndereco());
        ps.setDouble(8, pedidos.getValorFrete());
        ps.setString(9, pedidos.getFormaPagamento());
        ps.setString(10, pedidos.getNumeroCartaoCompra());
        ps.setDouble(11, pedidos.getValorFinal());
        ps.setString(12, pedidos.getDataPedido());
        ps.setString(13, String.valueOf(pedidos.getStatusPedido()));
        ps.setInt(14, pedidos.getCodCliente());
        ps.execute();
        ps.close();
    }
        
    public static List<Pedido> filtraStatus(char statusPesquisa) {
        List<Pedido> listaPesquisaProduto = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from pedidos where status_pedido = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, String.valueOf(statusPesquisa));  
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompra = rs.getInt("cod_pedido");
                String cepCompra = rs.getString("cep_end");
                String logradouroCompra = rs.getString("rua_end");
                String bairroCompra = rs.getString("bairro_end");
                String localidadeCompra = rs.getString("cidade_end");
                String ufCompra = rs.getString("estado_end");
                String numeroCompra = rs.getString("numero_end");
                String complementoCompra = rs.getString("compl_end");
                double valorFrete = rs.getDouble("valor_frete");
                String formaPagamento = rs.getString("forma_pagamento");
                String numeroCartao = rs.getString("numero_cartao");
                double totalCompra = rs.getDouble("valor_final");
                String dataPedido = rs.getString("data_pedido") ;      
                char statusPedido = rs.getString("status_pedido").charAt(0);
                int codCliente = rs.getInt("cod_cliente");
                listaPesquisaProduto.add(new Pedido(idCompra,cepCompra, logradouroCompra, bairroCompra, localidadeCompra, ufCompra, numeroCompra, complementoCompra, valorFrete, formaPagamento, numeroCartao, totalCompra, dataPedido, statusPedido, codCliente));
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
    
    public static void addItemVenda(ArrayList<ItemVenda> itens) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.obterConexao();
        
        String queryCod = "select max(cod_pedido) as cod_pedido from pedidos";
        PreparedStatement ps = con.prepareStatement(queryCod);
        ResultSet rs = ps.executeQuery();
        rs.next();
        Integer codProduto = rs.getInt("cod_pedido");
        
        for (ItemVenda itensLista : itens) {
            String query = "insert into itens_venda(nome_item, qtd_item, preco_unit, preco_total, cod_pedido) values (?,?,?,?,?)";
            PreparedStatement psItem = con.prepareStatement(query);
            psItem.setString(1, itensLista.getNomeItem());
            psItem.setInt(2, itensLista.getQtdItem());
            psItem.setDouble(3, itensLista.getPrecoUnitario());
            psItem.setDouble(4, itensLista.getPrecoTotal());
            psItem.setInt(5, codProduto);
            psItem.execute();
            psItem.close();
        }
    }
    
    public static void statusPedido(Integer codPedido, char status) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update pedidos set status_pedido=? where cod_pedido=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, String.valueOf(status));
        ps.setInt(2, codPedido);
        ps.execute();
        ps.close();
    }
    
    public static int quantidadePagina(){
      int quantidadePagina = 1;
      double totalPessoaPorPagina = 10.0;
      try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select count(1) as totalPedido from pedidos";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
              double totalPedidos = rs.getDouble("totalPedido");
              if(totalPedidos > totalPessoaPorPagina){                 
                  double quantidadePessoaPorPaginaTemp = Float.parseFloat("" + (totalPedidos / totalPessoaPorPagina));
                  
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
    
    public static List<Pedido> listarPedido(Integer codClient){
        List<Pedido> listarPedido = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from pedidos where cod_cliente = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codClient);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompra = rs.getInt("cod_pedido");
                String cepCompra = rs.getString("cep_end");
                String logradouroCompra = rs.getString("rua_end");
                String bairroCompra = rs.getString("bairro_end");
                String localidadeCompra = rs.getString("cidade_end");
                String ufCompra = rs.getString("estado_end");
                String numeroCompra = rs.getString("numero_end");
                String complementoCompra = rs.getString("compl_end");
                double valorFrete = rs.getDouble("valor_frete");
                String formaPagamento = rs.getString("forma_pagamento");
                String numeroCartao = rs.getString("numero_cartao");
                double totalCompra = rs.getDouble("valor_final");
                String dataPedido = rs.getString("data_pedido") ;      
                char statusPedido = rs.getString("status_pedido").charAt(0);
                int codCliente = rs.getInt("cod_cliente");
                listarPedido.add(new Pedido(idCompra,cepCompra, logradouroCompra, bairroCompra, localidadeCompra, ufCompra, numeroCompra, complementoCompra, valorFrete, formaPagamento, numeroCartao, totalCompra, dataPedido, statusPedido, codCliente));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listarPedido;
    }
    
    
    public static List<Pedido> listarPedidoEstoque(String numeroPagina){
        List<Pedido> listarPedido = new ArrayList();
        int totalPorPagina = 10;

        int offset = (Integer.parseInt(numeroPagina) * totalPorPagina) - totalPorPagina;

        if (offset < 0) {
            offset = 0;
        }

        try {
            Connection con = ConexaoDB.obterConexao();// select pedidos.*, usuario.email_user from pedidos, usuario where pedidos.cod_cliente = usuario.cod_user order by cod_cliente limit 5 offset 5;

            String query = "select pedidos.*, cliente.email_cli from pedidos, cliente where pedidos.cod_cliente = cliente.cod_cliente order by cod_pedido desc limit " + totalPorPagina + " offset " + offset + ";";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCompra = rs.getInt("cod_pedido");
                String cepCompra = rs.getString("cep_end");
                String logradouroCompra = rs.getString("rua_end");
                String bairroCompra = rs.getString("bairro_end");
                String localidadeCompra = rs.getString("cidade_end");
                String ufCompra = rs.getString("estado_end");
                String numeroCompra = rs.getString("numero_end");
                String complementoCompra = rs.getString("compl_end");
                double valorFrete = rs.getDouble("valor_frete");
                String formaPagamento = rs.getString("forma_pagamento");
                String numeroCartao = rs.getString("numero_cartao");
                double totalCompra = rs.getDouble("valor_final");
                String dataPedido = rs.getString("data_pedido") ;      
                char statusPedido = rs.getString("status_pedido").charAt(0);
                int codCliente = rs.getInt("cod_cliente");
                
                String emailCliente = rs.getString("email_cli");
                
                listarPedido.add(new Pedido(idCompra,cepCompra, logradouroCompra, bairroCompra, localidadeCompra, ufCompra, numeroCompra, complementoCompra, valorFrete, formaPagamento, numeroCartao, totalCompra, dataPedido, statusPedido, codCliente, emailCliente));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listarPedido;
    }
    
    public static List<ItemVenda> listarProdutosPedido(Integer codPedido){
        List<ItemVenda> listarProdutosPedido = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select itens_venda.*, pedidos.valor_frete from itens_venda, pedidos where itens_venda.cod_pedido = pedidos.cod_pedido and  itens_venda.cod_pedido = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codPedido);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int codItem = rs.getInt("cod_item");
                String nomeItem = rs.getString("nome_item");
                int qtdItem = rs.getInt("qtd_item");
                double precoUnitario = rs.getDouble("preco_unit");
                double precoTotal = rs.getDouble("preco_total");
                double freteCompra = rs.getDouble("valor_frete");
                listarProdutosPedido.add(new ItemVenda(codItem,nomeItem, qtdItem, precoUnitario, precoTotal, codPedido, freteCompra));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listarProdutosPedido;
    }
    
    
    public static Pedido exibirPedido() {
        Pedido pedido = null;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from pedidos where cod_pedido = (select max(cod_pedido) as cod_pedido from pedidos);";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String cepCompra = rs.getString("cep_end");
                String logradouroCompra = rs.getString("rua_end");
                String bairroCompra = rs.getString("bairro_end");
                String localidadeCompra = rs.getString("cidade_end");
                String ufCompra = rs.getString("estado_end");
                String numeroCompra = rs.getString("numero_end");
                String complementoCompra = rs.getString("compl_end");
                double valorFrete = rs.getDouble("valor_frete");
                String formaPagamento = rs.getString("forma_pagamento");
                String numeroCartao = rs.getString("numero_cartao");
                double totalCompra = rs.getDouble("valor_final");
                String dataPedido = rs.getString("data_pedido");
                char statusPedido = rs.getString("status_pedido").charAt(0);
                int codCliente = rs.getInt("cod_cliente");
                pedido = new Pedido(cepCompra, logradouroCompra, bairroCompra, localidadeCompra, ufCompra, numeroCompra, complementoCompra, valorFrete, formaPagamento, numeroCartao, totalCompra, dataPedido, statusPedido, codCliente);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return pedido;
    }
    
}
