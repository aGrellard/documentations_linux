- [Les Conditions Composites en Bash](#les-conditions-composites-en-bash)
  - [Opérateurs Logiques](#opérateurs-logiques)
    - [ET Logique (`&&`)](#et-logique-)
      - [Syntaxe dans `if`](#syntaxe-dans-if)
      - [Syntaxe dans une Commande](#syntaxe-dans-une-commande)
    - [OU Logique (`||`)](#ou-logique-)
      - [Syntaxe dans `if`](#syntaxe-dans-if-1)
      - [Syntaxe dans une Commande](#syntaxe-dans-une-commande-1)
    - [NON Logique (`!`)](#non-logique-)
      - [Syntaxe dans `if`](#syntaxe-dans-if-2)
  - [Combinaison de Conditions](#combinaison-de-conditions)
    - [Exemple Combiné](#exemple-combiné)
  - [Utilisation de `[[ ]]` pour les Conditions Composites](#utilisation-de---pour-les-conditions-composites)
    - [Exemple avec `[[ ]]`](#exemple-avec--)
  - [Conseils et Bonnes Pratiques](#conseils-et-bonnes-pratiques)
  - [Conclusion](#conclusion)


# Les Conditions Composites en Bash

Les conditions composites permettent d'évaluer plusieurs expressions conditionnelles en une seule instruction, offrant ainsi une flexibilité et une puissance accrues dans le contrôle de flux des scripts Bash. Ce guide explique comment combiner des conditions simples pour former des conditions composites à l'aide des opérateurs logiques ET (`&&`), OU (`||`), et NON (`!`).

## Opérateurs Logiques

### ET Logique (`&&`)

L'opérateur ET exécute la deuxième condition uniquement si la première condition est vraie.

#### Syntaxe dans `if`

```bash
if [ condition1 ] && [ condition2 ]; then
  # Commandes si condition1 et condition2 sont vraies
fi
```

#### Syntaxe dans une Commande

```bash
[ condition1 ] && [ condition2 ] && echo "Les deux conditions sont vraies."
```

### OU Logique (`||`)

L'opérateur OU exécute la deuxième condition si la première condition est fausse.

#### Syntaxe dans `if`

```bash
if [ condition1 ] || [ condition2 ]; then
  # Commandes si condition1 ou condition2 est vraie
fi
```

#### Syntaxe dans une Commande

```bash
[ condition1 ] || echo "Condition1 est fausse."
```

### NON Logique (`!`)

L'opérateur NON inverse l'état de la condition.

#### Syntaxe dans `if`

```bash
if ! [ condition ]; then
  # Commandes si condition est fausse
fi
```

## Combinaison de Conditions

Les conditions composites peuvent être complexes, combinant plusieurs opérateurs logiques pour former des expressions conditionnelles précises.

### Exemple Combiné

```bash
if [ condition1 ] && ([ condition2 ] || [ condition3 ]); then
  # Commandes si condition1 est vraie ET (condition2 OU condition3 est vraie)
fi
```

## Utilisation de `[[ ]]` pour les Conditions Composites

L'utilisation de `[[ ]]` au lieu de `[ ]` offre plus de flexibilité et évite certains pièges, comme les problèmes avec les chaînes vides ou le besoin d'échapper certains caractères.

### Exemple avec `[[ ]]`

```bash
if [[ condition1 && (condition2 || condition3) ]]; then
  # Commandes si condition1 est vraie ET (condition2 OU condition3 est vraie)
fi
```

Cette syntaxe permet l'utilisation de `&&` et `||` à l'intérieur d'une unique expression conditionnelle sans nécessiter de commandes supplémentaires.

## Conseils et Bonnes Pratiques

- **Lisibilité** : Les conditions composites peuvent rapidement devenir complexes. Utilisez des commentaires et formatez votre code pour améliorer sa lisibilité.
- **Parenthèses** : Utilisez des parenthèses pour grouper clairement vos conditions et contrôler l'ordre d'évaluation.
- **Préférez `[[ ]]` pour les Tests Avancés** : `[[ ]]` gère mieux les chaînes et permet des comparaisons avancées plus intuitives.

## Conclusion

Les conditions composites en Bash sont puissantes et offrent une grande flexibilité pour écrire des scripts complexes. Maîtriser l'utilisation des opérateurs logiques ET, OU, et NON dans le contexte des scripts Bash vous permet de construire des logiques conditionnelles sophistiquées et efficaces. Toujours viser à maintenir une bonne lisibilité et à utiliser les fonctionnalités avancées de Bash pour simplifier et sécuriser vos expressions conditionnelles.