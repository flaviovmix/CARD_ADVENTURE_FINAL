package app.Atributos;

import app.MinhaConexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AtributosDAO {
    private MinhaConexao dataBase;

    public AtributosDAO() {
        dataBase = new MinhaConexao("CardAdventure");
        dataBase.abrirConexao();
    }
    
    public List<AtributosBean> listarAtributosPorCard(int id_card) {
        List<AtributosBean> lista = new ArrayList<>();

        String sql = "SELECT chave, valor FROM atributos WHERE fk_card = ? ORDER BY chave";

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
        public void fecharConexao() {
            dataBase.fecharConexao();
        }  
}
