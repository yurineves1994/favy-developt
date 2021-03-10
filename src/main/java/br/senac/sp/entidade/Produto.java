package br.senac.sp.entidade;

public class Produto {

    private Integer codProduto;
    private String nomeProduto;
    private String descricao;
    private String statusProduto;
    private long precoProduto;
    private long qtdProduto;
    private int qtdEstrela;
    private String imagemProduto1;
    private String imagemProduto2;
    private String imagemProduto3;
    private String imagemProduto4;

    // Construtores
    public Produto() {
    }

    public Produto(Integer codProduto, String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela, String imagemProduto1, String imagemProduto2, String imagemProduto3, String imagemProduto4) {
        this.codProduto = codProduto;
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
        this.imagemProduto1 = imagemProduto1;
        this.imagemProduto2 = imagemProduto2;
        this.imagemProduto3 = imagemProduto3;
        this.imagemProduto4 = imagemProduto4;
    }
    
    public Produto(String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela, String imagemProduto1, String imagemProduto2, String imagemProduto3, String imagemProduto4) {
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
        this.imagemProduto1 = imagemProduto1;
        this.imagemProduto2 = imagemProduto2;
        this.imagemProduto3 = imagemProduto3;
        this.imagemProduto4 = imagemProduto4;
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

    public String getImagemProduto1() {
        return imagemProduto1;
    }

    public void setImagemProduto1(String imagemProduto1) {
        this.imagemProduto1 = imagemProduto1;
    }

    public String getImagemProduto2() {
        return imagemProduto2;
    }

    public void setImagemProduto2(String imagemProduto2) {
        this.imagemProduto2 = imagemProduto2;
    }

    public String getImagemProduto3() {
        return imagemProduto3;
    }

    public void setImagemProduto3(String imagemProduto3) {
        this.imagemProduto3 = imagemProduto3;
    }

    public String getImagemProduto4() {
        return imagemProduto4;
    }

    public void setImagemProduto4(String imagemProduto4) {
        this.imagemProduto4 = imagemProduto4;
    }


}
