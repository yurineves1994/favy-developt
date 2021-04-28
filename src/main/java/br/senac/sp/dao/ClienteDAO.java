/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.dao;

import br.senac.sp.db.ConexaoDB;
import br.senac.sp.entidade.Cliente;
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
                String cepFat = rs.getString("cep_fat");
                String ruaFat = rs.getString("rua_fat");
                String bairroFat = rs.getString("bairro_fat");
                String cidadeFat = rs.getString("cidade_fat");
                String ufFat = rs.getString("estado_fat");
                String numFat = rs.getString("numero_fat");
                String complFat = rs.getString("compl_fat");
                String cepEnt1 = rs.getString("cep_ent1");
                String ruaEnt1 = rs.getString("rua_ent1");
                String bairroEnt1 = rs.getString("bairro_ent1");
                String cidadeEnt1 = rs.getString("cidade_ent1");
                String ufEnt1 = rs.getString("estado_ent1");
                String numEnt1 = rs.getString("numero_ent1");
                String complEnt1 = rs.getString("compl_ent1");
                String cepEnt2 = rs.getString("cep_ent2");
                String ruaEnt2 = rs.getString("rua_ent2");
                String bairroEnt2 = rs.getString("bairro_ent2");
                String cidadeEnt2 = rs.getString("cidade_ent2");
                String ufEnt2 = rs.getString("estado_ent2");
                String numEnt2 = rs.getString("numero_ent2");
                String complEnt2 = rs.getString("compl_ent2");
                String emailCliente = rs.getString("email_cli");
                String senhaCliente = rs.getString("senha_cli");
                listaClientes.add(new Cliente(codCliente,nomeCliente,cpfCliente,cepFat,ruaFat,bairroFat,cidadeFat,ufFat,numFat,complFat,cepEnt1,ruaEnt1,bairroEnt1,cidadeEnt1,ufEnt1,numEnt1,complEnt1,cepEnt2,ruaEnt2,bairroEnt2,cidadeEnt2,ufEnt2,numEnt2,complEnt2,emailCliente,senhaCliente));
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
                String cepFat = rs.getString("cep_fat");
                String ruaFat = rs.getString("rua_fat");
                String bairroFat = rs.getString("bairro_fat");
                String cidadeFat = rs.getString("cidade_fat");
                String ufFat = rs.getString("estado_fat");
                String numFat = rs.getString("numero_fat");
                String complFat = rs.getString("compl_fat");
                String cepEnt1 = rs.getString("cep_ent1");
                String ruaEnt1 = rs.getString("rua_ent1");
                String bairroEnt1 = rs.getString("bairro_ent1");
                String cidadeEnt1 = rs.getString("cidade_ent1");
                String ufEnt1 = rs.getString("estado_ent1");
                String numEnt1 = rs.getString("numero_ent1");
                String complEnt1 = rs.getString("compl_ent1");
                String cepEnt2 = rs.getString("cep_ent2");
                String ruaEnt2 = rs.getString("rua_ent2");
                String bairroEnt2 = rs.getString("bairro_ent2");
                String cidadeEnt2 = rs.getString("cidade_ent2");
                String ufEnt2 = rs.getString("estado_ent2");
                String numEnt2 = rs.getString("numero_ent2");
                String complEnt2 = rs.getString("compl_ent2");
                String emailCliente = rs.getString("email_cli");
                String senhaCliente = rs.getString("senha_cli");
                listaPesquisaCliente.add(new Cliente(codCliente,nomeCliente,cpfCliente,cepFat,ruaFat,bairroFat,cidadeFat,ufFat,numFat,complFat,cepEnt1,ruaEnt1,bairroEnt1,cidadeEnt1,ufEnt1,numEnt1,complEnt1,cepEnt2,ruaEnt2,bairroEnt2,cidadeEnt2,ufEnt2,numEnt2,complEnt2,emailCliente,senhaCliente));
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
        String query = "insert into cliente(nome_cliente, cpf_cli, cep_fat, rua_fat, bairro_fat, cidade_fat, estado_fat, numero_fat, compl_fat, cep_ent1, rua_ent1, bairro_ent1, cidade_ent1, estado_ent1, numero_ent1, compl_ent1, cep_ent2, rua_ent2, bairro_ent2, cidade_ent2, estado_ent2, numero_ent2, compl_ent2, email_cli, senha_cli) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getNomeCliente());
        ps.setString(2, cliente.getCpfCliente());
        ps.setString(3, cliente.getCepFat());
        ps.setString(4, cliente.getRuaFat());
        ps.setString(5, cliente.getBairroFat());
        ps.setString(6, cliente.getCidadeFat());
        ps.setString(7, cliente.getUfFat());
        ps.setString(8, cliente.getNumFat());
        ps.setString(9, cliente.getComplFat());
        ps.setString(10, cliente.getCepEnt1());
        ps.setString(11, cliente.getRuaEnt1());
        ps.setString(12, cliente.getBairroEnt1());
        ps.setString(13, cliente.getCidadeEnt1());
        ps.setString(14, cliente.getUfEnt1());
        ps.setString(15, cliente.getNumEnt1());
        ps.setString(16, cliente.getComplEnt1());
        ps.setString(17, cliente.getCepEnt2());
        ps.setString(18, cliente.getRuaEnt2());
        ps.setString(19, cliente.getBairroEnt2());
        ps.setString(20, cliente.getCidadeEnt2());
        ps.setString(21, cliente.getUfEnt2());
        ps.setString(22, cliente.getNumEnt2());
        ps.setString(23, cliente.getComplEnt2());
        ps.setString(24, cliente.getEmailCliente());
        ps.setString(25, cliente.codificarSenha(cliente.getSenhaCliente()));
        ps.execute();
        ps.close();
    }

    public static void updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update cliente set nome_cliente=?, cpf_cli=?, cep_fat=?, rua_fat=?, bairro_fat=?, cidade_fat=?, estado_fat=?, numero_fat=?, compl_fat=?, cep_ent1=?, rua_ent1=?, bairro_ent1=?, cidade_ent1=?, estado_ent1=?, numero_ent1=?, compl_ent1=?, cep_ent2=?, rua_ent2=?, bairro_ent2=?, cidade_ent2=?, estado_ent2=?, numero_ent2=?, compl_ent2=?, email_cli=?, senha_cli=? where cod_cliente=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getNomeCliente());
        ps.setString(2, cliente.getCpfCliente());
        ps.setString(3, cliente.getCepFat());
        ps.setString(4, cliente.getRuaFat());
        ps.setString(5, cliente.getBairroFat());
        ps.setString(6, cliente.getCidadeFat());
        ps.setString(7, cliente.getUfFat());
        ps.setString(8, cliente.getNumFat());
        ps.setString(9, cliente.getComplFat());
        ps.setString(10, cliente.getCepEnt1());
        ps.setString(11, cliente.getRuaEnt1());
        ps.setString(12, cliente.getBairroEnt1());
        ps.setString(13, cliente.getCidadeEnt1());
        ps.setString(14, cliente.getUfEnt1());
        ps.setString(15, cliente.getNumEnt1());
        ps.setString(16, cliente.getComplEnt1());
        ps.setString(17, cliente.getCepEnt2());
        ps.setString(18, cliente.getRuaEnt2());
        ps.setString(19, cliente.getBairroEnt2());
        ps.setString(20, cliente.getCidadeEnt2());
        ps.setString(21, cliente.getUfEnt2());
        ps.setString(22, cliente.getNumEnt2());
        ps.setString(23, cliente.getComplEnt2());
        ps.setString(24, cliente.getEmailCliente());
        ps.setString(25, cliente.codificarSenha(cliente.getSenhaCliente()));
        ps.setInt(26, cliente.getCodCliente());
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
                String cepFat = rs.getString("cep_fat");
                String ruaFat = rs.getString("rua_fat");
                String bairroFat = rs.getString("bairro_fat");
                String cidadeFat = rs.getString("cidade_fat");
                String ufFat = rs.getString("estado_fat");
                String numFat = rs.getString("numero_fat");
                String complFat = rs.getString("compl_fat");
                String cepEnt1 = rs.getString("cep_ent1");
                String ruaEnt1 = rs.getString("rua_ent1");
                String bairroEnt1 = rs.getString("bairro_ent1");
                String cidadeEnt1 = rs.getString("cidade_ent1");
                String ufEnt1 = rs.getString("estado_ent1");
                String numEnt1 = rs.getString("numero_ent1");
                String complEnt1 = rs.getString("compl_ent1");
                String cepEnt2 = rs.getString("cep_ent2");
                String ruaEnt2 = rs.getString("rua_ent2");
                String bairroEnt2 = rs.getString("bairro_ent2");
                String cidadeEnt2 = rs.getString("cidade_ent2");
                String ufEnt2 = rs.getString("estado_ent2");
                String numEnt2 = rs.getString("numero_ent2");
                String complEnt2 = rs.getString("compl_ent2");
                String emailCliente = rs.getString("email_cli");
                String senhaCliente = rs.getString("senha_cli");
                cliente = new Cliente(codCliente,nomeCliente,cpfCliente,cepFat,ruaFat,bairroFat,cidadeFat,ufFat,numFat,complFat,cepEnt1,ruaEnt1,bairroEnt1,cidadeEnt1,ufEnt1,numEnt1,complEnt1,cepEnt2,ruaEnt2,bairroEnt2,cidadeEnt2,ufEnt2,numEnt2,complEnt2,emailCliente,senhaCliente);
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
    
    public static Cliente getAcesso(String emailCliente) {
        Cliente cliente = null;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from cliente where email_cli=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, emailCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomeCliente = rs.getString("nome_cliente");
                String cpfCliente = rs.getString("cpf_cli");
                String cepFat = rs.getString("cep_fat");
                String ruaFat = rs.getString("rua_fat");
                String bairroFat = rs.getString("bairro_fat");
                String cidadeFat = rs.getString("cidade_fat");
                String ufFat = rs.getString("estado_fat");
                String numFat = rs.getString("numero_fat");
                String complFat = rs.getString("compl_fat");
                String cepEnt1 = rs.getString("cep_ent1");
                String ruaEnt1 = rs.getString("rua_ent1");
                String bairroEnt1 = rs.getString("bairro_ent1");
                String cidadeEnt1 = rs.getString("cidade_ent1");
                String ufEnt1 = rs.getString("estado_ent1");
                String numEnt1 = rs.getString("numero_ent1");
                String complEnt1 = rs.getString("compl_ent1");
                String cepEnt2 = rs.getString("cep_ent2");
                String ruaEnt2 = rs.getString("rua_ent2");
                String bairroEnt2 = rs.getString("bairro_ent2");
                String cidadeEnt2 = rs.getString("cidade_ent2");
                String ufEnt2 = rs.getString("estado_ent2");
                String numEnt2 = rs.getString("numero_ent2");
                String complEnt2 = rs.getString("compl_ent2");
                String senhaCliente = rs.getString("senha_cli");
                cliente = new Cliente();
                cliente.setNomeCliente(nomeCliente);
                cliente.setCpfCliente(cpfCliente);
                cliente.setCepFat(cepFat);
                cliente.setRuaFat(ruaFat);
                cliente.setBairroFat(bairroFat);
                cliente.setCidadeFat(cidadeFat);
                cliente.setUfFat(ufFat);
                cliente.setNumFat(numFat);
                cliente.setComplFat(complFat);
                cliente.setCepEnt1(cepEnt1);
                cliente.setRuaEnt1(ruaEnt1);
                cliente.setBairroEnt1(bairroEnt1);
                cliente.setCidadeEnt1(cidadeEnt1);
                cliente.setUfEnt1(ufEnt1);
                cliente.setNumEnt1(numEnt1);
                cliente.setComplEnt1(complEnt1);
                cliente.setCepEnt2(cepEnt2);
                cliente.setRuaEnt2(ruaEnt2);
                cliente.setBairroEnt2(bairroEnt2);
                cliente.setCidadeEnt2(cidadeEnt2);
                cliente.setUfEnt2(ufEnt2);
                cliente.setNumEnt2(numEnt2);
                cliente.setComplEnt2(complEnt2);
                cliente.setEmailCliente(emailCliente);
                cliente.setSenhaCliente(senhaCliente);
                cliente.setCodCliente(rs.getInt("cod_cliente"));
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
