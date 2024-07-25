# Documentation pour la commande `read` en Bash sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `read`](#fonctionnement-de-la-commande-read)
3. [Syntaxe de la commande `read`](#syntaxe-de-la-commande-read)
4. [Options de la commande `read`](#options-de-la-commande-read)
    - [Option `-p`](#option--p)
    - [Option `-s`](#option--s)
    - [Option `-t`](#option--t)
    - [Option `-n`](#option--n)
    - [Option `-r`](#option--r)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Lecture simple d'une entrée utilisateur](#exemple-1--lecture-simple-dune-entrée-utilisateur)
    - [Exemple 2 : Lecture d'un mot de passe](#exemple-2--lecture-dun-mot-de-passe)
    - [Exemple 3 : Lecture avec un délai d'attente](#exemple-3--lecture-avec-un-délai-dattente)
    - [Exemple 4 : Lecture d'un nombre spécifique de caractères](#exemple-4--lecture-dun-nombre-spécifique-de-caractères)
    - [Exemple 5 : Lecture d'une ligne sans interpréter les caractères d'échappement](#exemple-5--lecture-dune-ligne-sans-interpréter-les-caractères-dé)
6. [Conclusion](#conclusion)

## Introduction

La commande `read` en Bash est utilisée pour lire une ligne d'entrée depuis l'entrée standard (généralement le clavier) ou un autre fichier. Elle permet de capturer l'entrée utilisateur et de l'affecter à une ou plusieurs variables, ce qui est essentiel pour l'interactivité dans les scripts.

## Fonctionnement de la commande `read`

La commande `read` lit une ligne d'entrée et affecte les mots lus à des variables spécifiées. Si aucune variable n'est spécifiée, la ligne lue est stockée dans la variable spéciale `REPLY`.

## Syntaxe de la commande `read`

```bash
read [options] [variable...]
```

### Arguments

- `variable` : Les noms des variables auxquelles affecter les mots lus. Si aucune variable n'est fournie, l'entrée est stockée dans `REPLY`.

## Options de la commande `read`

### Option `-p`

Affiche une invite avant de lire l'entrée.

```bash
read -p "Entrez votre nom : " nom
```

**Explication :** Affiche le message "Entrez votre nom : " avant de lire l'entrée utilisateur.

### Option `-s`

Cache l'entrée de l'utilisateur (utile pour les mots de passe).

```bash
read -s -p "Entrez votre mot de passe : " mot_de_passe
```

**Explication :** L'entrée utilisateur n'est pas affichée à l'écran.

### Option `-t`

Spécifie un délai d'attente en secondes.

```bash
read -t 10 -p "Entrez votre nom (dans les 10 secondes) : " nom
```

**Explication :** La commande attend jusqu'à 10 secondes pour une entrée. Si le temps expire, la commande échoue.

### Option `-n`

Lit un nombre spécifié de caractères sans attendre un retour à la ligne.

```bash
read -n 1 -p "Appuyez sur une touche pour continuer..."
```

**Explication :** Lit un seul caractère et continue immédiatement sans attendre un retour à la ligne.

### Option `-r`

Empêche l'interprétation des caractères d'échappement (tels que `\`).

```bash
read -r -p "Entrez une chaîne : " chaine
```

**Explication :** Lit la ligne telle quelle sans traiter les caractères d'échappement.

## Exemples concrets

### Exemple 1 : Lecture simple d'une entrée utilisateur

```bash
#!/bin/bash
read -p "Entrez votre nom : " nom
echo "Bonjour, $nom !"
```

**Explication :** Le script demande à l'utilisateur d'entrer son nom et affiche un message de bienvenue.

### Exemple 2 : Lecture d'un mot de passe

```bash
#!/bin/bash
read -s -p "Entrez votre mot de passe : " mot_de_passe
echo
echo "Mot de passe entré : $mot_de_passe"
```

**Explication :** Le script lit un mot de passe sans l'afficher à l'écran et le montre ensuite (ce qui n'est pas recommandé pour des raisons de sécurité).

### Exemple 3 : Lecture avec un délai d'attente

```bash
#!/bin/bash
if read -t 5 -p "Entrez votre nom dans les 5 secondes : " nom; then
    echo "Bonjour, $nom !"
else
    echo "Temps écoulé sans réponse."
fi
```

**Explication :** Le script demande à l'utilisateur d'entrer son nom avec un délai de 5 secondes. Si l'utilisateur ne répond pas à temps, un message d'expiration est affiché.

### Exemple 4 : Lecture d'un nombre spécifique de caractères

```bash
#!/bin/bash
read -n 1 -p "Appuyez sur une touche pour continuer..."
echo
echo "Touche appuyée."
```

**Explication :** Le script attend que l'utilisateur appuie sur une touche et continue immédiatement.

### Exemple 5 : Lecture d'une ligne sans interpréter les caractères d'échappement

```bash
#!/bin/bash
read -r -p "Entrez une chaîne : " chaine
echo "Chaîne entrée : $chaine"
```

**Explication :** Le script lit une chaîne d'entrée sans interpréter les caractères d'échappement et l'affiche.

## Conclusion

La commande `read` est un outil puissant pour capturer des entrées utilisateur dans les scripts Bash. Avec ses nombreuses options, elle offre une grande flexibilité pour gérer différents scénarios d'entrée. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man bash` ou la documentation officielle de Bash.