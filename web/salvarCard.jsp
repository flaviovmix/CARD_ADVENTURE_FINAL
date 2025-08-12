<%@page import="card.CardDAO"%>
<%@page import="card.CardBean"%>
<%
    CardBean card = new CardBean();
    CardDAO dao = new CardDAO();

    card.setId_card(Integer.parseInt(request.getParameter("id_card")));
    card.setTitulo(request.getParameter("titulo"));
    card.setDescricao(request.getParameter("descricao"));
    
    if (card.getId_card()==0){
        dao.adicionarCard(card);
    } else {
        dao.alterarCard(card);
    }
    response.sendRedirect("cadastroCardAtritutos.jsp?id_card=" + card.getId_card() + "&novoOuEditar=1");
    
    dao.fecharConexao();
%>