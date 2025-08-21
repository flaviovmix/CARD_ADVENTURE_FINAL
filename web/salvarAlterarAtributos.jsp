<%@page import="Atributos.AtributosDAO"%>
<%@page import="Atributos.AtributosBean"%>
<%@page import="java.util.Arrays"%>
<%
    int idCard = Integer.parseInt(request.getParameter("id_card"));
    String[] chaves  = request.getParameterValues("attrChave[]");
    String[] valores = request.getParameterValues("attrValor[]");

    if (chaves != null && valores != null && chaves.length == valores.length) {
        AtributosDAO dao = new AtributosDAO();

        for (int i = 0; i < chaves.length; i++) {
            String chave = chaves[i] != null ? chaves[i].trim() : "";
            String valor = valores[i] != null ? valores[i].trim() : "";

            if (!chave.isEmpty() && !valor.isEmpty()) {
                AtributosBean atributo = new AtributosBean();
                atributo.setFk_card(idCard);
                atributo.setChave(chave);
                atributo.setValor(valor);
                
                dao.adicionarAtributos(atributo);
            }
        }

        dao.fecharConexao();
    }

    response.sendRedirect("index.jsp");
%>
