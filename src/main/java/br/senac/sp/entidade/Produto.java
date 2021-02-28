package br.senac.sp.entidade;

public class Produto {

    private Integer id_produto;
    private String nomeProduto;
    private String nomeProdutoExtenso;
    private Long qtd_estrela;
    private Long precoProduto;
    private String status;
    private boolean ativado;

    // Construtores
    public Produto() {
    }

    public Produto(Integer id_produto, String nomeProduto, String nomeProdutoExtenso, Long precoProduto, Long qtd_estrela, String status, boolean ativado) {
        this.id_produto = id_produto;
        this.nomeProduto = nomeProduto;
        this.nomeProdutoExtenso = nomeProdutoExtenso;
        this.precoProduto = precoProduto;
        this.qtd_estrela = qtd_estrela;
        this.status = status;
        this.ativado = ativado;
    }

    
    // Getters e Setters
    public Integer getId_produto() {
        return id_produto;
    }

    public void setId_produto(Integer id_produto) {
        this.id_produto = id_produto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getNomeProdutoExtenso() {
        return nomeProdutoExtenso;
    }

    public void setNomeProdutoExtenso(String nomeProdutoExtenso) {
        this.nomeProdutoExtenso = nomeProdutoExtenso;
    }

    public Long getPrecoProduto() {
        return precoProduto;
    }

    public void setPrecoProduto(Long precoProduto) {
        this.precoProduto = precoProduto;
    }

    public Long getQtd_estrela() {
        return qtd_estrela;
    }

    public void setQtd_estrela(Long qtd_estrela) {
        this.qtd_estrela = qtd_estrela;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isAtivado() {
        return ativado;
    }

    public void setAtivado(boolean ativado) {
        this.ativado = ativado;
    }
    

}
