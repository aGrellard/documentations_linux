# Tutoriel et Documentation Complète sur `tr`

## Introduction

`tr` est un utilitaire en ligne de commande Unix/Linux qui sert à traduire, presser, et/ou supprimer des caractères depuis l'entrée standard, écrivant le résultat vers la sortie standard. Il est souvent utilisé pour des opérations telles que la conversion de casse, la suppression de caractères indésirables, ou le remplacement de caractères.

## Syntaxe de Base

```bash
tr [OPTIONS] SET1 [SET2]
```

- `SET1` : Ensemble de caractères d'entrée à être remplacés ou supprimés.
- `SET2` : Ensemble de caractères de sortie qui remplaceront ceux de `SET1`.

## Options Principales

- `-c` ou `--complement` : Utilise le complément de `SET1`.
- `-d` ou `--delete` : Supprime les caractères présents dans `SET1`, aucun `SET2` requis.
- `-s` ou `--squeeze-repeats` : Remplace chaque séquence d'un caractère répété présent dans `SET1` par une seule occurrence de ce caractère.
- `-t` ou `--truncate-set1` : Tronque `SET1` pour correspondre à la longueur de `SET2`.

## Exemples d'Utilisation de `tr`

### Convertir de Minuscules en Majuscules

```bash
echo "exemple de texte" | tr 'a-z' 'A-Z'
```

### Supprimer les Caractères Numériques

```bash
echo "mot de passe123" | tr -d '0-9'
```

### Presser les Caractères Répétés

```bash
echo "Bonjourrrrr    monde" | tr -s 'r' ' '
```

Dans cet exemple, les `r` répétés sont pressés en une seule occurrence, et les espaces multiples sont aussi réduits à un seul espace.

### Supprimer les Retours à la Ligne

```bash
echo -e "ligne 1\nligne 2" | tr -d '\n'
```

### Remplacer les Espaces par des Tirets

```bash
echo "texte avec des espaces" | tr ' ' '-'
```

### Utiliser le Complément d'un Ensemble de Caractères

```bash
echo "abc123" | tr -cd 'a-zA-Z'
```

Supprime tous les caractères qui ne sont pas des lettres.

## Avancé

### Transformer les Sauts de Ligne en Espaces

```bash
tr '\n' ' ' < fichier.txt
```

Ceci est utile pour transformer un fichier multilignes en une seule ligne.

### Supprimer les Caractères Non-Imprimables

```bash
tr -cd '\11\12\15\40-\176' < fichier.txt
```

Cela garde les tabulations, les nouvelles lignes, les retours chariots, et les caractères imprimables ASCII, supprimant tout le reste.

### Créer un Histogramme des Caractères

```bash
echo "hello world" | fold -w1 | sort | uniq -c | sort -nr
```

Bien que cet exemple dépasse le cadre de `tr` seul, il montre comment combiner plusieurs commandes Unix pour créer un histogramme des caractères d'une chaîne. `fold` divise le texte en caractères, `sort` trie ces caractères, `uniq -c` compte les occurrences, et `sort -nr` trie les résultats par nombre d'occurrences.

## Conseils

- `tr` travaille sur des jeux de caractères et ne comprend pas les expressions régulières ou les mots.
- Lors du travail avec `tr`, pensez aux locales (langues et paramètres régionaux) qui peuvent affecter le comportement de certains ensembles de caractères.
- Utilisez des guillemets autour des ensembles de caractères pour éviter l'interprétation par le shell.

`tr` est un outil puissant et flexible pour le traitement de texte en ligne de commande, idéal pour des modifications simples mais répétitives de chaînes ou de flux de texte.