---
title: Conditions
tags:
  - linux
  - bash
  - programmation
  - scripts
  - ressource
status:
  - Complété
type de note:
  - ressource
source:
  - chatgpt
date: 2024-07-10
---
# Conditions

Les conditions en Bash permettent de tester différents types d'expressions et de contrôler le flux d'exécution des scripts en fonction des résultats de ces tests. Voici les différents types de conditions que vous pouvez utiliser en Bash :

## Conditions sur les Fichiers

Bash offre une variété d'opérateurs pour tester les attributs des fichiers et des répertoires. Ces tests permettent de vérifier l'existence de fichiers, leurs types, leurs permissions, et plus encore. Par exemple :

- **`-e`** : Vérifie si un fichier existe.
- **`-f`** : Teste si le fichier est un fichier ordinaire (et non un répertoire).
- **`-d`** : Teste si le fichier est un répertoire.
- **`-r`**, **`-w`**, **`-x`** : Vérifie si le fichier est respectivement lisible, inscriptible, ou exécutable.

### Exemples
```bash
if [ -e mon_fichier ]; then
  echo "Le fichier existe."
fi

if [ -d mon_repertoire ]; then
  echo "C'est un répertoire."
fi
```


## Conditions sur les Chaînes de Caractères

Ces conditions permettent de comparer des chaînes de caractères pour vérifier leur égalité, leur non-égalité, ou pour tester des propriétés comme la longueur d'une chaîne.

- **`=`** ou **`==`** : Vérifie si deux chaînes sont identiques.
- **`!=`** : Teste si deux chaînes sont différentes.
- **`-z`** : Vérifie si une chaîne est vide.
- **`-n`** : Teste si une chaîne n'est pas vide.
-  **`=~`** : tester des expressions
	```bash
	if [[ "$chaine" =~ ^[0-9]+$ ]]; then
		echo "La chaîne est un nombre."
	fi
	```

### Exemples
```bash
if [ "$chaine1" = "$chaine2" ]; then
  echo "Les chaînes sont identiques."
fi

if [ -z "$chaine" ]; then
  echo "La chaîne est vide."
fi
```


## Conditions Numériques

Ces conditions comparent des valeurs numériques pour l'égalité, l'inégalité, et d'autres relations numériques.

- **`-eq`**, **`-ne`** : Teste l'égalité ou la non-égalité de deux nombres.
- **`-lt`**, **`-le`**, **`-gt`**, **`-ge`** : Compare deux nombres pour tester si l'un est moins que, moins ou égal à, plus grand que, ou plus grand ou égal à l'autre.

### Exemples
```bash
if [ "$nombre1" -eq "$nombre2" ]; then
  echo "Les nombres sont égaux."
fi

if [ "$nombre1" -gt "$nombre2" ]; then
  echo "Le premier nombre est plus grand."
fi
```

## Conditions Composites

Les conditions composites utilisent des opérateurs logiques pour combiner plusieurs tests en une seule condition. Les opérateurs logiques incluent :

- **`&&`** : ET logique. La condition composite est vraie si toutes les conditions sont vraies.
- **`||`** : OU logique. La condition composite est vraie si au moins une des conditions est vraie.
- **`!`** : NON logique. Inverse le résultat d'une condition.

### Exemples
```bash
if [ -e fichier.txt ] && [ -r fichier.txt ]; then
  echo "Le fichier existe et il est lisible."
fi

if [ -z "$chaine" ] || [ "$chaine" = "default" ]; then
  echo "La chaîne est vide ou elle vaut 'default'."
fi
```

## Opérateurs d'Incrémentation et de Décrémentation

En Bash, vous pouvez utiliser les opérateurs `++` et `--` pour incrémenter et décrémenter les variables. Ces opérateurs peuvent être utilisés en préfixe ou en suffixe.

### Exemples
```bash
nombre=1

((nombre++))
echo $nombre  # Affiche 2

((++nombre))
echo $nombre  # Affiche 3

((nombre--))
echo $nombre  # Affiche 2

((--nombre))
echo $nombre  # Affiche 1
```

## L'Instruction `case`

L'instruction `case` n'est pas une condition à proprement parler, mais elle permet de gérer facilement des conditions multiples basées sur les valeurs spécifiques d'une variable. C'est une alternative élégante à une série de `if`...`elif`...`else` pour tester la même variable contre différentes valeurs.
### Exemples

```bash
case "$variable" in
  "valeur1")
    echo "La variable vaut valeur1."
    ;;
  "valeur2")
    echo "La variable vaut valeur2."
    ;;
  *)
    echo "Valeur par défaut."
    ;;
esac
```

## Connexes
- [[Operateurs-Logiques]]
- [[Conditions-composite]]
