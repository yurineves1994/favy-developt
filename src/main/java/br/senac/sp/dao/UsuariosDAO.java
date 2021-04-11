package br.senac.sp.dao;

import br.senac.sp.db.ConexaoDB;
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

public class UsuariosDAO {

    public static int quantidadePagina() {
        int quantidadePagina = 1;
        double totalPessoaPorPagina = 10.0;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select count(1) as totalUsuario from usuario";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double totalProdutos = rs.getDouble("totalUsuario");
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

    public static List<Usuario> listarUsuarios(String numeroPagina) {
        List<Usuario> listaUsuarios = new ArrayList();
        int totalPorPagina = 10;
        
        int offset = (Integer.parseInt(numeroPagina) * totalPorPagina) - totalPorPagina;

        if (offset < 0) {
            offset = 0;
        }
        
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from usuario limit " + totalPorPagina + " offset " + offset + ";";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer codUsuario = rs.getInt("cod_user");
                String nomeUsuario = rs.getString("usuario");
                String emailUsuario = rs.getString("email_user");
                String statusUsuario = rs.getString("status_user");
                String senhaUsuario = rs.getString("senha_user");
                int cargo = rs.getInt("cargo");
                listaUsuarios.add(new Usuario(codUsuario, nomeUsuario, emailUsuario, statusUsuario, senhaUsuario, cargo));
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
                int cargo = rs.getInt("cargo");
                listaPesquisaUsuario.add(new Usuario(codUsuario, nomeUsuario, emailUsuario, statusUsuario, senhaUsuario, cargo));
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
                int cargo = rs.getInt("cargo");
                usuario = new Usuario(codUsuario, nomeUsuario, emailUsuario, statusUsuario, senhaUsuario, cargo);
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
    
    public static Usuario getAcesso(String emailUsuario) {
        Usuario usuario = null;
        try {
            Connection con = ConexaoDB.obterConexao();
            String query = "select * from Usuario where email_user=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, emailUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String statusUsuario = rs.getString("status_user");
                String senhaUsuario = rs.getString("senha_user");
                usuario = new Usuario();
                usuario.setEmailUsuario(emailUsuario);
                usuario.setSenhaUsuario(senhaUsuario);
                usuario.setStatusUsuario(statusUsuario);
                usuario.setCodUsuario(rs.getInt("cod_user"));
                usuario.setNomeUsuario(rs.getString("usuario"));
                usuario.setCargo(rs.getInt("cargo"));
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
