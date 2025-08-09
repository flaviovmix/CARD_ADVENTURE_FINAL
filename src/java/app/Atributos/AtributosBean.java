package app.Atributos;

public class AtributosBean {
    private int id_atritubo;
    private int fk_card;
    private String chave;
    private String valor;

    public int getId_atritubo() {
        return id_atritubo;
    }
    public void setId_atritubo(int id_atritubo) {
        this.id_atritubo = id_atritubo;
    }

    public int getFk_card() {
        return fk_card;
    }
    public void setFk_card(int fk_card) {
        this.fk_card = fk_card;
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
}