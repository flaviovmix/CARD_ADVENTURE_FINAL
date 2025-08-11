package card;

public class CardBean {
    private int id_card;
    private String titulo;
    private String descricao;
    private String obs;
    private String bandeira;
    private String img;

    public int getId_card() {
        return id_card;
    }
    public void setId_card(int id_card) {
        this.id_card = id_card;
    }

    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getObs() {
        return obs;
    }
    public void setObs(String obs) {
        this.obs = obs;
    }

    public String getBandeira() {
        return bandeira;
    }
    public void setBandeira(String bandeira) {
        this.bandeira = bandeira;
    }
    
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
    
}
