package card;

import app.Utilitarios.ConexaoBanco;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CardDAO {
private ConexaoBanco dataBase;

    public CardDAO() {
        dataBase = new ConexaoBanco("CardAdventure");
        dataBase.abrirConexao();
    }
    
    public List<CardBean> listarCards() {
        List<CardBean> lista = new ArrayList<>();
        String sql =
            "SELECT c.id_card, " +
            "       COALESCE((SELECT a.valor " +
            "                  FROM atributos a " +
            "                 WHERE a.fk_card = c.id_card AND a.chave ILIKE 'nome' " +
            "                 ORDER BY a.id_atributo DESC " +
            "                 LIMIT 1), c.nome) AS nome, " + 
            "       c.descricao, " +
            "       COALESCE((SELECT a.valor " +
            "                  FROM atributos a " +
            "                 WHERE a.fk_card = c.id_card AND a.chave ILIKE 'obs' " +
            "                 ORDER BY a.id_atributo DESC " +
            "                 LIMIT 1), c.nome) AS obs, " + 
            "       c.descricao, " +
            "       COALESCE((SELECT a.valor " +
            "                  FROM atributos a " +
            "                 WHERE a.fk_card = c.id_card AND a.chave ILIKE 'bandeira' " +
            "                 ORDER BY a.id_atributo DESC " +
            "                 LIMIT 1), c.nome) AS bandeira, " + 
            "       c.descricao, " +
            "       (SELECT a.valor " +
            "          FROM atributos a " +
            "         WHERE a.fk_card = c.id_card AND a.chave ILIKE 'img' " +
            "         ORDER BY a.id_atributo DESC " +
            "         LIMIT 1) AS img " +
            "  FROM cards c " +
            " ORDER BY c.id_card";



        try (PreparedStatement ps = dataBase.getConexao().prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CardBean card = new CardBean();
                card.setId_card(rs.getInt("id_card"));
                card.setNome(rs.getString("nome"));
                card.setDescricao(rs.getString("descricao"));
                card.setObs(rs.getString("obs"));
                card.setBandeira(rs.getString("bandeira"));
                card.setImg(rs.getString("img")); // vem do atributo
                lista.add(card);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    
    public void fecharConexao() {
        dataBase.fecharConexao();
    }        
}
