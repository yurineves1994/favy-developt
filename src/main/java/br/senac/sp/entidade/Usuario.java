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
public class Usuario {
     private Integer codUsuario;
    private String nomeUsuario;
    private String emailUsuario;
    private String statusUsuario;
    private String senhaUsuario;
    private int Cargo;


    // Construtores
    public Usuario() {
    }

    public Usuario(Integer codUsuario,String nomeUsuario,String emailUsuario,String statusUsuario,String senhaUsuario,int Cargo) {
        this.codUsuario = codUsuario;
        this.nomeUsuario = nomeUsuario;
        this.emailUsuario = emailUsuario;
        this.statusUsuario = statusUsuario;
        this.senhaUsuario = senhaUsuario;
        this.Cargo = Cargo;
    }
    
    public Usuario(String nomeUsuario,String emailUsuario,String statusUsuario,String senhaUsuario,int Cargo) {
        this.nomeUsuario = nomeUsuario;
        this.emailUsuario = emailUsuario;
        this.statusUsuario = statusUsuario;
        this.senhaUsuario = senhaUsuario;
        this.Cargo = Cargo;
    }
    
    // Getters e Setters

    public Integer getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(Integer codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getStatusUsuario() {
        return statusUsuario;
    }

    public void setStatusUsuario(String statusUsuario) {
        this.statusUsuario = statusUsuario;
    }

    public String getSenhaUsuario() {
        return senhaUsuario;
    }

    public void setSenhaUsuario(String senhaUsuario) {
        this.senhaUsuario = senhaUsuario;
    }

    public int getCargo() {
        return Cargo;
    }

    public void setCargo(int Cargo) {
        this.Cargo = Cargo;
    }



}
