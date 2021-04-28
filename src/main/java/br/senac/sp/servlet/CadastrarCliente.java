package br.senac.sp.servlet;

import br.senac.sp.dao.ClienteDAO;
import br.senac.sp.entidade.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastrarCliente extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String cepFat = request.getParameter("cep");
        String ruaFat = request.getParameter("logradouro");
        String bairroFat = request.getParameter("bairro");
        String cidadeFat = request.getParameter("localidade");
        String ufFat = request.getParameter("uf");
        String numFat = request.getParameter("numero");
        String complFat = request.getParameter("complemento");
        String cepEnt1 = request.getParameter("cepEntrega1");
        String ruaEnt1 = request.getParameter("logradouroEntrega1");
        String bairroEnt1 = request.getParameter("bairroEntrega1");
        String cidadeEnt1 = request.getParameter("localidadeEntrega1");
        String ufEnt1 = request.getParameter("ufEntrega1");
        String numEnt1 = request.getParameter("numeroEntrega1");
        String complEnt1 = request.getParameter("complementoEntrega1");
        String cepEnt2 = request.getParameter("cepEntrega2");
        String ruaEnt2 = request.getParameter("logradouroEntrega2");
        String bairroEnt2 = request.getParameter("bairroEntrega2");
        String cidadeEnt2 = request.getParameter("localidadeEntrega2");
        String ufEnt2 = request.getParameter("ufEntrega2");
        String numEnt2 = request.getParameter("numeroEntrega2");
        String complEnt2 = request.getParameter("complementoEntrega2");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Cliente user = new Cliente(nome,cpf,cepFat,ruaFat,bairroFat,cidadeFat,ufFat,numFat,complFat,cepEnt1,ruaEnt1,bairroEnt1,cidadeEnt1,ufEnt1,numEnt1,complEnt1,cepEnt2,ruaEnt2,bairroEnt2,cidadeEnt2,ufEnt2,numEnt2,complEnt2,email,senha);

        try {
            ClienteDAO.addCliente(user);
            response.sendRedirect("login_cliente.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
        
    }
}
