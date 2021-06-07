package br.senac.sp.entidade;

public class Pedido {
    
    private Integer codPedido;
    private String cepEndereco;
    private String ruaEndereco;
    private String bairroEndereco;
    private String cidadeEndereco;
    private String ufEndereco;
    private String numEndereco;
    private String complEndereco;
    private double valorFrete;
    private String formaPagamento;
    private String numeroCartaoCompra;
    private double valorFinal;
    private String dataPedido;
    private char statusPedido;
    private Integer codCliente;
    
    private String emailUser;

    public Pedido(Integer codPedido, String cepEndereco, String ruaEndereco, String bairroEndereco, String cidadeEndereco, String ufEndereco, String numEndereco, String complEndereco, double valorFrete, String formaPagamento, String numeroCartaoCompra, double valorFinal, String dataPedido, char statusPedido, Integer codCliente) {
        this.codPedido = codPedido;
        this.cepEndereco = cepEndereco;
        this.ruaEndereco = ruaEndereco;
        this.bairroEndereco = bairroEndereco;
        this.cidadeEndereco = cidadeEndereco;
        this.ufEndereco = ufEndereco;
        this.numEndereco = numEndereco;
        this.complEndereco = complEndereco;
        this.valorFrete = valorFrete;
        this.formaPagamento = formaPagamento;
        this.numeroCartaoCompra = numeroCartaoCompra;
        this.valorFinal = valorFinal;
        this.dataPedido = dataPedido;
        this.statusPedido = statusPedido;
        this.codCliente = codCliente;
    }
    
    
    
     public Pedido(Integer codPedido, String cepEndereco, String ruaEndereco, String bairroEndereco, String cidadeEndereco, String ufEndereco, String numEndereco, String complEndereco, double valorFrete, String formaPagamento, String numeroCartaoCompra, double valorFinal, String dataPedido, char statusPedido, Integer codCliente, String emailUser) {
        this.codPedido = codPedido;
        this.cepEndereco = cepEndereco;
        this.ruaEndereco = ruaEndereco;
        this.bairroEndereco = bairroEndereco;
        this.cidadeEndereco = cidadeEndereco;
        this.ufEndereco = ufEndereco;
        this.numEndereco = numEndereco;
        this.complEndereco = complEndereco;
        this.valorFrete = valorFrete;
        this.formaPagamento = formaPagamento;
        this.numeroCartaoCompra = numeroCartaoCompra;
        this.valorFinal = valorFinal;
        this.dataPedido = dataPedido;
        this.statusPedido = statusPedido;
        this.codCliente = codCliente;
        
        this.emailUser = emailUser;
    }
     
     
     
    public Pedido(String cepEndereco, String ruaEndereco, String bairroEndereco, String cidadeEndereco, String ufEndereco, String numEndereco, String complEndereco, double valorFrete, String formaPagamento, String numeroCartaoCompra, double valorFinal, String dataPedido, char statusPedido, Integer codCliente) {
        this.cepEndereco = cepEndereco;
        this.ruaEndereco = ruaEndereco;
        this.bairroEndereco = bairroEndereco;
        this.cidadeEndereco = cidadeEndereco;
        this.ufEndereco = ufEndereco;
        this.numEndereco = numEndereco;
        this.complEndereco = complEndereco;
        this.valorFrete = valorFrete;
        this.formaPagamento = formaPagamento;
        this.numeroCartaoCompra = numeroCartaoCompra;
        this.valorFinal = valorFinal;
        this.dataPedido = dataPedido;
        this.statusPedido = statusPedido;
        this.codCliente = codCliente;
    }
    
    
    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }
    

    public double getValorFinal() {
        return valorFinal;
    }

    public void setValorFinal(double valorFinal) {
        this.valorFinal = valorFinal;
    }


    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public String getNumeroCartaoCompra() {
        return numeroCartaoCompra;
    }

    public void setNumeroCartaoCompra(String numeroCartaoCompra) {
        this.numeroCartaoCompra = numeroCartaoCompra;
    }

    public Integer getCodPedido() {
        return codPedido;
    }

    public void setCodPedido(Integer codPedido) {
        this.codPedido = codPedido;
    }

    public String getCepEndereco() {
        return cepEndereco;
    }

    public void setCepEndereco(String cepEndereco) {
        this.cepEndereco = cepEndereco;
    }

    public String getRuaEndereco() {
        return ruaEndereco;
    }

    public void setRuaEndereco(String ruaEndereco) {
        this.ruaEndereco = ruaEndereco;
    }

    public String getBairroEndereco() {
        return bairroEndereco;
    }

    public void setBairroEndereco(String bairroEndereco) {
        this.bairroEndereco = bairroEndereco;
    }

    public String getCidadeEndereco() {
        return cidadeEndereco;
    }

    public void setCidadeEndereco(String cidadeEndereco) {
        this.cidadeEndereco = cidadeEndereco;
    }

    public String getUfEndereco() {
        return ufEndereco;
    }

    public void setUfEndereco(String ufEndereco) {
        this.ufEndereco = ufEndereco;
    }

    public String getNumEndereco() {
        return numEndereco;
    }

    public void setNumEndereco(String numEndereco) {
        this.numEndereco = numEndereco;
    }

    public String getComplEndereco() {
        return complEndereco;
    }

    public void setComplEndereco(String complEndereco) {
        this.complEndereco = complEndereco;
    }

    public double getValorFrete() {
        return valorFrete;
    }

    public void setValorFrete(double valorFrete) {
        this.valorFrete = valorFrete;
    }

    public String getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(String dataPedido) {
        this.dataPedido = dataPedido;
    }

    public char getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(char statusPedido) {
        this.statusPedido = statusPedido;
    }

    public Integer getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(Integer codCliente) {
        this.codCliente = codCliente;
    }
}
