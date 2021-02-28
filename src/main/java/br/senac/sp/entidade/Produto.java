package br.senac.sp.entidade;

public class Produto {

    private Integer codProduto;
    private String nomeProduto;
    private String descricao;
    private String statusProduto;
    private long precoProduto;
    private long qtdProduto;
    private int qtdEstrela;
    private String imagemProduto;

    // Construtores
    public Produto() {
    }

    public Produto(Integer codProduto, String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela, String imagemProduto) {
        this.codProduto = codProduto;
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
        this.imagemProduto = imagemProduto;
    }
    
    public Produto(String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela, String imagemProduto) {
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
        this.imagemProduto = imagemProduto;
    }

    
    // Getters e Setters
    public Integer getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Integer codProduto) {
        this.codProduto = codProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatusProduto() {
        return statusProduto;
    }

    public void setStatusProduto(String statusProduto) {
        this.statusProduto = statusProduto;
    }

    public long getPrecoProduto() {
        return precoProduto;
    }

    public void setPrecoProduto(long precoProduto) {
        this.precoProduto = precoProduto;
    }

    public long getQtdProduto() {
        return qtdProduto;
    }

    public void setQtdProduto(long qtdProduto) {
        this.qtdProduto = qtdProduto;
    }

    public int getQtdEstrela() {
        return qtdEstrela;
    }

    public void setQtdEstrela(int qtdEstrela) {
        this.qtdEstrela = qtdEstrela;
    }

    public String getImagemProduto() {
        return imagemProduto;
    }

    public void setImagemProduto(String imagemProduto) {
        this.imagemProduto = imagemProduto;
    }


}
