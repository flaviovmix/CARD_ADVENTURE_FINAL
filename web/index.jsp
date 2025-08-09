<%@page import="app.Atributos.AtributosBean"%>
<%@page import="app.Atributos.AtributosDAO"%>
<%@page import="java.util.List"%>
<%@page import="app.Card.CardDAO"%>
<%@page import="app.Card.CardBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CardDAO cardDAO = new CardDAO();
    List<CardBean> cards = cardDAO.listarTodosCards();
    cardDAO.fecharConexao();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meus Cards</title>
</head>
<body style="width: 500px">
    <h1>Lista de Cards</h1>
    
    <a href="formNovoCard.jsp">Novo Card</a>

    <%
    AtributosDAO atributoDAO = new AtributosDAO();

    for (CardBean card : cards) {
    %>
        <div style="border: 1px solid #ccc; padding: 10px; margin: 5px;">
            <h3><%= card.getNome() %></h3>

            <!-- Tabela de atributos -->
            <table border="1" cellpadding="5" cellspacing="0" style="margin-top:10px;">
                <tr>
                    <th>Chave</th>
                    <th>Valor</th>
                </tr>
                <%
                    List<AtributosBean> atributos = atributoDAO.listarAtributosPorCard(card.getId_card());
                    for (AtributosBean atributo : atributos) {
                %>
                    <tr>
                        <td><%= atributo.getChave() %></td>
                        <td><%= atributo.getValor() %></td>
                    </tr>
                <%
                    }
                %>
            </table>
            <p><%= card.getDescricao() %></p>
            <a href="excluirCard.jsp?id_card=<%= card.getId_card() %>">Excluir</a>
        </div>
    <%
    }
    %>


</body>
</html>
