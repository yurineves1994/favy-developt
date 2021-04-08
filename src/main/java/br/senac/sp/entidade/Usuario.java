package br.senac.sp.entidade;

public class Usuario {
     private Integer codUsuario;
    private String nomeUsuario;
    private String emailUsuario;
    private String statusUsuario;
    private String senhaUsuario;
    private int cargo;


    // Construtores
    public Usuario() {
    }

    public Usuario(Integer codUsuario,String nomeUsuario,String emailUsuario,String statusUsuario,String senhaUsuario,int cargo) {
        this.codUsuario = codUsuario;
        this.nomeUsuario = nomeUsuario;
        this.emailUsuario = emailUsuario;
        this.statusUsuario = statusUsuario;
        this.senhaUsuario = senhaUsuario;
        this.cargo = cargo;
    }
    
    public Usuario(String nomeUsuario,String emailUsuario,String statusUsuario,String senhaUsuario,int cargo) {
        this.nomeUsuario = nomeUsuario;
        this.emailUsuario = emailUsuario;
        this.statusUsuario = statusUsuario;
        this.senhaUsuario = senhaUsuario;
        this.cargo = cargo;
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
        return cargo;
    }

    public void setCargo(int cargo) {
        this.cargo = cargo;
    }

}
