package br.senac.sp.entidade;

import java.util.List;

public class Produto {

    private Integer codProduto;
    private String nomeProduto;
    private String descricao;
    private String statusProduto;
    private long precoProduto;
    private long qtdProduto;
    private int qtdEstrela;
    private List<String> imagemProduto;
    
    private int qntCarrinho = 1;
    //private double subTotal = 0;

    // Construtores
    public Produto() {
    }

    public Produto(Integer codProduto, String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela, List<String> imagens ) {
        this.codProduto = codProduto;
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
        this.imagemProduto = imagens;
    }
    

    //Cadastro com Imagem
    public Produto(String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela, List<String> imagens ) {
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
        this.imagemProduto = imagens;
    }
    
    // Listagem dos produtos
    public Produto(Integer codProduto, String nomeProduto, String descricao, String statusProduto, long precoProduto, long qtdProduto, int qtdEstrela ) {
        this.nomeProduto = nomeProduto;
        this.descricao = descricao;
        this.statusProduto = statusProduto;
        this.precoProduto = precoProduto;
        this.qtdProduto = qtdProduto;
        this.qtdEstrela = qtdEstrela;
    }
    
    public List<String> getImagemProduto() {
        return imagemProduto;
    }

    public void setImagemProduto(List<String> imagemProduto) {
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

    public int getQntCarrinho() {
        return qntCarrinho;
    }

    public void setQntCarrinho(int qntCarrinho) {
        this.qntCarrinho = qntCarrinho;
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

}
