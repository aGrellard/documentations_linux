---
title: Operateurs-Logiques
date: 2024-07-10
tags:
  - ressource
  - linux
  - bash
  - programmation
  - scripts
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
---
# Les Opérations Logiques en Bash

Les opérations logiques en Bash permettent d'effectuer des tests et de prendre des décisions en fonction de plusieurs conditions. Ce guide explique les opérateurs logiques de base, leur syntaxe et leur utilisation dans les scripts Bash.

## Chapitre 1 : Les Opérateurs de Comparaison

Bash utilise des opérateurs de comparaison pour comparer des valeurs numériques, des chaînes de caractères, et des fichiers. Voici les plus courants :

### 1.1 Comparaisons Numériques

- **`-eq`** : égal à.
- **`-ne`** : différent de.
- **`-gt`** : plus grand que.
- **`-ge`** : plus grand ou égal à.
- **`-lt`** : moins que.
- **`-le`** : moins ou égal à.

### 1.2 Comparaisons de Chaînes

- **`=`** ou **`==`** : égal à.
- **`!=`** : différent de.
- **`<`** et **`>`** : inférieur/supérieur dans l'ordre lexicographique (utiliser dans `[[ ]]` ou échapper dans `[ ]`).
- **`-z`** : chaîne vide.
- **`-n`** : chaîne non vide.

### 1.3 Exemples de Comparaisons

```bash
if [ "$a" -eq "$b" ]; then echo "a est égal à b"; fi
if [[ "$a" < "$b" ]]; then echo "a est lexicographiquement inférieur à b"; fi
```

## Chapitre 2 : Les Opérateurs Logiques

Les opérateurs logiques permettent de combiner plusieurs tests.

### 2.1 ET Logique

- **`&&`** ou **`-a`** dans les expressions `[ ]` (mais `&&` est préféré dans `[[ ]]`).

### 2.2 OU Logique

- **`||`** ou **`-o`** dans les expressions `[ ]` (mais `||` est préféré dans `[[ ]]`).

### 2.3 NON Logique

- **`!`** inverse le résultat d'un test.

### 2.4 Exemples d'Utilisation

```bash
if [ "$a" -gt 0 ] && [ "$b" -gt 0 ]; then echo "a et b sont positifs"; fi
if [ "$a" -lt 0 ] || [ "$b" -lt 0 ]; then echo "au moins un parmi a et b est négatif"; fi
if ! [ "$a" -eq "$b" ]; then echo "a est différent de b"; fi
```

## Chapitre 3 : Utilisation Avancée

### 3.1 Conditions Composées avec `[[ ]]`

Les doubles crochets `[[ ]]` offrent une syntaxe plus flexible pour les tests, comme la possibilité d'utiliser `<` et `>` pour les comparaisons de chaînes sans échapper les opérateurs, et l'évaluation correcte des expressions contenant des variables non définies.

### 3.2 Tests sur les Fichiers

Bash fournit également des opérateurs pour tester les propriétés des fichiers :

- **`-f`** : vrai si le fichier existe et est un fichier régulier.
- **`-d`** : vrai si le fichier existe et est un répertoire.
- **`-r`**, **`-w`**, **`-x`** : vrai si le fichier est respectivement lisible, inscriptible, exécutable par l'utilisateur courant.

### 3.3 Exemple de Test de Fichier

```bash
if [ -f "$fichier" ]; then echo "$fichier existe et est un fichier régulier"; fi
```

## Conclusion

Les opérations logiques sont fondamentales en Bash pour la création de scripts interactifs et conditionnels. La maîtrise des opérateurs de comparaison, logiques, et de test sur les fichiers permet d'écrire des scripts plus robustes, flexibles, et intelligents. Comprendre et appliquer correctement ces concepts ouvre la porte à des automatisations complexes et des scripts personnalisés efficaces.