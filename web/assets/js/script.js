// ======== Tema Claro/Escuro ========
const themeToggle = document.getElementById('theme-toggle');
const rootEl = document.documentElement;

const saved = localStorage.getItem('theme');
if (saved) rootEl.classList.toggle('dark-theme', saved === 'dark');

themeToggle.textContent = rootEl.classList.contains('dark-theme') ? '☀️' : '🌙';

themeToggle.addEventListener('click', () => {
    const willBeDark = !rootEl.classList.contains('dark-theme');
    rootEl.classList.toggle('dark-theme', willBeDark);
    localStorage.setItem('theme', willBeDark ? 'dark' : 'light');
    themeToggle.textContent = willBeDark ? '☀️' : '🌙';
});

// ======== Dropdown (desktop) ========
const dropdown = document.querySelector('.dropdown');
const trigger = dropdown?.querySelector('button.navlink');

function closeDropdown(){
    dropdown?.setAttribute('aria-expanded','false');
    trigger?.setAttribute('aria-expanded','false');
}
function openDropdown(){
    dropdown?.setAttribute('aria-expanded','true');
    trigger?.setAttribute('aria-expanded','true');
}

trigger?.addEventListener('click', () => {
    const expanded = dropdown.getAttribute('aria-expanded') === 'true';
    expanded ? closeDropdown() : openDropdown();
});
document.addEventListener('click', (e) => {
    if (!dropdown?.contains(e.target)) closeDropdown();
});
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeDropdown();
});