(() => {
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', (event) => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  })();

  // atributos dinâmicos
    const tbody = document.getElementById('tbodyAtributos');
    const btnAdd = document.getElementById('btnAddLinha');
    const tpl = document.getElementById('tplLinhaAtributo');
    const LIMITE = 12;

    function atualizarEstadoBotao() {
      const total = tbody.querySelectorAll('tr').length;
      btnAdd.disabled = total >= LIMITE;
    }

    function addLinha(chave = '', valor = '') {
      const total = tbody.querySelectorAll('tr').length;
      if (total >= LIMITE) return;

      const clone = tpl.content.firstElementChild.cloneNode(true);
      const [inpChave, inpValor] = clone.querySelectorAll('input');
      inpChave.value = chave;
      inpValor.value = valor;
      tbody.appendChild(clone);

      atualizarEstadoBotao();
    }

    btnAdd.addEventListener('click', () => addLinha());

    document.addEventListener('click', (e) => {
      const btn = e.target.closest('.btnRemoverLinha');
      if (!btn) return;

      btn.closest('tr')?.remove();
      atualizarEstadoBotao();
    });


    atualizarEstadoBotao();

  addLinha(); // inicia com uma linha