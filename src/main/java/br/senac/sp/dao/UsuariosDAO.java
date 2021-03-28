/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.dao;

import br.senac.sp.db.ConexaoDB;
import br.senac.sp.entidade.Produto;
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
public class UsuariosDAO {
     public static List<Usuario> listarUsuarios() {
        List<Usuario> listaUsuarios = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from usuario";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codUsuario = rs.getInt("cod_user");
                String nomeUsuario = rs.getString("usuario");
                String emailUsuario = rs.getString("email_user");
                String statusUsuario = rs.getString("status_user");
                String senhaUsuario = rs.getString("senha_user");
                int Cargo = rs.getInt("cargo");
                listaUsuarios.add(new Usuario(codUsuario, nomeUsuario, emailUsuario, statusUsuario, senhaUsuario, Cargo));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaUsuarios;
    }
    
     public static List<Usuario> PesquisarUsuario(String nomePesquisa) {
        List<Usuario> listaPesquisaUsuario = new ArrayList();
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from usuario where usuario like '%" + nomePesquisa + "%'";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codUsuario = rs.getInt("cod_user");
                String nomeUsuario = rs.getString("usuario");
                String emailUsuario = rs.getString("email_user");
                String statusUsuario = rs.getString("status_user");
                String senhaUsuario = rs.getString("senha_user");
                int Cargo = rs.getInt("cargo");
                listaPesquisaUsuario.add(new Usuario(codUsuario, nomeUsuario, emailUsuario, statusUsuario, senhaUsuario, Cargo));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaPesquisaUsuario;
    }

    public static void addUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.obterConexao();
        String query = "insert into usuario(usuario, email_user, status_user, senha_user, cargo) values (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, usuario.getNomeUsuario());
        ps.setString(2, usuario.getEmailUsuario());
        ps.setString(3, usuario.getStatusUsuario());
        ps.setString(4, usuario.getSenhaUsuario());
        ps.setInt(5, usuario.getCargo());
        ps.execute();
        ps.close();
    }
    
     public static void updateUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update usuario set usuario=?, email_user=?, status_user=?, senha_user=?, cargo=? where cod_user=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, usuario.getNomeUsuario());
        ps.setString(2, usuario.getEmailUsuario());
        ps.setString(3, usuario.getStatusUsuario());
        ps.setString(4, usuario.getSenhaUsuario());
        ps.setInt(5, usuario.getCargo());
        ps.setInt(6, usuario.getCodUsuario());
        ps.execute();
        ps.close();
    }

    public static void ativarUsuario(Integer codUsuario) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update usuario set status_user='a' where cod_user=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, codUsuario);
        ps.execute();
        ps.close();
    }
    
    public static void desativarUsuario(Integer codUsuario) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.obterConexao();
        String query = "update usuario set status_user='i' where cod_user=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, codUsuario);
        ps.execute();
        ps.close();
    }

    public static Usuario obterUsuario(Integer codUsuario) {
        Usuario usuario = null;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from usuario where cod_user=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, codUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomeUsuario = rs.getString("usuario");
                String emailUsuario = rs.getString("email_user");
                String statusUsuario = rs.getString("status_user");
                String senhaUsuario = rs.getString("senha_user");
                int Cargo = rs.getInt("cargo");
                usuario = new Usuario(codUsuario, nomeUsuario, emailUsuario, statusUsuario, senhaUsuario, Cargo);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return usuario;
    }
}