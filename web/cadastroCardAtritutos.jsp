<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <title>Cadastrar Card</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      crossorigin="anonymous"
    />
    <style>
      .table-attrs td input { width: 100%; }
      .required::after { content: " *"; color: #dc3545; }
    </style>
  </head>
  <body class="bg-light">
    <div class="container py-4">
      <h1 class="mb-4">Cadastrar Card</h1>

      <form action="salvarCard.jsp" method="get" class="needs-validation" novalidate>
        <div class="row g-4">
          
          <!-- Coluna esquerda - dados do card -->
          <div class="col-lg-6">
            <div class="mb-3">
              <label class="form-label required" for="nome">Nome</label>
              <input type="text" class="form-control" id="nome" name="nome" required />
              <div class="invalid-feedback">Informe o nome.</div>
            </div>

            <div class="mb-3">
              <label class="form-label" for="descricao">Descrição</label>
              <textarea class="form-control" id="descricao" name="descricao" rows="2"></textarea>
            </div>
            <div class="mt-4">
              <button type="submit" class="btn btn-success w-25 me-3">Salvar</button>
              <a href="index.jsp" class="btn btn-outline-secondary w-25">Cancelar</a>
            </div>
          </div>

          <!-- Coluna direita - atributos -->
          <div class="col-lg-6">
            <div class="d-flex align-items-center justify-content-between mb-2">
              <h5 class="m-0">Atributos</h5>
              <div>
                <button type="button" id="btnAddLinha" class="btn btn-sm btn-primary">+ Adicionar atributo</button>
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
                    <td><input type="text" class="form-control bg-transparent text-muted" name="attrChave[]" value="Nome personagem" disabled /></td>
                    <td><input type="text" class="form-control" name="attrValor[]" value="" placeholder="ex.: FULANA" required/></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                    </td>
                  </tr>
                  <tr>
                    <td><input type="text" class="form-control bg-transparent text-muted" name="attrChave[]" value="Img" disabled/></td>
                    <td><input type="text" class="form-control" name="attrValor[]" value="" placeholder="ex.: peach.png" required/></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                    </td>
                  </tr>
                  <tr>
                    <td><input type="text" class="form-control bg-transparent text-muted" name="attrChave[]" value="Bandeira" disabled/></td>
                    <td><input type="text" class="form-control" name="attrValor[]" value="" placeholder="ex.: brasil.png" required/></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                    </td>
                  </tr>
                  <tr>
                    <td><input type="text" class="form-control bg-transparent text-muted" name="attrChave[]" value="Obs" disabled/></td>
                    <td><textarea class="form-control" name="attrValor[]" id="descricao" rows="1" maxlength="90" placeholder="ex.: Vive no mundo dos cogumelos" required></textarea></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-sm btn-outline-secondary" disabled>Remover</button>
                    </td>
                  </tr>
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
          </div>

        </div>


      </form>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>

      <script src="./assets/js/card/preencherAtributos.js" ></script>
  </body>
</html>
