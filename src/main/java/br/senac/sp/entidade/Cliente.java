/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.entidade;

import at.favre.lib.crypto.bcrypt.BCrypt;

/**
 *
 * @author ardis
 */
public class Cliente {
    private Integer codCliente;
    private String nomeCliente;
    private String cpfCliente;
    private String cepFat;
    private String ruaFat;
    private String bairroFat;
    private String cidadeFat;
    private String ufFat;
    private String numFat;
    private String complFat;
    private String cepEnt1;
    private String ruaEnt1;
    private String bairroEnt1;
    private String cidadeEnt1;
    private String ufEnt1;
    private String numEnt1;
    private String complEnt1;
    private String cepEnt2;
    private String ruaEnt2;
    private String bairroEnt2;
    private String cidadeEnt2;
    private String ufEnt2;
    private String numEnt2;
    private String complEnt2;
    private String emailCliente;
    private String senhaCliente;
    
    // Construtores
    public Cliente() {
    }

    public Cliente(String nomeCliente, String cpfCliente, String cepFat, String ruaFat, String bairroFat, String cidadeFat, String ufFat, String numFat, String complFat, String cepEnt1, String ruaEnt1, String bairroEnt1, String cidadeEnt1, String ufEnt1, String numEnt1, String complEnt1, String cepEnt2, String ruaEnt2, String bairroEnt2, String cidadeEnt2, String ufEnt2, String numEnt2, String complEnt2, String emailCliente, String senhaCliente) {
        this.nomeCliente = nomeCliente;
        this.cpfCliente = cpfCliente;
        this.cepFat = cepFat;
        this.ruaFat = ruaFat;
        this.bairroFat = bairroFat;
        this.cidadeFat = cidadeFat;
        this.ufFat = ufFat;
        this.numFat = numFat;
        this.complFat = complFat;
        this.cepEnt1 = cepEnt1;
        this.ruaEnt1 = ruaEnt1;
        this.bairroEnt1 = bairroEnt1;
        this.cidadeEnt1 = cidadeEnt1;
        this.ufEnt1 = ufEnt1;
        this.numEnt1 = numEnt1;
        this.complEnt1 = complEnt1;
        this.cepEnt2 = cepEnt2;
        this.ruaEnt2 = ruaEnt2;
        this.bairroEnt2 = bairroEnt2;
        this.cidadeEnt2 = cidadeEnt2;
        this.ufEnt2 = ufEnt2;
        this.numEnt2 = numEnt2;
        this.complEnt2 = complEnt2;
        this.emailCliente = emailCliente;
        this.senhaCliente = senhaCliente;
    }

    public Cliente(Integer codCliente, String nomeCliente, String cpfCliente, String cepFat, String ruaFat, String bairroFat, String cidadeFat, String ufFat, String numFat, String complFat, String cepEnt1, String ruaEnt1, String bairroEnt1, String cidadeEnt1, String ufEnt1, String numEnt1, String complEnt1, String cepEnt2, String ruaEnt2, String bairroEnt2, String cidadeEnt2, String ufEnt2, String numEnt2, String complEnt2, String emailCliente, String senhaCliente) {
        this.codCliente = codCliente;
        this.nomeCliente = nomeCliente;
        this.cpfCliente = cpfCliente;
        this.cepFat = cepFat;
        this.ruaFat = ruaFat;
        this.bairroFat = bairroFat;
        this.cidadeFat = cidadeFat;
        this.ufFat = ufFat;
        this.numFat = numFat;
        this.complFat = complFat;
        this.cepEnt1 = cepEnt1;
        this.ruaEnt1 = ruaEnt1;
        this.bairroEnt1 = bairroEnt1;
        this.cidadeEnt1 = cidadeEnt1;
        this.ufEnt1 = ufEnt1;
        this.numEnt1 = numEnt1;
        this.complEnt1 = complEnt1;
        this.cepEnt2 = cepEnt2;
        this.ruaEnt2 = ruaEnt2;
        this.bairroEnt2 = bairroEnt2;
        this.cidadeEnt2 = cidadeEnt2;
        this.ufEnt2 = ufEnt2;
        this.numEnt2 = numEnt2;
        this.complEnt2 = complEnt2;
        this.emailCliente = emailCliente;
        this.senhaCliente = senhaCliente;
    }

//    public Cliente(Integer codCliente,String nomeCliente,String cpfCliente,String emailCliente,String senhaCliente) {
//        this.codCliente=codCliente;
//        this.nomeCliente=nomeCliente;
//        this.cpfCliente=cpfCliente;
//        this.emailCliente=emailCliente;
//        this.senhaCliente=senhaCliente; 
//    }
//
//    public Cliente(String nomeCliente,String cpfCliente,String emailCliente,String senhaCliente) {
//        this.nomeCliente=nomeCliente;
//        this.cpfCliente=cpfCliente;
//        this.emailCliente=emailCliente;
//        this.senhaCliente=senhaCliente; 
//    }

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
    
