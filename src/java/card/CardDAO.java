package card;

import app.Utilitarios.ConexaoBanco;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CardDAO {
private ConexaoBanco conexaoBanco;

    public CardDAO() {
        conexaoBanco = new ConexaoBanco("CardAdventure");
        conexaoBanco.abrirConexao();
    }
    
    public List<CardBean> listarCards() {
        List<CardBean> lista = new ArrayList<>();
        String sql =
            "SELECT c.id_card, " +
            "       COALESCE((SELECT a.valor " +
            "                  FROM atributos a " +
            "                 WHERE a.fk_card = c.id_card AND a.chave ILIKE 'titulo' " +
            "                 ORDER BY a.id_atributo DESC " +
            "                 LIMIT 1), c.titulo) AS titulo, " + 
            "       c.descricao, " +
            "       COALESCE((SELECT a.valor " +
            "                  FROM atributos a " +
            "                 WHERE a.fk_card = c.id_card AND a.chave ILIKE 'obs' " +
            "                 ORDER BY a.id_atributo DESC " +
            "                 LIMIT 1), c.titulo) AS obs, " + 
            "       c.descricao, " +
            "       COALESCE((SELECT a.valor " +
            "                  FROM atributos a " +
            "                 WHERE a.fk_card = c.id_card AND a.chave ILIKE 'bandeira' " +
            "                 ORDER BY a.id_atributo DESC " +
            "                 LIMIT 1), c.titulo) AS bandeira, " + 
            "       c.descricao, " +
            "       (SELECT a.valor " +
            "          FROM atributos a " +
            "         WHERE a.fk_card = c.id_card AND a.chave ILIKE 'img' " +
            "         ORDER BY a.id_atributo DESC " +
            "         LIMIT 1) AS img " +
            "  FROM cards c " +
            " ORDER BY c.id_card";



        try (PreparedStatement ps = conexaoBanco.getConexao().prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CardBean card = new CardBean();
                card.setId_card(rs.getInt("id_card"));
                card.setTitulo(rs.getString("titulo"));
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

    public void adicionarTarefa(CardBean card) {
    String sql = "INSERT INTO cards (nome, descricao) " +
                 "VALUES (?, ?, ) RETURNING id_card;";

        try (PreparedStatement ps = conexaoBanco.getConexao().prepareStatement(sql);
             ) {
            ps.setString(1, card.getTitulo());
            ps.setString(2, card.getDescricao());

            try (ResultSet rs = ps.executeQuery()) { // <- usa executeQuery por causa do RETURNING
                if (rs.next()) {
                    card.setId_card(rs.getInt("id_card"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void fecharConexao() {
        conexaoBanco.fecharConexao();
    }        
}
