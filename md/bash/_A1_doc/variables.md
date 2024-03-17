- [Les Variables en Bash : Guide Complet](#les-variables-en-bash--guide-complet)
  - [Chapitre 1 : Création et Affectation de Variables](#chapitre-1--création-et-affectation-de-variables)
    - [1.1 Syntaxe de Base](#11-syntaxe-de-base)
    - [1.2 Nommer une Variable](#12-nommer-une-variable)
  - [Chapitre 2 : Accéder aux Valeurs des Variables](#chapitre-2--accéder-aux-valeurs-des-variables)
  - [Chapitre 3 : Manipulation de Chaînes de Caractères](#chapitre-3--manipulation-de-chaînes-de-caractères)
    - [3.1 Concaténation](#31-concaténation)
    - [3.2 Longueur d'une Chaîne](#32-longueur-dune-chaîne)
    - [3.3 Sous-chaînes](#33-sous-chaînes)
  - [Chapitre 4 : Variables Spéciales](#chapitre-4--variables-spéciales)
  - [Chapitre 5 : Passage d'Arguments aux Scripts](#chapitre-5--passage-darguments-aux-scripts)
  - [Chapitre 6 : Opérations Avancées sur les Variables](#chapitre-6--opérations-avancées-sur-les-variables)
    - [6.1 Opérations Arithmétiques](#61-opérations-arithmétiques)
      - [Utilisation de `$((expression))`](#utilisation-de-expression)
      - [Incrémentation et Décrémentation](#incrémentation-et-décrémentation)
      - [Opérations Complexe](#opérations-complexe)
    - [6.2 Variables d'Environnement](#62-variables-denvironnement)
    - [6.3 Remplacement de Commande](#63-remplacement-de-commande)
  - [Conclusion](#conclusion)


# Les Variables en Bash : Guide Complet

Les variables sont au cœur de la programmation en Bash, permettant de stocker et de manipuler des données de différents types. Ce guide détaille la création, l'utilisation et les opérations avancées sur les variables dans les scripts Bash.

## Chapitre 1 : Création et Affectation de Variables

### 1.1 Syntaxe de Base

Pour définir une variable en Bash, utilisez simplement le nom de la variable suivi d'un signe égal (`=`) et de la valeur que vous souhaitez lui affecter. Les espaces autour du signe `=` sont interdits.

```bash
nom="John Doe"
age=25
```

### 1.2 Nommer une Variable

- Le nom doit commencer par une lettre ou un underscore (`_`), suivi de lettres, chiffres ou underscores.
- Bash est sensible à la casse : `Variable` et `variable` sont considérées comme deux variables différentes.

## Chapitre 2 : Accéder aux Valeurs des Variables

Pour accéder à la valeur d'une variable, utilisez le symbole dollar (`$`) suivi du nom de la variable.

```bash
echo $nom  # Affichera "John Doe"
```

## Chapitre 3 : Manipulation de Chaînes de Caractères

### 3.1 Concaténation

La concaténation de chaînes se fait simplement en plaçant les variables et/ou les chaînes l'une à côté de l'autre.

```bash
salutation="Bonjour, $nom!"
echo $salutation  # Affichera "Bonjour, John Doe!"
```

### 3.2 Longueur d'une Chaîne

Pour obtenir la longueur d'une chaîne de caractères, utilisez `${#variable}`.

```bash
echo ${#nom}  # Affichera la longueur de la chaîne "John Doe"
```

### 3.3 Sous-chaînes

Pour extraire une sous-chaîne, utilisez `${variable:position:longueur}`.

```bash
echo ${nom:0:4}  # Affichera "John"
```

## Chapitre 4 : Variables Spéciales

Bash définit plusieurs variables spéciales, comme :

- `$?` : Le statut de sortie de la dernière commande exécutée.
- `$$` : Le PID (identifiant de processus) du script actuel.
- `$0` : Le nom du script en cours d'exécution.
- `$#` : Le nombre d'arguments passés au script.
- `$*` et `$@` : Tous les arguments passés au script. `$@` est souvent utilisé car il traite correctement les chaînes contenant des espaces.

## Chapitre 5 : Passage d'Arguments aux Scripts

Les arguments passés à un script Bash sont accessibles via `$1`, `$2`, etc.

```bash
#!/bin/bash
echo "Le premier argument est : $1"
```

## Chapitre 6 : Opérations Avancées sur les Variables

### 6.1 Opérations Arithmétiques

Utilisez `let`, `$((expression))`, ou `expr` pour les calculs.

```bash
let somme=5+4
echo $somme  # Affichera 9
```

#### Utilisation de `$((expression))`

```bash
a=5
b=3
result=$((a + b))
echo $result  # Affichera 8
```

#### Incrémentation et Décrémentation

```bash
a=$((a + 1))  # Incrémente a
b=$((b - 1))  # Décrémente b
```

#### Opérations Complexe

```bash
result=$((a * b + 5))
```

### 6.2 Variables d'Environnement

Les variables d'environnement fournissent des informations sur l'environnement d'exécution du script. Par exemple, `$PATH` contient les chemins des dossiers où Bash cherche les commandes.

Pour définir une variable d'environnement, utilisez `export` :

```bash
export MA_VARIABLE="valeur"
```

### 6.3 Remplacement de Commande

Pour stocker le résultat d'une commande dans une variable, utilisez le remplacement de commande `$(commande)`.

```bash
heure_actuelle=$(date +%H:%M)
echo "Il est actuellement $heure_actuelle."
```

## Conclusion

Les variables en Bash offrent une flexibilité et une puissance permettant d'écrire des scripts complexes et fonctionnels. En maîtrisant leur manipulation, vous pouvez significativement augmenter l'efficacité et la sophistication de vos scripts Bash. La pratique régulière et l'exploration des différentes commandes et techniques vous aideront à devenir plus compétent dans la gestion des variables en Bash.