- [Opérateurs de Test sur une Chaîne de Caractères en Bash](#opérateurs-de-test-sur-une-chaîne-de-caractères-en-bash)
  - [Vérification de la Longueur d'une Chaîne](#vérification-de-la-longueur-dune-chaîne)
    - [Chaîne Non Vide](#chaîne-non-vide)
    - [Chaîne Vide](#chaîne-vide)
  - [Comparaison de Chaînes](#comparaison-de-chaînes)
    - [Égalité](#égalité)
    - [Non Égalité](#non-égalité)
  - [Opérateurs de Comparaison Lexicographique](#opérateurs-de-comparaison-lexicographique)
    - [Inférieur Lexicographique](#inférieur-lexicographique)
    - [Supérieur Lexicographique](#supérieur-lexicographique)
  - [Recherche de Motif](#recherche-de-motif)


# Opérateurs de Test sur une Chaîne de Caractères en Bash

Les opérateurs de test sur les chaînes de caractères en Bash permettent de comparer des chaînes, de vérifier leur longueur, leur contenu, et d'autres propriétés. Ils sont essentiels pour le contrôle de flux et la logique conditionnelle dans les scripts Bash. Voici un guide détaillé sur les opérateurs de test les plus couramment utilisés pour les chaînes de caractères.

## Vérification de la Longueur d'une Chaîne

### Chaîne Non Vide

- **`-n`** : Vérifie si une chaîne n'est pas vide.

```bash
if [ -n "$chaine" ]; then
  echo "La chaîne n'est pas vide."
fi
```

### Chaîne Vide

- **`-z`** : Vérifie si une chaîne est vide.

```bash
if [ -z "$chaine" ]; then
  echo "La chaîne est vide."
fi
```

## Comparaison de Chaînes

### Égalité

- **`=`** ou **`==`** (double crochet seulement) : Vérifie si deux chaînes sont identiques.

```bash
if [ "$chaine1" = "$chaine2" ]; then
  echo "Les chaînes sont identiques."
fi
```

### Non Égalité

- **`!=`** : Vérifie si deux chaînes sont différentes.

```bash
if [ "$chaine1" != "$chaine2" ]; then
  echo "Les chaînes sont différentes."
fi
```

## Opérateurs de Comparaison Lexicographique

Ces opérateurs sont utilisés pour comparer des chaînes selon l'ordre lexicographique. Ils doivent être utilisés avec la syntaxe `[[ ]]` pour éviter des erreurs d'interprétation des symboles `<` et `>` par le shell.

### Inférieur Lexicographique

- **`<`** : Vérifie si `chaine1` est lexicographiquement inférieure à `chaine2`.

```bash
if [[ "$chaine1" < "$chaine2" ]]; then
  echo "chaine1 vient avant chaine2."
fi
```

### Supérieur Lexicographique

- **`>`** : Vérifie si `chaine1` est lexicographiquement supérieure à `chaine2`.

```bash
if [[ "$chaine1" > "$chaine2" ]]; then
  echo "chaine1 vient après chaine2."
fi
```

## Recherche de Motif

- **`=~`** : Cet opérateur permet de vérifier si la chaîne correspond à un motif régulier (regex). Utilisé avec `[[ ]]`.

```bash
if [[ "$chaine" =~ ^[A-Za-z]+$ ]]; then
  echo "La chaîne contient uniquement des lettres."
fi
```
