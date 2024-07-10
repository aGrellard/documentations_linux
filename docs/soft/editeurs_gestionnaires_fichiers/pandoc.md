- [`pandoc`](#pandoc)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Paramètres et Options Principales](#paramètres-et-options-principales)
  - [Exemples d'Utilisation de `pandoc`](#exemples-dutilisation-de-pandoc)
    - [Convertir un Fichier Markdown en HTML](#convertir-un-fichier-markdown-en-html)
    - [Créer un PDF à partir d'un Fichier Markdown](#créer-un-pdf-à-partir-dun-fichier-markdown)
    - [Générer un EPUB à partir d'un Fichier Markdown](#générer-un-epub-à-partir-dun-fichier-markdown)
    - [Ajouter une Table des Matières à un Document HTML](#ajouter-une-table-des-matières-à-un-document-html)
    - [Convertir un Document Word en Markdown](#convertir-un-document-word-en-markdown)
    - [Lier une Feuille de Style CSS à un Document HTML](#lier-une-feuille-de-style-css-à-un-document-html)
    - [Utiliser un Moteur PDF Spécifique](#utiliser-un-moteur-pdf-spécifique)
    - [Définir les Métadonnées d'un Document](#définir-les-métadonnées-dun-document)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `pandoc`

## Introduction

`pandoc` est un convertisseur de documents universel, reconnu pour sa flexibilité et sa capacité à gérer une multitude de formats de fichiers, allant du Markdown au HTML, LaTeX, EPUB, PDF, et bien d'autres. C'est l'outil idéal pour les auteurs, chercheurs, et toute personne ayant besoin de convertir des documents d'un format à un autre.

## Installation

Pour installer `pandoc`, utilisez le gestionnaire de paquets de votre distribution Linux :

- **Debian/Ubuntu** :
  ```bash
  sudo apt install pandoc
  ```
- **Fedora** :
  ```bash
  sudo dnf install pandoc
  ```
- **Arch Linux** :
  ```bash
  sudo pacman -S pandoc
  ```

## Paramètres et Options Principales

`pandoc` offre un vaste ensemble d'options pour personnaliser le processus de conversion. Voici quelques-unes des options les plus couramment utilisées :

- `-f`, `--from=FORMAT` : Spécifie le format du document source.
- `-t`, `--to=FORMAT` : Définit le format de sortie.
- `-o`, `--output=FILE` : Indique le fichier de sortie. Sans cette option, `pandoc` écrit sur `stdout`.
- `--list-input-formats` : Liste tous les formats d'entrée disponibles.
- `--list-output-formats` : Liste tous les formats de sortie disponibles.
- `--list-extensions[=FORMAT]` : Montre toutes les extensions disponibles pour un format donné.
- `-s`, `--standalone` : Produit un document autonome, incluant un entête et un pied de page, si nécessaire.
- `--toc`, `--table-of-contents` : Ajoute une table des matières au document final.
- `-c`, `--css=URL` : Lie une feuille de style CSS externe (pour les formats HTML).
- `--pdf-engine=ENGINE` : Spécifie le moteur à utiliser pour la conversion en PDF (par exemple, `wkhtmltopdf`, `weasyprint`).
- `--metadata=KEY[:VALUE]` : Définit une valeur de métadonnée (par exemple, titre, auteur).

## Exemples d'Utilisation de `pandoc`

### Convertir un Fichier Markdown en HTML

```bash
pandoc -f markdown -t html -o document.html document.md
```

### Créer un PDF à partir d'un Fichier Markdown

```bash
pandoc document.md -o document.pdf
```

### Générer un EPUB à partir d'un Fichier Markdown

```bash
pandoc document.md -o document.epub
```

### Ajouter une Table des Matières à un Document HTML

```bash
pandoc document.md --toc -s -o document.html
```

### Convertir un Document Word en Markdown

```bash
pandoc -f docx -t markdown -o document.md document.docx
```

### Lier une Feuille de Style CSS à un Document HTML

```bash
pandoc document.md -c style.css -s -o document.html
```

### Utiliser un Moteur PDF Spécifique

```bash
pandoc document.md --pdf-engine=wkhtmltopdf -o document.pdf
```

### Définir les Métadonnées d'un Document

```bash
pandoc document.md -o document.pdf --metadata title="Mon Titre" --metadata author="Mon Nom"
```

## Bonnes Pratiques

- **Conversion de Fichiers Volumineux** : Pour les documents particulièrement longs ou complexes, surveillez l'utilisation des ressources système, car `pandoc` peut être gourmand en ressources pour certaines tâches.
- **Personnalisation avec des Fichiers CSS** : Pour les conversions vers HTML ou EPUB, personnalisez l'apparence de votre document en liant des fichiers CSS externes.
- **Utilisation des Extensions** : Profitez des nombreuses extensions de `pandoc` pour ajuster le comportement du Markdown et d'autres formats, permettant une personnalisation plus fine du document final.
- **Scripts et Automatisation** : Intégrez `pandoc` dans des scripts pour automatiser la conversion de documents dans le cadre de workflows de publication, de recherche, ou de développement de documentation.

## Conclusion

`pandoc` est un outil extrêmement puissant et polyvalent pour la conversion de documents. Sa capacité à traiter une

 large gamme de formats en fait un outil indispensable pour quiconque travaille régulièrement avec des documents numériques. En maîtrisant `pandoc` et ses nombreuses options, vous pouvez simplifier et automatiser vos tâches de conversion de documents, améliorant ainsi votre productivité et l'efficacité de votre workflow.