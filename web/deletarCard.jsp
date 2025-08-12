<%@page import="card.CardDAO"%>
<%@page import="card.CardBean"%>
<%
    int id_card = Integer.parseInt(request.getParameter("id_card"));
    
    CardDAO dao = new CardDAO();
    dao.excluirCard(id_card);
    dao.fecharConexao();
    
    response.sendRedirect("index.jsp");
    dao.fecharConexao();
%>