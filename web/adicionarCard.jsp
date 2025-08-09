<%@page import="app.Card.CardDAO"%>
<%@page import="app.Card.CardBean"%>
<%
    CardBean cardBean = new CardBean();
    CardDAO cardDAO = new CardDAO();
    
    cardBean.setNome(request.getParameter("nome"));
    cardBean.setDescricao(request.getParameter("descricao"));
    
    cardDAO.adicionarCard(cardBean);
    
    response.sendRedirect("index.jsp");

%>