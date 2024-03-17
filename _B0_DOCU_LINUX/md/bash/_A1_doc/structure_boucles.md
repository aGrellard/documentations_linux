- [Les Boucles en Bash](#les-boucles-en-bash)
  - [La Boucle `for`](#la-boucle-for)
    - [Syntaxe Générale](#syntaxe-générale)
    - [Exemple avec une Liste](#exemple-avec-une-liste)
    - [Syntaxe avec Séquence Numérique](#syntaxe-avec-séquence-numérique)
    - [Syntaxe Style C](#syntaxe-style-c)
  - [La Boucle `while`](#la-boucle-while)
    - [Syntaxe](#syntaxe)
    - [Exemple](#exemple)
  - [La Boucle `until`](#la-boucle-until)
    - [Syntaxe](#syntaxe-1)
    - [Exemple](#exemple-1)
  - [Contrôle de Boucle](#contrôle-de-boucle)
    - [`break`](#break)
    - [`continue`](#continue)
  - [Conclusion](#conclusion)


# Les Boucles en Bash

Les boucles sont des structures de contrôle fondamentales en Bash qui répètent des blocs de commandes tant qu'une condition est vraie ou pour chaque élément d'une liste. Bash propose principalement deux types de boucles : `for` et `while`, ainsi que `until` comme variante de `while`. Ces structures offrent une grande flexibilité pour automatiser les tâches répétitives.

## La Boucle `for`

La boucle `for` en Bash itère sur une liste de valeurs ou une séquence générée et exécute un bloc de commandes pour chaque élément.

### Syntaxe Générale

```bash
for variable in liste; do
  # Commandes à exécuter
done
```

### Exemple avec une Liste

```bash
for nom in Alice Bob Charlie; do
  echo "Bonjour $nom"
done
```

### Syntaxe avec Séquence Numérique

```bash
for i in {1..5}; do
  echo "Itération numéro $i"
done
```

### Syntaxe Style C

Bash permet également une syntaxe de boucle `for` similaire à celle du langage C, utile pour des itérations basées sur des conditions numériques.

```bash
for ((i = 1; i <= 5; i++)); do
  echo "Itération numéro $i"
done
```

## La Boucle `while`

La boucle `while` exécute un bloc de commandes tant que la condition spécifiée reste vraie.

### Syntaxe

```bash
while [ condition ]; do
  # Commandes à exécuter
done
```

### Exemple

```bash
compteur=1
while [ $compteur -le 5 ]; do
  echo "Itération numéro $compteur"
  ((compteur++))
done
```

## La Boucle `until`

La boucle `until` est l'opposé de `while` : elle exécute le bloc de commandes jusqu'à ce que la condition devienne vraie.

### Syntaxe

```bash
until [ condition ]; do
  # Commandes à exécuter
done
```

### Exemple

```bash
compteur=1
until [ $compteur -gt 5 ]; do
  echo "Itération numéro $compteur"
  ((compteur++))
done
```

## Contrôle de Boucle

### `break`

`break` termine l'exécution de la boucle et passe au bloc de commandes suivant après la boucle.

```bash
for i in {1..10}; do
  if [ $i -eq 6 ]; then
    break
  fi
  echo "Itération numéro $i"
done
```

### `continue`

`continue` saute le reste du bloc de commandes de l'itération courante et passe à l'itération suivante de la boucle.

```bash
for i in {1..5}; do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo "Itération numéro $i"
done
```

## Conclusion

Les boucles `for`, `while`, et `until` offrent des moyens puissants et flexibles de répéter des opérations dans les scripts Bash. Que ce soit pour itérer sur des listes de valeurs, exécuter des commandes jusqu'à ce qu'une condition soit remplie, ou gérer des séquences complexes, la maîtrise des boucles est essentielle pour tout développeur Bash. Utilisez `break` et `continue` pour contrôler finement le flux d'exécution au sein de vos boucles, rendant vos scripts plus efficaces et plus intelligibles.