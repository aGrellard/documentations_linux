- [Documentation de la commande `cat`](#documentation-de-la-commande-cat)
  - [Syntaxe](#syntaxe)
  - [Options Principales](#options-principales)
  - [Utilisation](#utilisation)
  - [Exemples d'Utilisation](#exemples-dutilisation)
    - [1. Afficher le contenu d'un fichier](#1-afficher-le-contenu-dun-fichier)
    - [2. Concaténer plusieurs fichiers](#2-concaténer-plusieurs-fichiers)
    - [3. Ajouter le contenu d'un fichier à la fin d'un autre](#3-ajouter-le-contenu-dun-fichier-à-la-fin-dun-autre)
    - [4. Afficher les numéros de ligne (y compris les lignes vides)](#4-afficher-les-numéros-de-ligne-y-compris-les-lignes-vides)
    - [5. Afficher les numéros de ligne, en ignorant les lignes vides](#5-afficher-les-numéros-de-ligne-en-ignorant-les-lignes-vides)
    - [6. Afficher les tabulations et les fins de ligne](#6-afficher-les-tabulations-et-les-fins-de-ligne)
    - [7. Supprimer les lignes vides multiples](#7-supprimer-les-lignes-vides-multiples)
    - [8. Afficher le contenu de fichiers avec des caractères non imprimables visibles](#8-afficher-le-contenu-de-fichiers-avec-des-caractères-non-imprimables-visibles)
    - [9. Lire l'entrée standard (terminée par CTRL+D en terminal)](#9-lire-lentrée-standard-terminée-par-ctrld-en-terminal)
  - [Conclusion](#conclusion)


La commande `cat` (abréviation de concatenate) est un utilitaire Unix/Linux qui lit, concatène et affiche le contenu de fichiers. Elle est fréquemment utilisée pour afficher le contenu de fichiers, combiner des fichiers et créer de nouveaux fichiers.

# Documentation de la commande `cat`

## Syntaxe

```bash
cat [OPTION]... [FILE]...
```

## Options Principales

- `-A, --show-all` : Équivaut à `-vET`.
- `-b, --number-nonblank` : Numérote toutes les lignes non vides, en commençant par 1.
- `-e` : Équivaut à `-vE`.
- `-E, --show-ends` : Affiche `$` à la fin de chaque ligne.
- `-n, --number` : Numérote toutes les lignes de sortie, en commençant par 1.
- `-s, --squeeze-blank` : Supprime les lignes vides multiples consécutives.
- `-t` : Équivaut à `-vT`.
- `-T, --show-tabs` : Affiche les tabulations comme `^I`.
- `-v, --show-nonprinting` : Utilise la notation `^` et `M-` pour les caractères non imprimables (à l'exception des LF, TAB et FF).
- `--help` : Affiche un message d'aide et quitte.
- `--version` : Affiche les informations de version et quitte.

## Utilisation

La commande `cat` peut être utilisée de plusieurs manières, y compris pour afficher le contenu de fichiers, combiner des fichiers en un seul flux de sortie, et créer de nouveaux fichiers. Si aucun fichier n'est spécifié, ou si le fichier spécifié est `-`, `cat` lit l'entrée standard.

## Exemples d'Utilisation

### 1. Afficher le contenu d'un fichier

```bash
cat fichier.txt
```

### 2. Concaténer plusieurs fichiers

```bash
cat fichier1.txt fichier2.txt > fichier_combiné.txt
```

### 3. Ajouter le contenu d'un fichier à la fin d'un autre

```bash
cat fichier2.txt >> fichier1.txt
```

### 4. Afficher les numéros de ligne (y compris les lignes vides)

```bash
cat -n fichier.txt
```

### 5. Afficher les numéros de ligne, en ignorant les lignes vides

```bash
cat -b fichier.txt
```

### 6. Afficher les tabulations et les fins de ligne

```bash
cat -ET fichier.txt
```

### 7. Supprimer les lignes vides multiples

```bash
cat -s fichier.txt
```

### 8. Afficher le contenu de fichiers avec des caractères non imprimables visibles

```bash
cat -v fichier.txt
```

### 9. Lire l'entrée standard (terminée par CTRL+D en terminal)

```bash
cat > nouveau_fichier.txt
```

10. Concaténer le contenu de plusieurs fichiers et afficher le résultat avec des caractères ### non imprimables visibles

```bash
cat -v fichier1.txt fichier2.txt
```

## Conclusion

`cat` est un outil de base mais extrêmement puissant dans l'arsenal de commandes Unix/Linux, utile pour afficher, combiner, et créer des fichiers. Son utilisation va bien au-delà de ces exemples, offrant une flexibilité dans le traitement et l'affichage du contenu des fichiers. Que vous soyez débutant ou expérimenté en ligne de commande, `cat` est une commande à connaître et à maîtriser.