package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MinhaConexao {

    private final String host;
    private final String porta;
    private final String banco;
    private final String usuario;
    private final String senha;

    private Connection conexao;

    public MinhaConexao(String banco) {
        this.banco = banco;
        this.host = "localhost";
        this.porta = "5432";
        this.usuario = "postgres";
        this.senha = "masterkey";
    }

    public Connection abrirConexao() {
        String url = "jdbc:postgresql://" + host + ":" + porta + "/" + banco;

        try {
            Class.forName("org.postgresql.Driver");
            this.conexao = DriverManager.getConnection(url, usuario, senha);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver JDBC não encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Erro ao conectar ao banco: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Erro inesperado: " + e.getMessage());
            e.printStackTrace();
        }

        return this.conexao;
    }

    public void fecharConexao() {
        try {
            if (this.conexao != null && !this.conexao.isClosed()) {
                this.conexao.close();
            }
        } catch (SQLException e) {
            System.out.println("Erro ao fechar conexão: " + e.getMessage());
        }
    }

    public Connection getConexao() {
        return this.conexao;
    }

    public void setConexao(Connection conexao) {
        this.conexao = conexao;
    }

}
