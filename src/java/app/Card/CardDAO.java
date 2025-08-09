package app.Card;

import app.MinhaConexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CardDAO {
    
    private MinhaConexao dataBase;

    public CardDAO() {
        dataBase = new MinhaConexao("CardAdventure");
        dataBase.abrirConexao();
    }

    public void adicionarCard(CardBean card) {
        
        String sql = "INSERT INTO cards (nome, descricao) VALUES"
                   + "(?, ?)";
        
        try (PreparedStatement ps = dataBase.getConexao().prepareStatement(sql)) {
            
            ps.setString(1, card.getNome());
            ps.setString(2, card.getDescricao());
            
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
            
    }
    
    public void excluirCard(Integer id_card) {
        
        String sql = "DELETE FROM cards WHERE id_card = ?";
        
        try (PreparedStatement ps = dataBase.getConexao().prepareStatement(sql)) {
            
            ps.setInt(1, id_card);
            ps.executeUpdate(); 
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public List<CardBean> listarTodosCards() {
        List<CardBean> lista = new ArrayList<>();

        if (dataBase == null || dataBase.getConexao() == null) {
            System.err.println("Conexão com banco de dados não inicializada!");
            return lista;
        }

        String sql = "SELECT id_card, nome, descricao FROM cards ORDER BY nome";
        
        try (
                PreparedStatement ps = dataBase.getConexao().prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
            ) {
            
            while (rs.next()) {
                CardBean card = new CardBean();
                card.setId_card(rs.getInt("id_card"));
                card.setNome(rs.getString("nome"));
                card.setDescricao(rs.getString("descricao"));
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
