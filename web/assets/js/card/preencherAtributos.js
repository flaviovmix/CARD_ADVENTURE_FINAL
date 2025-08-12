(function () {
  if (window.__attrsInitAdd) return;
  window.__attrsInitAdd = true;

  const MAX_EXTRAS = 8;

  function qs(id){ return document.getElementById(id); }
  function contarExtras(tbodyForm){
    // conta apenas linhas com attrChave[] editável (não hidden)
    return tbodyForm.querySelectorAll('tr input[name="attrChave[]"]:not([type="hidden"])').length;
  }
  function atualizarEstadoBotoes(){
    const tbodyForm = qs("tbodyAtributos"); if (!tbodyForm) return;
    const btnAddUm = qs("btnAddLinha");
    const btnAdd8  = qs("btnAdd8");
    const extras = contarExtras(tbodyForm);
    const restante = Math.max(0, MAX_EXTRAS - extras);
    if (btnAddUm) btnAddUm.disabled = restante <= 0;
    if (btnAdd8) {
      btnAdd8.disabled = restante <= 0;
      btnAdd8.textContent = restante >= 8 ? "+ Adicionar 8" : `+ Adicionar ${restante}`;
    }
  }
  function criarLinha(indiceOpcional){
    const tpl = qs("tplLinhaAtributo"); if (!tpl) return null;
    const node = tpl.content.firstElementChild.cloneNode(true);
    const inpChave = node.querySelector('input[name="attrChave[]"]');
    const inpValor = node.querySelector('input[name="attrValor[]"]');
    // use placeholder (melhor UX) — mude para .value se quiser preencher automaticamente
    if (indiceOpcional != null) {
      if (inpChave) inpChave.value = `chave`;
      if (inpValor) inpValor.value = `valor`;
    }
    return node;
  }
  function adicionarNLinhas(n){
    const tbodyForm = qs("tbodyAtributos"); if (!tbodyForm) return;
    const extras = contarExtras(tbodyForm);
    const restante = Math.max(0, MAX_EXTRAS - extras);
    const qtd = Math.min(n, restante);
    
    if (qtd <= 0) return;

    const frag = document.createDocumentFragment();
    for (let i = 1; i <= qtd; i++) {
      const linha = criarLinha(extras + i);
      if (linha) frag.appendChild(linha);
    }
    tbodyForm.appendChild(frag);

    if (typeof window.renderExtras === "function") window.renderExtras();
    atualizarEstadoBotoes();
  }

  // Captura: um único handler, lê data-n (1 ou 8)
  document.addEventListener("click", function (e) {
    const botao = e.target.closest("#btnAddLinha, #btnAdd8, .btnRemoverLinha");
    if (!botao) return;

    // trava outros handlers
    e.preventDefault();
    e.stopImmediatePropagation();
    e.stopPropagation();

    if (botao.classList.contains("btnRemoverLinha")) {
      const tr = botao.closest("tr");
      if (tr) {
        tr.remove();
        if (typeof window.renderExtras === "function") window.renderExtras();
        atualizarEstadoBotoes();
      }
      return;
    }

    const n = Number(botao.dataset.n || 1);
    adicionarNLinhas(isNaN(n) ? 1 : n);
  }, { capture: true });

  document.addEventListener("DOMContentLoaded", atualizarEstadoBotoes);
})();
