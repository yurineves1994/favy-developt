package br.senac.sp.dao;

import br.senac.sp.db.ConexaoDB;
import br.senac.sp.entidade.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
