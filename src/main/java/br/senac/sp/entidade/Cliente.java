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
    private String emailCliente;
    private String senhaCliente;
    private String cepCliente;
    private String ruaCliente;
    private String bairroCliente;
    private String cidadeCliente;
    private String estadoCliente;
    
    // Construtores
    public Cliente() {
    }
    
    public Cliente(Integer codCliente,String nomeCliente,String emailCliente,String senhaCliente,String cepCliente,String ruaCliente,String bairroCliente,String cidadeCliente,String estadoCliente) {
        this.codCliente=codCliente;
        this.nomeCliente=nomeCliente;
        this.emailCliente=emailCliente;
        this.senhaCliente=senhaCliente;
        this.cepCliente=cepCliente;
        this.ruaCliente=ruaCliente;
        this.bairroCliente=bairroCliente;
        this.cidadeCliente=cidadeCliente;
        this.estadoCliente=estadoCliente;
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

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public String getCepCliente() {
        return cepCliente;
    }

    public void setCepCliente(String cepCliente) {
        this.cepCliente = cepCliente;
    }

    public String getSenhaCliente() {
        return senhaCliente;
    }

    public void setSenhaCliente(String senhaCliente) {
        this.senhaCliente = senhaCliente;
    }

    public String getRuaCliente() {
        return ruaCliente;
    }

    public void setRuaCliente(String ruaCliente) {
        this.ruaCliente = ruaCliente;
    }

    public String getBairroCliente() {
        return bairroCliente;
    }

    public void setBairroCliente(String bairroCliente) {
        this.bairroCliente = bairroCliente;
    }

    public String getCidadeCliente() {
        return cidadeCliente;
    }

    public void setCidadeCliente(String cidadeCliente) {
        this.cidadeCliente = cidadeCliente;
    }

    public String getEstadoCliente() {
        return estadoCliente;
    }

    public void setEstadoCliente(String estadoCliente) {
        this.estadoCliente = estadoCliente;
    }
    
}

