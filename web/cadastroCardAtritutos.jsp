<%@page import="Atributos.AtributosDAO"%>
<%@page import="Atributos.AtributosBean"%>
<%@page import="java.util.List"%>
<%@page import="app.Utilitarios.Utilidades"%>
<%@page import="card.CardDAO"%>
<%@page import="card.CardBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CardBean card = new CardBean();
    CardDAO cardDAO = new CardDAO();
    
    String id_card = request.getParameter("id_card");
            
    if (request.getParameterMap().containsKey("id_card")) {
        card.setId_card(Integer.parseInt(request.getParameter("id_card")));
        cardDAO.cardUnico(card);
    }
    
    Integer novoOuEditar = 0;
    if (request.getParameterMap().containsKey("novoOuEditar")) {
        novoOuEditar = Integer.parseInt(request.getParameter("novoOuEditar"));
    }
    
    AtributosDAO atributoDAO = new AtributosDAO();
    List<AtributosBean> atributos = atributoDAO.listarAtributosPorCard(card.getId_card());
%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <title>Cadastrar Card</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    
    <link rel="stylesheet" href="./assets/css/card/area-info-personagem.css">
    <link rel="stylesheet" href="./assets/css/card/normalize.css">
    <link rel="stylesheet" href="./assets/css/card/responsividade.css">
    <link rel="stylesheet" href="./assets/css/card/card.css">

  </head>
  <body class="bg-light">
      
    <div class="container py-4 mt-1">
        <h1 class="mb-4 mt-0">Novo Card</h1>
        
        <div class="row g-4">
        
          <div class="col-lg-6 ">
            <button id="btn-editar" type="reset" class="btn btn-warning w-25 mb-3"  onclick="link('index.jsp')">Voltar</button>  
            <form action="salvarCard.jsp" method="get" class="needs-validation" novalidate>
                <div class="<% if (novoOuEditar == 1) { %> opaco <% } %> ">
              <div class="mb-3">
                <input type="hidden" name="id_card" value="<%=  Utilidades.nullTrim(card.getId_card()) %>">
                <label class="form-label required" for="nome">Nome</label>
                <input type="text" class="form-control" id="nome" name="titulo" required value="<%=  Utilidades.nullTrim(card.getTitulo()) %>"/>
                <div class="invalid-feedback">Informe o nome.</div>
              </div>

              <div class="mb-3">
                <label class="form-label" for="descricao">Descrição</label>
                <textarea class="form-control" id="descricao" name="descricao" rows="1"><%=  Utilidades.nullTrim(card.getDescricao()) %></textarea>
              </div>
              </div>
              <% if (novoOuEditar == 0) { %>
                    <div class="mt-4 text-center">
                      <button type="submit" class="btn btn-success w-25 me-3">Salvar</button>
                      <a href="index.jsp" class="btn btn-outline-secondary w-25">Cancelar</a>
                    </div>
              <% } %> 
              <% if (novoOuEditar == 1) { %>         
                    <div class="mt-4 text-center">
                        <button id="btn-editar" type="reset" class="btn btn-primary w-25 me-3"  onclick="link('cadastroCardAtritutos.jsp?id_card=<%= card.getId_card() %>&novoOuEditar=0')">Editar</button>
                    </div>
              <% } %> 
            </form>
              
            <div class="container-xl <% if (novoOuEditar == 0) { %> opaco <% } %>">
                <div class="card card-selecionado">

                    <div class="menu-lateral-card">
                      <div class="area-icones-thumb">
                        <a href="#"><img src="./assets/pixel_ai/t-5.png" alt=""></a>
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
                          <a href="#"><img class="svg" src="./assets/svg/editar.svg" alt=""></a>
                          <a href="#"><img class="svg" src="./assets/svg/baixar.svg" alt=""></a>
                      </div>

                      <div class="controle-card">
                        <a href="#"><img class="svg lixeira" src="./assets/svg/lixeira.svg" alt=""></a>
                      </div>
                    </div>

                    <div class="menu-bolinha btnMenuBolinhaCard amostra">
                      
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
                      
                      <div class="area-info-personagem">
                          
                        <div class="cabecalho">
                            
                          <img class="bandeira" src="./assets/pixel_ai/bandeira.png" alt="">
                          
                          <div class="are-face">
                            <img class="face" src="./assets/pixel_ai/modelo.png" alt="">
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
                                <tr>
                                    <td class="chave"><strong>Chave:</strong></td>
                                    <td>valor</td>
                                </tr>
                                <tr class="obs"><td colspan="2" class="obs">Obs vai aqui</td></tr>
                            </tbody>
                          </table>
                        </div>
                      </div>

                      <img class="img-principal" src="./assets/pixel_ai/modelo.png" alt="imagem da personagem" />

                      <div class="area-titulo-da-fase mostrar" data-nome="NOME">
                        <span class="area-titulo-texto">NOME</span>
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
            </div>
              
          </div>
          

          <!-- Coluna direita - atributos -->
          <div class="col-lg-6">
              
            <form 
                action="salvarAlterarAtributos.jsp" 
                method="get" 
                class="
                    needs-validation 
                    <% if (novoOuEditar == 0) { %> opaco <% } %> " 
            >
                
                <input type="hidden" name="id_card" value="<%= id_card %>">
                <div class="d-flex align-items-center justify-content-between mb-2 atributos">
                    <h5 class="m-0">Atributos</h5>
                    <div>
                        <button type="button" id="btnAddLinha" class="btn btn-sm btn-primary" data-n="1">+ Adicionar atributo</button>
                        <button type="button" id="btnAdd8" class="btn btn-sm btn-secondary ms-2" data-n="8">+ Adicionar 8</button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered align-middle table-attrs">
                      <thead class="table-light">
                        <tr>
                          <th style="width: 35%">Chave</th>
                          <th>Valor</th>
                          <th style="width: 70px">Ações</th>
                        </tr>
                      </thead>
                      <tbody id="tbodyAtributos">
                        <tr>
                          <td>
                            <input type="text" class="form-control bg-transparent text-muted"
                                   value="Nome personagem" disabled />
                            <input type="hidden" name="attrChave[]" value="Nome" />
                          </td>
                          <td>
                            <input type="text" class="form-control" name="attrValor[]"
                                   placeholder="ex.: FULANA" required value="FULANA" />
                          </td>
                          <td class="text-center">
                            <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                          </td>
                        </tr>

                        <tr>
                          <td>
                            <input type="text" class="form-control bg-transparent text-muted"
                                   value="Img" disabled />
                            <input type="hidden" name="attrChave[]" value="Img" />
                          </td>
                          <td>
