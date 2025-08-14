
<%@page import="Atributos.AtributosBean"%>
<%@page import="Atributos.AtributosDAO"%>
<%@page import="java.util.List"%>
<%@page import="card.CardBean"%>
<%@page import="card.CardDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CardDAO cardDAO = new CardDAO();
    List<CardBean> cards = cardDAO.listarCards();
    cardDAO.fecharConexao();
%>

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/card/card.css">
    <link rel="stylesheet" href="./assets/css/card/area-info-personagem.css">
    <link rel="stylesheet" href="./assets/css/card/normalize.css">
    <link rel="stylesheet" href="./assets/css/card/responsividade.css">
    
    <!-- links pessoais -->
    <link rel="stylesheet" href="style.css">
  </head>
  <body>

    <header>

      <!-- barra de menus -->
      <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container">
          <a class="navbar-brand" href="#">
              <img class="img_logo" src="assets/svg/logo.png" alt="">
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">

              <li class="nav-item">
                <a class="nav-link" href="cadastroCardAtritutos.jsp?novoOuEditar=0">Novo Registro</a>
              </li>
              <li class="nav-item">
                <div>
                  <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">                    
                        DropDown
                      </a>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </li>

            </ul>
                <div>
                  <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">                    
                        DropDown
                      </a>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
            <form class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="Digite sua busca aqui." aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Pesquisar</button>
            </form>
          </div>
        </div>
      </nav>

    </header>

    <main>

        <div class="container-xl">
            
            <% 
                AtributosDAO atributoDAO = new AtributosDAO();
                for (CardBean card : cards) { 
            %>
            
            <div class="card card-selecionado">

              <div class="menu-lateral-card">
                <div class="area-icones-thumb">
                  <a href=""><img src="./assets/pixel_ai/t-5.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-5.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-5.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-5.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-4.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-3.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-2.png" alt=""></a>
                  <a href="#"><img src="./assets/pixel_ai/t-1.png" title="Aqui vai uma explicação do que o ícone faz." alt=""></a>
                </div>

                <div class="controle-card">
                    <a href="#"><img class="svg" src="./assets/svg/apagar.svg" alt=""></a>
                    <a href="#"><img class="svg" src="./assets/svg/compartilhar.svg" alt=""></a>
                    <a href="cadastroCardAtritutos.jsp?id_card=<%= card.getId_card() %>&novoOuEditar=1"><img class="svg" src="./assets/svg/editar.svg" alt=""></a>
                    <a href="#"><img class="svg" src="./assets/svg/baixar.svg" alt=""></a>
                </div>

                <div class="controle-card">
                  <a href="deletarCard.jsp?id_card=<%= card.getId_card() %>"><img class="svg lixeira" src="./assets/svg/lixeira.svg" alt=""></a>
                </div>
              </div>

              <div class="menu-bolinha btnMenuBolinhaCard amostra">
                <!-- Removi o id duplicado do SVG -->
                <svg xmlns="http://www.w3.org/2000/svg" x="0" y="0" width="349.569" height="349.569"
                     viewBox="0 0 349.569 349.569" xml:space="preserve" aria-hidden="true" focusable="false">
                  <g>
                    <g>
                      <circle cx="39.081" cy="54.785" r="39.081" />
                      <circle cx="39.081" cy="174.785" r="39.081" />
                      <circle cx="39.081" cy="294.785" r="39.081" />
                      <g>
                        <path d="M344.569,20.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5
                        C349.569,22.778,347.326,20.535,344.569,20.535z" />
                        <path d="M344.569,140.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5
                        C349.569,142.778,347.326,140.535,344.569,140.535z" />
                        <path d="M344.569,260.535H113.581c-2.757,0-5,2.243-5,5v58.5c0,2.757,2.243,5,5,5h230.988c2.757,0,5-2.243,5-5v-58.5
                        C349.569,262.778,347.326,260.535,344.569,260.535z" />
                      </g>
                    </g>
                  </g>
                </svg>
              </div>

              <div class="conteudo-card">
                <!-- Removi id="areaInfoPersonagem" (já há class) -->
                <div class="area-info-personagem">
                  <div class="cabecalho">
                    <img class="bandeira" src="./assets/pixel_ai/<%= card.getBandeira() %>" alt="">
                    <div class="are-face">
                      <img class="face" src="./assets/pixel_ai/<%= card.getImg() %>" alt="">
                    </div>

                    <div class="classificacao">
                      <a href="#"><img src="./assets/pixel_ai/ESTRELA_1-4.png" alt=""></a>
                      <a href="#"><img src="./assets/pixel_ai/ESTRELA_1-4.png" alt=""></a>
                      <a href="#"><img src="./assets/pixel_ai/ESTRELA_1-4.png" alt=""></a>
                      <a href="#"><img src="./assets/pixel_ai/ESTRELA_1-4.png" alt=""></a>
                      <a href="#"><img src="./assets/pixel_ai/ESTRELA_5.png" alt=""></a>
                    </div>
                  </div>

                  <div class="tabela">
                    <table>
                      <tbody>
                        <%
                          List<AtributosBean> atributos = atributoDAO.listarAtributosPorCard(card.getId_card());
                          for (AtributosBean atributo : atributos) {
                        %>
                          <tr>
                            <td class="chave"><strong><%= atributo.getChave() %>:</strong></td>
                            <td><%= atributo.getValor() %></td>
                          </tr>
                        <% } %>
                        <tr class="obs"><td colspan="2" class="obs"><%= card.getObs() %></td></tr>
                        
                      </tbody>
                    </table>
                  </div>
                </div>

                <img class="img-principal" src="./assets/pixel_ai/<%= card.getImg() %>" alt="imagem da personagem ${i}" />

                <!-- Título agora só com classes -->
                <div class="area-titulo-da-fase mostrar" data-nome="<%= card.getNome() %>">
                  <span class="area-titulo-texto"><%= card.getNome() %></span>
                </div>
              </div>

              <div class="area-link-fases">
                <a href="#" data-titulo="TRAJES NORMAIS"><img class="icone" src="./assets/pixel_ai/emoje-1.png" /></a>
                <a href="#" data-titulo="PISCINA"><img class="icone" src="./assets/pixel_ai/emoje-2.png" /></a>
                <a href="#" data-titulo="LENDO"><img class="icone" src="./assets/pixel_ai/emoje-3.png" /></a>
                <a href="#" data-titulo="DORMINDO"><img class="icone" src="./assets/pixel_ai/emoje-4.png" /></a>
                <a href="#" data-titulo="BANHO"><img class="icone" src="./assets/pixel_ai/emoje-5.png" /></a>
                <a href="#" data-titulo="NUA"><img class="icone" src="./assets/pixel_ai/emoje-6.png" /></a>
              </div>

            </div>
  
                    
            <% } %>
        </div>
    </main>
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="./assets/js/card/mostrarAreaInfoPersonagem.js"></script>
    <script src="./assets/js/card/alterarNomeFase.js"></script>
    <script src="./assets/js/card/mostrarMenuLateralCard.js"></script>
  </body>
  
</html>