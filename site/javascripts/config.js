// https://squidfunk.github.io/mkdocs-material/reference/mathjax/
window.MathJax = {
  tex: {
    inlineMath: [["\\(", "\\)"]],
    displayMath: [["\\[", "\\]"]],
    processEscapes: true,
    processEnvironments: true
  },
  options: {
    ignoreHtmlClass: ".*|",
    processHtmlClass: "arithmatex"
  }
};

document$.subscribe(() => {
  MathJax.typesetPromise()
})

/*
document.addEventListener("DOMContentLoaded", function() {
  // Sélectionne tous les toggles de la navigation
  var toggles = document.querySelectorAll('.md-nav__toggle');
  
  toggles.forEach(function(toggle) {
      // Ferme tous les menus par défaut
      toggle.checked = false;

      // Ajoute un événement de changement pour ouvrir/fermer le menu
      toggle.addEventListener('change', function() {
          var nav = toggle.closest('li').querySelector('.md-nav');
          if (nav) {
              var expanded = toggle.checked;
              nav.setAttribute('aria-expanded', expanded.toString());
          }
      });
  });
});
*/
