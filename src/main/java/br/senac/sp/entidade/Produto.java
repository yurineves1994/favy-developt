/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.entidade;

/**
 *
 * @author yurin
 */
public class Produto {

    private Integer id_produto;
    private String nomeProduto;
    private String nomeProdutoExtenso;
    private Long precoProduto;
    private Long quantidade;
    private String status;
    private boolean ativado;

    // Construtores
    public Produto() {
    }

    public Produto(Integer id_produto, String nomeProduto, String nomeProdutoExtenso, Long precoProduto, Long quantidade, String status) {
        this.id_produto = id_produto;
        this.nomeProduto = nomeProduto;
        this.nomeProdutoExtenso = nomeProdutoExtenso;
        this.precoProduto = precoProduto;
        this.quantidade = quantidade;
        this.status = status;
    }

    
    public Produto(String nomeProduto, String nomeProdutoExtenso, Long precoProduto, Long quantidade, String status, boolean ativado) {
        this.nomeProduto = nomeProduto;
        this.nomeProdutoExtenso = nomeProdutoExtenso;
        this.precoProduto = precoProduto;
        this.quantidade = quantidade;
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

    public Long getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Long quantidade) {
        this.quantidade = quantidade;
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
