<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="adicionarCard.jsp" method="get">
            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" required><br><br>

            <label for="descricao">Descrição:</label><br>
            <textarea id="descricao" name="descricao" rows="4" required></textarea><br><br>



            <button type="submit">Salvar</button>
        </form>
    </body>
</html>
