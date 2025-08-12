package Atributos;

import app.Utilitarios.ConexaoBanco;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AtributosDAO {
        
    private ConexaoBanco dataBase;
        
    public AtributosDAO() {
        dataBase = new ConexaoBanco("CardAdventure");
        dataBase.abrirConexao();
    }
    
public List<AtributosBean> listarAtributosPorCard(int id_card) {
    List<AtributosBean> lista = new ArrayList<>();

    String sql = "SELECT chave, valor " +
                 "FROM atributos " +
                 "WHERE fk_card = ? " +
                "  AND lower(chave) NOT IN ('img', 'nome', 'obs', 'bandeira') " + // ignora img e nome
                 "ORDER BY chave";

    try (PreparedStatement ps = dataBase.getConexao().prepareStatement(sql)) {
        ps.setInt(1, id_card);            

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                AtributosBean atributo = new AtributosBean();
                atributo.setChave(rs.getString("chave"));
                atributo.setValor(rs.getString("valor"));
                lista.add(atributo);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return lista;
}

    public void adicionarAtributos(AtributosBean atributo) {
        String sql = "INSERT INTO atributos (fk_card, chave, valor) VALUES (?, ?, ?)";
        try (PreparedStatement ps = dataBase.getConexao().prepareStatement(sql)) {
            ps.setInt(1, atributo.getFk_card());
            ps.setString(2, atributo.getChave());
            ps.setString(3, atributo.getValor());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public void fecharConexao() {
        dataBase.fecharConexao();
    }      
}