    public String getCepFat() {
        return cepFat;
    }

    public void setCepFat(String cepFat) {
        this.cepFat = cepFat;
    }

    public String getRuaFat() {
        return ruaFat;
    }

    public void setRuaFat(String ruaFat) {
        this.ruaFat = ruaFat;
    }

    public String getBairroFat() {
        return bairroFat;
    }

    public void setBairroFat(String bairroFat) {
        this.bairroFat = bairroFat;
    }

    public String getCidadeFat() {
        return cidadeFat;
    }

    public void setCidadeFat(String cidadeFat) {
        this.cidadeFat = cidadeFat;
    }

    public String getUfFat() {
        return ufFat;
    }

    public void setUfFat(String ufFat) {
        this.ufFat = ufFat;
    }

    public String getNumFat() {
        return numFat;
    }

    public void setNumFat(String numFat) {
        this.numFat = numFat;
    }

    public String getComplFat() {
        return complFat;
    }

    public void setComplFat(String complFat) {
        this.complFat = complFat;
    }

    public String getCepEnt1() {
        return cepEnt1;
    }

    public void setCepEnt1(String cepEnt1) {
        this.cepEnt1 = cepEnt1;
    }

    public String getRuaEnt1() {
        return ruaEnt1;
    }

    public void setRuaEnt1(String ruaEnt1) {
        this.ruaEnt1 = ruaEnt1;
    }

    public String getBairroEnt1() {
        return bairroEnt1;
    }

    public void setBairroEnt1(String bairroEnt1) {
        this.bairroEnt1 = bairroEnt1;
    }

    public String getCidadeEnt1() {
        return cidadeEnt1;
    }

    public void setCidadeEnt1(String cidadeEnt1) {
        this.cidadeEnt1 = cidadeEnt1;
    }

    public String getUfEnt1() {
        return ufEnt1;
    }

    public void setUfEnt1(String ufEnt1) {
        this.ufEnt1 = ufEnt1;
    }

    public String getNumEnt1() {
        return numEnt1;
    }

    public void setNumEnt1(String numEnt1) {
        this.numEnt1 = numEnt1;
    }

    public String getComplEnt1() {
        return complEnt1;
    }

    public void setComplEnt1(String complEnt1) {
        this.complEnt1 = complEnt1;
    }

    public String getCepEnt2() {
        return cepEnt2;
    }

    public void setCepEnt2(String cepEnt2) {
        this.cepEnt2 = cepEnt2;
    }

    public String getRuaEnt2() {
        return ruaEnt2;
    }

    public void setRuaEnt2(String ruaEnt2) {
        this.ruaEnt2 = ruaEnt2;
    }

    public String getBairroEnt2() {
        return bairroEnt2;
    }

    public void setBairroEnt2(String bairroEnt2) {
        this.bairroEnt2 = bairroEnt2;
    }

    public String getCidadeEnt2() {
        return cidadeEnt2;
    }

    public void setCidadeEnt2(String cidadeEnt2) {
        this.cidadeEnt2 = cidadeEnt2;
    }

    public String getUfEnt2() {
        return ufEnt2;
    }

    public void setUfEnt2(String ufEnt2) {
        this.ufEnt2 = ufEnt2;
    }

    public String getNumEnt2() {
        return numEnt2;
    }

    public void setNumEnt2(String numEnt2) {
        this.numEnt2 = numEnt2;
    }

    public String getComplEnt2() {
        return complEnt2;
    }

    public void setComplEnt2(String complEnt2) {
        this.complEnt2 = complEnt2;
    }

    public static String codificarSenha(String senhaCliente) {
        return BCrypt.withDefaults().hashToString(12, senhaCliente.toCharArray());
    }
    
    public boolean validarSenha(String senhaCliente) {
        BCrypt.Result response = BCrypt.verifyer().verify(senhaCliente.toCharArray(), this.getSenhaCliente());
        return response.verified;
    }
    
    public boolean isCliente() {
        return this.codCliente > 0;
    }
}

