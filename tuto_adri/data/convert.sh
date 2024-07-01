#!/bin/bash

# Vérifiez si un argument a été fourni
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <markdown_file>"
  exit 1
fi

# Conversion du Markdown en HTML avec Pandoc
# L'option --standalone (-s) est utilisée pour produire un document HTML complet.
# L'option --toc ajoute une table des matières.
# L'option --toc-depth=2 limite la profondeur de la table des matières aux deux premiers niveaux de titres.
pandoc -s --toc --toc-depth=2 -c style.css "$1" -o output.html

echo "Conversion terminée : output.html"