<!--                            <input type="text" class="form-control" name="attrValor[]"
                                   placeholder="ex.: modelo.png" required value="modelo.png" />-->

                        <select class="form-control" name="attrValor[]" required>
                            <option value="">Selecione...</option>
                            <option value="ino.png">ino</option>
                            <option value="videl.png">videl</option>
                            <option value="peach.png">peach</option>
                            <option value="chul-li.jpg">chul-li</option>
                            <option value="ravena.png">ravena</option>
                            <option value="sakura.png">sakura</option>
                            <option value="hinata.png">hinata</option>
                        </select>

                          </td>
                          <td class="text-center">
                            <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                          </td>
                        </tr>

                        <tr>
                          <td>
                            <input type="text" class="form-control bg-transparent text-muted"
                                   value="Bandeira" disabled />
                            <input type="hidden" name="attrChave[]" value="Bandeira" />
                          </td>
                          <td>
                            <input type="text" class="form-control" name="attrValor[]"
                                   placeholder="ex.: bandeira.png" required value="bandeira.png" />
                          </td>
                          <td class="text-center">
                            <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                          </td>
                        </tr>

                        <tr>
                          <td>
                            <input type="text" class="form-control bg-transparent text-muted"
                                   value="Obs" disabled />
                            <input type="hidden" name="attrChave[]" value="Obs" />
                          </td>
                          <td>
                            <textarea class="form-control" name="attrValor[]" rows="1" maxlength="90"
                                      placeholder="ex.: Observacao vai aqui" required>Observacao vai aqui</textarea>
                          </td>
                          <td class="text-center">
                            <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                          </td>
                        </tr>
                        
                        <%
                          for (AtributosBean atributo : atributos) {
                        %>
                            <tr>
                              <td>
                                <input type="text" class="form-control bg-transparent text-muted"
                                       value="<%= atributo.getChave() %>" disabled />
                                <input type="hidden" name="attrChave[]" value="Bandeira" />
                              </td>
                              <td>
                                <input type="text" class="form-control" name="attrValor[]"
                                       placeholder="ex.: bandeira.png" required value="<%= atributo.getValor() %>" />
                              </td>
                              <td class="text-center">
                                <button type="button" class="btn btn-sm btn-outline-danger btnRemoverLinha">Remover</button>
                              </td>
                            </tr>
                        <% } %>
                        
                      </tbody>
                    </table>

                    <div class="mt-4 text-center">
                      <button type="submit" class="btn btn-success mb-3 w-25">Salvar</button>
                    </div>
                </div>

                <p class="text-muted small">
                    Dica: (<code>Nome personagem, Img, Bandeira e Obs</code>),
                    são obrigatórios e não podem ser removidos.<br>
                    Pelo design do card, é possível adicionar no máximo <strong>8 novos atributos</strong>, 
                    e o campo <strong>Valor</strong> aceita até <strong>18 caracteres</strong>, o atrituto <strong>Obs</strong> possui um limite de <strong>90 caractere</strong>.
                </p>

            </form>
          </div>

        </div>
    </div>

    <!-- Template para nova linha -->
    <template id="tplLinhaAtributo">
      <tr>
        <td>
          <input type="text" class="form-control" name="attrChave[]" placeholder="ex.: força" maxlength="18" required/>
        </td>
        <td>
          <input type="text" class="form-control" name="attrValor[]" placeholder="ex.: 85"  maxlength="18" required/>
        </td>
        <td class="text-center">
          <button type="button" class="btn btn-sm btn-outline-danger btnRemoverLinha">Remover</button>
        </td>
      </tr>
    </template>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

      <script src="./assets/js/card/preencherAtributos.js" ></script>
      <script src="./assets/js/card/mostrarAreaInfoPersonagem.js"></script>
      <script src="./assets/js/card/alterarNomeFase.js"></script>
      <script src="./assets/js/card/mostrarMenuLateralCard.js"></script>
      <script src="./assets/js/card/preencherPreviaCard.js"></script> 
      <script src="./assets/js/Utilidades.js"></script>
      
  </body>
</html>
