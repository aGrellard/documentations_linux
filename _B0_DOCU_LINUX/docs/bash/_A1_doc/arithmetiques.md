- [Manipulation des Valeurs Numériques en Bash](#manipulation-des-valeurs-numériques-en-bash)
  - [Opérations Arithmétiques](#opérations-arithmétiques)
    - [Addition `+`](#addition-)
    - [Soustraction `-`](#soustraction--)
    - [Multiplication `*`](#multiplication-)
    - [Division `/`](#division-)
    - [Modulo `%`](#modulo-)
  - [Opérateurs de Comparaison Numérique](#opérateurs-de-comparaison-numérique)
    - [Égal `==` ou `-eq`](#égal--ou--eq)
    - [Différent `!=` ou `-ne`](#différent--ou--ne)
    - [Inférieur `-lt`](#inférieur--lt)
    - [Inférieur ou égal `-le`](#inférieur-ou-égal--le)
    - [Supérieur `-gt`](#supérieur--gt)
    - [Supérieur ou égal `-ge`](#supérieur-ou-égal--ge)
  - [Incrémentation et Décrémentation](#incrémentation-et-décrémentation)
    - [Incrémentation](#incrémentation)
    - [Décrémentation](#décrémentation)
  - [Astuces pour les Nombres](#astuces-pour-les-nombres)
  - [Conclusion](#conclusion)


# Manipulation des Valeurs Numériques en Bash

La manipulation des valeurs numériques est fondamentale en Bash pour effectuer des calculs, gérer des conditions basées sur des nombres et contrôler le flux d'exécution des scripts. Ce guide couvre les opérations arithmétiques de base, les opérateurs de comparaison numérique et quelques astuces pour travailler efficacement avec les nombres en Bash.

## Opérations Arithmétiques

Bash permet d'effectuer des calculs arithmétiques simples directement dans le shell ou au sein de scripts. Voici les opérations de base :

### Addition `+`

```bash
result=$((3 + 5))
echo $result  # Affiche 8
```

### Soustraction `-`

```bash
result=$((10 - 3))
echo $result  # Affiche 7
```

### Multiplication `*`

```bash
result=$((4 * 5))
echo $result  # Affiche 20
```

### Division `/`

```bash
result=$((20 / 4))
echo $result  # Affiche 5
```

Notez que la division entre deux nombres entiers produit un entier. Bash arrondit le résultat de la division vers zéro.

### Modulo `%`

Le modulo retourne le reste d'une division.

```bash
result=$((5 % 2))
echo $result  # Affiche 1
```

## Opérateurs de Comparaison Numérique

Les opérateurs de comparaison numérique sont utilisés dans les expressions conditionnelles pour comparer deux valeurs.

### Égal `==` ou `-eq`

```bash
if [ "$a" -eq "$b" ]; then
  echo "a est égal à b"
fi
```

### Différent `!=` ou `-ne`

```bash
if [ "$a" -ne "$b" ]; then
  echo "a est différent de b"
fi
```

### Inférieur `-lt`

```bash
if [ "$a" -lt "$b" ]; then
  echo "a est inférieur à b"
fi
```

### Inférieur ou égal `-le`

```bash
if [ "$a" -le "$b" ]; then
  echo "a est inférieur ou égal à b"
fi
```

### Supérieur `-gt`

```bash
if [ "$a" -gt "$b" ]; then
  echo "a est supérieur à b"
fi
```

### Supérieur ou égal `-ge`

```bash
if [ "$a" -ge "$b" ]; then
  echo "a est supérieur ou égal à b"
fi
```

## Incrémentation et Décrémentation

Bash ne supporte pas directement les opérateurs d'incrémentation (`++`) et de décrémentation (`--`) comme d'autres langages de programmation. Toutefois, vous pouvez réaliser ces opérations en utilisant l'arithmétique de Bash :

### Incrémentation

```bash
((a++))
# ou
a=$((a + 1))
```

### Décrémentation

```bash
((a--))
# ou
a=$((a - 1))
```

## Astuces pour les Nombres

- **Calculs en ligne** : Utilisez `$(())` pour les calculs directs dans vos commandes.

- **Expressions arithmétiques avancées** : Bash supporte une syntaxe étendue dans les expressions `$((...))`, incluant les opérations bit à bit et les décalages.

- **Utilisation de `bc` pour les opérations en virgule flottante** : Bash ne gère pas nativement les nombres à virgule flottante. Pour ces cas, utilisez `bc` :

```bash
result=$(echo "scale=2; 20 / 7" | bc)
echo $result  # Affiche 2.85
```

## Conclusion

La manipulation des valeurs numériques en Bash, bien que moins directe qu'en d'autres langages de programmation, est très puissante pour une grande variété de tâches de script. Que ce soit pour des opérations arithmétiques simples, des comparaisons de valeurs ou des calculs plus complexes, Bash offre les outils nécessaires pour intégrer efficacement la logique numérique dans vos scripts.