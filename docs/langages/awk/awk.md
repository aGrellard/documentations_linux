# Tutoriel et Documentation Complète sur AWK

## Introduction

AWK est un langage de programmation conçu pour le traitement et l'analyse de fichiers de données. Il est particulièrement puissant pour lire et manipuler des données textuelles structurées et générer des rapports formatés. AWK se distingue par son modèle de traitement basé sur des motifs (patterns) et actions.

## Structure de Base

La commande AWK se structure comme suit :

```bash
awk 'pattern { action }' fichier
```

- `pattern` : Expression qui détermine sur quelles lignes appliquer l'action.
- `action` : Bloc de code à exécuter pour chaque ligne correspondant au motif.

## Options de Commande

- `-F` : Définit le séparateur de champs.
- `-v` : Affecte une valeur à une variable AWK.
- `-f` : Lit le script AWK depuis un fichier.

## Patterns (Motifs)

- `/regular expression/` : Sélectionne les lignes qui correspondent à l'expression régulière.
- `BEGIN` : Bloc d'action exécuté avant la lecture des entrées.
- `END` : Bloc d'action exécuté après la fin des entrées.
- `condition` : Exécute l'action si la condition est vraie.


## Actions

Une action est un bloc de code entouré de `{}` qui peut contenir des instructions pour imprimer, assigner des valeurs, etc.

## Variables Built-in

- [variables](variables.md)
- `FS` : Séparateur de champs d'entrée.
- `OFS` : Séparateur de champs de sortie.
- `RS="\n\n"` : Utilise des paragraphes séparés par des lignes vides comme enregistrements.
- `ORS="\n\n"` : Sépare les enregistrements en sortie par des lignes vides.
- `NR` : Numéro de l'enregistrement courant.
- `NF` : Nombre de champs dans l'enregistrement courant.
- `FILENAME` : Nom du fichier d'entrée.

## Fonctions Built-in

- [fonctions](fonctions.md)
- `print` : Affiche des données.
- `printf` : Affiche des données avec un formatage.
- `length` : Retourne la longueur d'une chaîne.
- `split` : Divise une chaîne en un tableau.
- `substr` : Retourne une sous-chaîne.

## Opérateurs

- Arithmétiques : `+`, `-`, `*`, `/`, `%`.
- Comparaison : `==`, `!=`, `<`, `>`, `<=`, `>=`.
- Logiques : `&&`, `||`, `!`.

## Exemples d'Utilisation

### Imprimer chaque ligne

```bash
awk '{ print }' fichier.txt
```

### Imprimer le premier champ de chaque ligne

```bash
awk '{ print $1 }' fichier.txt
```

### Sélectionner des lignes avec une expression régulière

```bash
awk '/motif/ { print $0 }' fichier.txt
```

### Calculer la somme des valeurs d'un champ

```bash
awk '{ somme += $1 } END { print somme }' fichier.txt
```

### Trier et compter les occurrences uniques d'un champ

```bash
awk '{ count[$1]++ } END { for (word in count) print word, count[word] }' fichier.txt | sort
```

### Modifier le séparateur de champs et imprimer des champs spécifiques

```bash
awk -F: '{ print $1, $6 }' /etc/passwd
```

### Utiliser `BEGIN` et `END`

```bash
awk 'BEGIN { print "Début du traitement" } { print } END { print "Fin du traitement" }' fichier.txt
```

### Formatage avancé avec `printf`

```bash
awk '{ printf "%-10s %s\n", $1, $2 }' fichier.txt
```

## Conseils d'Utilisation

- Utilisez des scripts AWK dans des fichiers pour les traitements complexes.
- Exploitez les variables et les fonctions built-in pour manipuler les données efficacement.
- Pour les tâches d'analyse de données, AWK est souvent combiné avec d'autres outils Unix comme `sort`, `grep`, et `cut`.

AWK est un outil extrêmement puissant pour le traitement de texte sous Unix/Linux. Sa syntaxe et ses fonctions intégrées permettent une grande variété d'opérations de traitement de texte et de données, des plus simples aux plus complexes. Avec une bonne maîtrise d'AWK, vous pouvez simplifier et automatiser de nombreuses tâches de manipulation de données.