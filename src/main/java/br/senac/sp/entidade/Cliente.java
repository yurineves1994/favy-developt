/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.entidade;

/**
 *
 * @author ardis
 */
public class Cliente {
    private Integer codCliente;
    private String nomeCliente;
    private String cpfCliente;
    private String emailCliente;
    private String senhaCliente;
    
    // Construtores
    public Cliente() {
    }
    
    public Cliente(Integer codCliente,String nomeCliente,String cpfCliente,String emailCliente,String senhaCliente) {
        this.codCliente=codCliente;
        this.nomeCliente=nomeCliente;
        this.cpfCliente=cpfCliente;
        this.emailCliente=emailCliente;
        this.senhaCliente=senhaCliente; 
    }

    public Integer getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(Integer codCliente) {
        this.codCliente = codCliente;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public String getSenhaCliente() {
        return senhaCliente;
    }

    public void setSenhaCliente(String senhaCliente) {
        this.senhaCliente = senhaCliente;
    }

   
}

