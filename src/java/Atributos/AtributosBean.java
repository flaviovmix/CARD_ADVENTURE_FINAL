package Atributos;

public class AtributosBean {
    private int id_atributo;
    private String chave;
    private String valor;
    private int fk_card;

    public int getId_atributo() {
        return id_atributo;
    }
    public void setId_atributo(int id_atributo) {
        this.id_atributo = id_atributo;
    }

    public String getChave() {
        return chave;
    }
    public void setChave(String chave) {
        this.chave = chave;
    }

    public String getValor() {
        return valor;
    }
    public void setValor(String valor) {
        this.valor = valor;
    }

    public int getFk_card() {
        return fk_card;
    }
    public void setFk_card(int fk_card) {
        this.fk_card = fk_card;
    }
    
}
