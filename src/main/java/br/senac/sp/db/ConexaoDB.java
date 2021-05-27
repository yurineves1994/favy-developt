package br.senac.sp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ConexaoDB {

    // Bloco Executado uma unica vez quando o servidor é inicializado
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexaoDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection obterConexao() throws ClassNotFoundException, SQLException {
        // url do banco de dados, muda de tipo de banco de dados
        String url = "jdbc:mysql://localhost:3306/favypi?useTimezone=true&serverTimezone=UTC&useSSL=false";
        //o usuario de acesso do banco ( estou usando mysql, geralmente é root)
        String user = "root";
        //senha do banco
        String senha = "";

        return DriverManager.getConnection(url, user, senha);
    }
}
