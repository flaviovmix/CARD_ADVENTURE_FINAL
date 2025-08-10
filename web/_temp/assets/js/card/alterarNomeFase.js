let timeoutVoltarPadrao = null;

function trocarTextoComFade(novoTexto, elementoTitulo) {
  elementoTitulo.classList.add('texto-fade');
  elementoTitulo.style.transform = 'translateX(-300px)';
  elementoTitulo.style.transition = 'transform 0.3s ease';

  setTimeout(() => {
    elementoTitulo.textContent = novoTexto;
    elementoTitulo.classList.remove('texto-fade');
    elementoTitulo.style.transform = 'translateX(0px)';
    elementoTitulo.style.transition = 'transform 0.3s ease';
  }, 300);
}

// Para cada card da página
document.querySelectorAll('.card').forEach((card) => {
  // título deste card
  const tituloDoCard = card.querySelector('#area-titulo-da-fase');
  if (!tituloDoCard) return;

  // nome padrão vindo do JSP (data-nome) ou fallback para o texto atual
  const nomePadrao = tituloDoCard.dataset.nome || tituloDoCard.textContent.trim();

  // para cada link de fase deste card
  card.querySelectorAll('.area-link-fases a').forEach((item) => {
    const icon = item.querySelector('.icone');

    item.addEventListener('mouseenter', () => {
      clearTimeout(timeoutVoltarPadrao);
      if (icon) {
        icon.style.transition = 'transform 0.3s ease';
        icon.style.transform = 'translateY(-8px)';
      }

      const titulo = item.getAttribute('data-titulo') || nomePadrao;
      trocarTextoComFade(titulo, tituloDoCard);
    });

    item.addEventListener('mouseleave', () => {
      if (icon) {
        icon.style.transition = 'transform 0.3s ease';
        icon.style.transform = 'translateY(0)';
      }

      timeoutVoltarPadrao = setTimeout(() => {
        trocarTextoComFade(nomePadrao, tituloDoCard);
      }, 1000);
    });
  });
});