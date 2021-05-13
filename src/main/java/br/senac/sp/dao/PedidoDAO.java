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
        String query = "insert into pedidos(cep_end, rua_end, bairro_end, cidade_end, estado_end, numero_end, compl_end, valor_frete, forma_pagamento, valor_final, data_pedido, status_pedido, cod_cliente) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
        ps.setDouble(10, pedidos.getValorFinal());
        ps.setString(11, pedidos.getDataPedido());
        ps.setString(12, String.valueOf(pedidos.getStatusPedido()));
        ps.setInt(13, pedidos.getCodCliente());
        ps.execute();
        ps.close();
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
    
    public static List<Pedido> listarPedido() {
        List<Pedido> listarPedido = new ArrayList();
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
                String formaPagamento = rs.getString("formaPagamento");
                double totalCompra = rs.getDouble("valor_final");
                String dataPedido = rs.getString("data_pedido");
                char statusPedido = rs.getString("status_pedido").charAt(0);
                int codCliente = rs.getInt("codCliente");
                listarPedido.add(new Pedido(cepCompra, logradouroCompra, bairroCompra, localidadeCompra, ufCompra, numeroCompra, complementoCompra, valorFrete, formaPagamento, totalCompra, dataPedido, statusPedido, codCliente));
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
                double totalCompra = rs.getDouble("valor_final");
                String dataPedido = rs.getString("data_pedido");
                char statusPedido = rs.getString("status_pedido").charAt(0);
                int codCliente = rs.getInt("cod_cliente");
                pedido = new Pedido(cepCompra, logradouroCompra, bairroCompra, localidadeCompra, ufCompra, numeroCompra, complementoCompra, valorFrete, formaPagamento, totalCompra, dataPedido, statusPedido, codCliente);
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
