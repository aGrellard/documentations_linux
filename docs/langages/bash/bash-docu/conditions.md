- [1. Conditions sur les Fichiers](#1-conditions-sur-les-fichiers)
- [2. Conditions sur les Chaînes de Caractères](#2-conditions-sur-les-chaînes-de-caractères)
- [3. Conditions Numériques](#3-conditions-numériques)
- [4. Conditions Composites](#4-conditions-composites)
- [5. L'Instruction `case`](#5-linstruction-case)
- [Conclusion](#conclusion)


Les conditions en Bash permettent de tester différents types d'expressions et de contrôler le flux d'exécution des scripts en fonction des résultats de ces tests. Voici les différents types de conditions que vous pouvez utiliser en Bash :

## 1. Conditions sur les Fichiers

Bash offre une variété d'opérateurs pour tester les attributs des fichiers et des répertoires. Ces tests permettent de vérifier l'existence de fichiers, leurs types, leurs permissions, et plus encore. Par exemple :

- **`-e`** : Vérifie si un fichier existe.
- **`-f`** : Teste si le fichier est un fichier ordinaire (et non un répertoire).
- **`-d`** : Teste si le fichier est un répertoire.
- **`-r`**, **`-w`**, **`-x`** : Vérifie si le fichier est respectivement lisible, inscriptible, ou exécutable.

## 2. Conditions sur les Chaînes de Caractères

Ces conditions permettent de comparer des chaînes de caractères pour vérifier leur égalité, leur non-égalité, ou pour tester des propriétés comme la longueur d'une chaîne.

- **`=`** ou **`==`** : Vérifie si deux chaînes sont identiques.
- **`!=`** : Teste si deux chaînes sont différentes.
- **`-z`** : Vérifie si une chaîne est vide.
- **`-n`** : Teste si une chaîne n'est pas vide.

## 3. Conditions Numériques

Ces conditions comparent des valeurs numériques pour l'égalité, l'inégalité, et d'autres relations numériques.

- **`-eq`**, **`-ne`** : Teste l'égalité ou la non-égalité de deux nombres.
- **`-lt`**, **`-le`**, **`-gt`**, **`-ge`** : Compare deux nombres pour tester si l'un est moins que, moins ou égal à, plus grand que, ou plus grand ou égal à l'autre.

## 4. Conditions Composites

Les conditions composites utilisent des opérateurs logiques pour combiner plusieurs tests en une seule condition. Les opérateurs logiques incluent :

- **`&&`** : ET logique. La condition composite est vraie si toutes les conditions sont vraies.
- **`||`** : OU logique. La condition composite est vraie si au moins une des conditions est vraie.
- **`!`** : NON logique. Inverse le résultat d'une condition.

## 5. L'Instruction `case`

L'instruction `case` n'est pas une condition à proprement parler, mais elle permet de gérer facilement des conditions multiples basées sur les valeurs spécifiques d'une variable. C'est une alternative élégante à une série de `if`...`elif`...`else` pour tester la même variable contre différentes valeurs.

## Conclusion

Les conditions en Bash sont un élément essentiel pour la création de scripts interactifs et dynamiques. Elles permettent d'exécuter des commandes basées sur des tests de fichiers, des comparaisons de chaînes, des évaluations numériques, et des combinaisons de ces tests. Maîtriser ces différents types de conditions vous permet de construire des scripts complexes et puissants, capables de prendre des décisions intelligentes basées sur une grande variété de critères.