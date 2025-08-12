
(function () {
  // evita rodar duas vezes se o arquivo for incluído mais de uma vez
  if (window.__attrsInitPreview) return;
  window.__attrsInitPreview = true;

  document.addEventListener("DOMContentLoaded", function () {
    const tbodyForm = document.getElementById("tbodyAtributos");

    // Elementos do card (os estáticos)
    const elTitulo    = document.querySelector(".area-titulo-texto");
    const elImg       = document.querySelector(".img-principal");
    const elFace      = document.querySelector(".face");
    const elBandeira  = document.querySelector(".bandeira");
    const elTabelaTbody = document.querySelector(".tabela table tbody");

    const PATH_IMG = "./assets/pixel_ai/";
    const FALLBACK_IMG = PATH_IMG + "modelo.png";
    const FALLBACK_BANDEIRA = PATH_IMG + "bandeira.png";
    const FALLBACK_NOME = "NOME";

    const PADROES_FIXOS = ["nome", "img", "bandeira", "obs"];
    const CHAVES_FACE_POSSIVEIS = ["face", "avatar", "imgface"];

    // Util: encontra o input/textarea de valor pela chave
    function getValorElPorChave(chaveDesejada) {
      const rows = tbodyForm.querySelectorAll("tr");
      for (const tr of rows) {
        const hidden = tr.querySelector('input[name="attrChave[]"]');
        if (!hidden) continue;
        if ((hidden.value || "").trim().toLowerCase() === chaveDesejada.toLowerCase()) {
          return tr.querySelector('input[name="attrValor[]"], textarea[name="attrValor[]"]');
        }
      }
      return null;
    }

    function getValorElPorChaves(possiveis) {
      for (const c of possiveis) {
        const el = getValorElPorChave(c);
        if (el) return el;
      }
      return null;
    }

    // Busca dinâmica do TD da Obs (nunca cachear!)
    function getObsTd() {
      return document.querySelector(".tabela table tbody tr.obs td.obs");
    }

    // Helpers
    function caminhoImagem(v) {
      const val = (v || "").trim();
      return val ? (val.startsWith("./") || val.startsWith("/") ? val : PATH_IMG + val) : null;
    }

    // Renderizações
    function renderNome() {
      const el = getValorElPorChave("Nome");
      if (el && elTitulo) elTitulo.textContent = (el.value || "").trim() || FALLBACK_NOME;
    }

    function renderImg() {
      const el = getValorElPorChave("Img");
      if (el && elImg) elImg.src = caminhoImagem(el.value) || FALLBACK_IMG;
    }

    function renderFace() {
      const elFaceKey = getValorElPorChaves(CHAVES_FACE_POSSIVEIS);
      const elImgKey  = getValorElPorChave("Img");
      if (elFace) {
        elFace.src =
          caminhoImagem(elFaceKey?.value) ||
          caminhoImagem(elImgKey?.value) ||
          FALLBACK_IMG;
      }
    }

    function renderBandeira() {
      const el = getValorElPorChave("Bandeira");
      if (el && elBandeira) elBandeira.src = caminhoImagem(el.value) || FALLBACK_BANDEIRA;
    }

    // Renderiza a tabela de extras + recria a linha de Obs já com o valor atual
    function renderExtras() {
      if (!elTabelaTbody) return;

      // pega o valor atual da Obs para repor depois
      const obsEl = getValorElPorChave("Obs");
      const obsValor = (obsEl?.value || "").trim();

      // limpa
      elTabelaTbody.innerHTML = "";

      // monta linhas chave/valor (exceto fixos e vazios)
      const rows = tbodyForm.querySelectorAll("tr");
      for (const tr of rows) {
        const chaveHidden = tr.querySelector('input[name="attrChave[]"]');
        const valorEl = tr.querySelector('input[name="attrValor[]"], textarea[name="attrValor[]"]');
        if (!chaveHidden || !valorEl) continue;

        const chave = (chaveHidden.value || "").trim();
        const valor = (valorEl.value || "").trim();
        if (!chave || !valor) continue;

        if (PADROES_FIXOS.includes(chave.toLowerCase())) continue;

        const trExtra = document.createElement("tr");
        const tdChave = document.createElement("td");
        const tdValor = document.createElement("td");

        tdChave.className = "chave";
        const strong = document.createElement("strong");
        strong.textContent = chave + ":";
        tdChave.appendChild(strong);

        tdValor.textContent = valor;

        trExtra.appendChild(tdChave);
        trExtra.appendChild(tdValor);
        elTabelaTbody.appendChild(trExtra);
      }

      // recria a linha de Obs SEMPRE por último
      const trObs = document.createElement("tr");
      trObs.className = "obs";
      const tdObs = document.createElement("td");
      tdObs.className = "obs";
      tdObs.colSpan = 2;
      tdObs.textContent = obsValor; // já coloca o valor atual
      trObs.appendChild(tdObs);
      elTabelaTbody.appendChild(trObs);
    }

    function renderObs() {
      const obsEl = getValorElPorChave("Obs");
      const td = getObsTd(); // pega o td.obs atual (recém-criado)
      if (td) td.textContent = (obsEl?.value || "").trim();
    }

    function renderAll() {
      renderNome();
      renderImg();
      renderFace();
      renderBandeira();
      renderExtras(); // cria a linha de Obs
      renderObs();    // garante que o texto da Obs está sincronizado
    }

    // Inicial
    renderAll();

    // Atualizações em tempo real
    tbodyForm.addEventListener("input", function (e) {
      const tr = e.target.closest("tr");
      if (!tr) return;

      const hidden = tr.querySelector('input[name="attrChave[]"]');
      if (!hidden) return;

      const chave = (hidden.value || "").trim().toLowerCase();

      switch (chave) {
        case "nome":
          renderNome();
          break;
        case "img":
          renderImg();
          renderFace();
          break;
        case "bandeira":
          renderBandeira();
          break;
        case "obs":
          renderObs();
          break;
        case "face":
        case "avatar":
        case "imgface":
          renderFace();
          break;
        default:
          renderExtras();
          break;
      }
    });

    // expõe para outros arquivos chamarem após adicionar/remover linhas
    window.renderExtras = renderExtras;
  });
})();

