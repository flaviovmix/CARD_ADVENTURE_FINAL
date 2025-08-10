package app.Utilitarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBanco {
    private final String host;
    private final String porta;
    private final String banco;
    private final String usuario;
    private final String senha;

    private Connection conexaoComBanco;

    public ConexaoBanco(String nomeDoBanco) {
        banco = nomeDoBanco;
        host = "localhost";
        porta = "5432";
        usuario = "postgres";
        senha = "masterkey";
    }

    public Connection abrirConexao() {
        String url = "jdbc:postgresql://" + host + ":" + porta + "/" + banco;

        try {
            Class.forName("org.postgresql.Driver");
            conexaoComBanco = DriverManager.getConnection(url, usuario, senha);
        } catch (SQLException erro) {
            System.out.println("Erro ao conectar ao banco: " + erro.getMessage());
        } catch (ClassNotFoundException erro) {
            System.out.println("Driver JDBC não encontrado: " + erro.getMessage());
        } catch (Exception erro) {
            System.out.println("Erro inesperado: " + erro.getMessage());
        }

        return conexaoComBanco;
    }

    public void fecharConexao() {
        try {
            if (conexaoComBanco != null && !conexaoComBanco.isClosed()) {
                conexaoComBanco.close();
            }
        } catch (SQLException erro) {
            System.out.println("Erro ao fechar conexão: " + erro.getMessage());
        }
    }

    public Connection getConexao() {
        return conexaoComBanco;
    }

    public void setConexao(Connection conexao) {
        this.conexaoComBanco = conexao;
    }
}
