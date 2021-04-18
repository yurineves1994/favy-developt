/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.dao;

import static br.senac.sp.dao.ClienteDAO.listarClientes;
import br.senac.sp.db.ConexaoDB;
import br.senac.sp.entidade.Cliente;
import br.senac.sp.entidade.Usuario;
import br.senac.sp.servlet.ServletBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ardis
 */
public class ClienteDAO {
    public static int quantidadePagina() {
        int quantidadePagina = 1;
        double totalPessoaPorPagina = 10.0;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select count(1) as totalCliente from cliente";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double totalProdutos = rs.getDouble("totalCliente");
                if (totalProdutos > totalPessoaPorPagina) {
                    double quantidadePessoaPorPaginaTemp = Float.parseFloat("" + (totalProdutos / totalPessoaPorPagina));

                    if (!(quantidadePessoaPorPaginaTemp % 2 == 0)) {
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
    public static List<Cliente> listarClientes(String numeroPagina) {
        List<Cliente> listaClientes = new ArrayList();
        int totalPorPagina = 10;
        
        int offset = (Integer.parseInt(numeroPagina) * totalPorPagina) - totalPorPagina;

        if (offset < 0) {
            offset = 0;
        }
        
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from cliente limit " + totalPorPagina + " offset " + offset + ";";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codCliente = rs.getInt("cod_cliente");
                String nomeCliente = rs.getString("nome_cliente");
                String cpfCliente = rs.getString("cpf_cli");
                String emailCliente = rs.getString("email_cli");
                String senhaCliente = rs.getString("senha_cli");
                listaClientes.add(new Cliente(codCliente,nomeCliente,cpfCliente,emailCliente,senhaCliente));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaClientes;
    }

    public static List<Cliente> PesquisarCliente(String nomePesquisa) {
        List<Cliente> listaPesquisaCliente = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from cliente where nome_cliente like '%" + nomePesquisa + "%'";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codCliente = rs.getInt("cod_cliente");
                String nomeCliente = rs.getString("nome_cliente");
                String cpfCliente = rs.getString("cpf_cli");
                String emailCliente = rs.getString("email_cli");
                String senhaCliente = rs.getString("senha_cli");
                listaPesquisaCliente.add(new Cliente(codCliente,nomeCliente,cpfCliente,emailCliente,senhaCliente));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaPesquisaCliente;
    }

    public static void addCliente(Cliente cliente) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.obterConexao();
        String query = "insert into cliente(nome_cliente, cpfCliente, email_cli, senha_cli) values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getNomeCliente());
        ps.setString(2, cliente.getCpfCliente());
        ps.setString(3, cliente.getEmailCliente());
        ps.setString(4, cliente.getSenhaCliente());
        ps.execute();
        ps.close();
    }

    public static void updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update cliente set nome_cliente=?, cpf_cli=?, email_cli=?, senha_cli=? where cod_cliente=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getNomeCliente());
        ps.setString(2, cliente.getCpfCliente());
        ps.setString(3, cliente.getEmailCliente());
        ps.setString(4, cliente.getSenhaCliente());
        ps.execute();
        ps.close();
    }

    public static Cliente obterCliente(Integer codCliente) {
        Cliente cliente = null;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from cliente where cod_cliente=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomeCliente = rs.getString("nome_cliente");
                String cpfCliente = rs.getString("cpf_cli");
                String emailCliente = rs.getString("email_cli");
                String senhaCliente = rs.getString("senha_cli");
                cliente = new Cliente(codCliente,nomeCliente,cpfCliente,emailCliente,senhaCliente);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return cliente;
    }
    
}
