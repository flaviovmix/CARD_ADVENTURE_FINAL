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

document.querySelectorAll('.card').forEach((card) => {
  // isola o timeout por card
  let timeoutVoltarPadrao = null;

  // pega o span do título; se não existir, usa o container
  const areaTitulo = card.querySelector('.area-titulo-da-fase');
  if (!areaTitulo) return;

  const tituloSpan = areaTitulo.querySelector('.area-titulo-texto') || areaTitulo;

  // nome padrão via data-nome ou conteúdo atual
  const nomePadrao = areaTitulo.dataset.nome || tituloSpan.textContent.trim();

  // listeners por ícone/fase
  card.querySelectorAll('.area-link-fases a').forEach((item) => {
    const icon = item.querySelector('.icone');

    item.addEventListener('mouseenter', () => {
      // evita reverter enquanto o mouse está em outro item
      if (timeoutVoltarPadrao) {
        clearTimeout(timeoutVoltarPadrao);
        timeoutVoltarPadrao = null;
      }

      if (icon) {
        icon.style.transition = 'transform 0.3s ease';
        icon.style.transform = 'translateY(-8px)';
      }

      const titulo = item.getAttribute('data-titulo') || nomePadrao;
      trocarTextoComFade(titulo, tituloSpan);
    });

    item.addEventListener('mouseleave', () => {
      if (icon) {
        icon.style.transition = 'transform 0.3s ease';
        icon.style.transform = 'translateY(0)';
      }

      // agenda retorno ao nome original
      timeoutVoltarPadrao = setTimeout(() => {
        trocarTextoComFade(nomePadrao, tituloSpan);
      }, 1000);
    });
  });
});
