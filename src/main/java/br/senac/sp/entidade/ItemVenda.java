package br.senac.sp.entidade;

public class ItemVenda {

    private Integer codItem;
    private String nomeItem;
    private Integer qtdItem;
    private double precoUnitario;
    private double precoTotal;
    private Integer codPedido;
    private double freteTotal;

    public ItemVenda(Integer codItem, String nomeItem, Integer qtdItem, double precoUnitario, double precoTotal, Integer codPedido, double freteTotal) {
        this.codItem = codItem;
        this.nomeItem = nomeItem;
        this.qtdItem = qtdItem;
        this.precoUnitario = precoUnitario;
        this.precoTotal = precoTotal;
        this.codPedido = codPedido;
        this.freteTotal = freteTotal;
    }

    public ItemVenda(Integer codItem, String nomeItem, Integer qtdItem, double precoUnitario, double precoTotal, Integer codPedido) {
        this.codItem = codItem;
        this.nomeItem = nomeItem;
        this.qtdItem = qtdItem;
        this.precoUnitario = precoUnitario;
        this.precoTotal = precoTotal;
        this.codPedido = codPedido;
    }

    public ItemVenda(String nomeItem, Integer qtdItem, double precoUnitario, double precoTotal) {
        this.nomeItem = nomeItem;
        this.qtdItem = qtdItem;
        this.precoUnitario = precoUnitario;
        this.precoTotal = precoTotal;
    }

    public Integer getCodItem() {
        return codItem;
    }

    public void setCodItem(Integer codItem) {
        this.codItem = codItem;
    }

    public String getNomeItem() {
        return nomeItem;
    }

    public void setNomeItem(String nomeItem) {
        this.nomeItem = nomeItem;
    }

    public Integer getQtdItem() {
        return qtdItem;
    }

    public void setQtdItem(Integer qtdItem) {
        this.qtdItem = qtdItem;
    }

    public double getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }

    public double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(double precoTotal) {
        this.precoTotal = precoTotal;
    }

    public double getFreteTotal() {
        return freteTotal;
    }

    public void setFreteTotal(double freteTotal) {
        this.freteTotal = freteTotal;
    }

    public Integer getCodPedido() {
        return codPedido;
    }

    public void setCodPedido(Integer codPedido) {
        this.codPedido = codPedido;
    }

}
