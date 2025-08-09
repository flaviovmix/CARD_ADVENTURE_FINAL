<%@page import="app.Card.CardDAO"%>
<%@page import="app.Card.CardBean"%>
<%
    CardDAO cardDAO = new CardDAO();
    int id_card = Integer.parseInt(request.getParameter("id_card"));    
    
    cardDAO.excluirCard(id_card);
    
    response.sendRedirect("index.jsp");
%>