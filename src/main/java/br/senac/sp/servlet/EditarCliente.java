package br.senac.sp.servlet;

import br.senac.sp.dao.ClienteDAO;
import br.senac.sp.entidade.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Integer codCliente = Integer.parseInt(request.getParameter("codCliente"));
        Cliente cliente = ClienteDAO.obterCliente(codCliente);

        request.setAttribute("cliente", cliente);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/protected/cliente/tela-editar-cliente.jsp");
        requestDispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Integer codCliente = Integer.parseInt(request.getParameter("cod_cliente"));
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
        String bairroEnt2 = request.getParameter("numeroEntrega2");
        String cidadeEnt2 = request.getParameter("complementoEntrega2");
        String ufEnt2 = request.getParameter("ufEntrega2");
        String numEnt2 = request.getParameter("numero_ent2");
        String complEnt2 = request.getParameter("compl_ent2");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Cliente cliente = ClienteDAO.obterCliente(codCliente);
        cliente.setNomeCliente(nome);
        cliente.setCpfCliente(cpf);
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
        cliente.setEmailCliente(email);
        cliente.setSenhaCliente(senha);
        
        try {
            ClienteDAO.updateCliente(cliente);
            response.sendRedirect("/ProjetoFavy/CardsProdutos");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
            response.sendRedirect("tela_falha.jsp");
        }
    }
}
