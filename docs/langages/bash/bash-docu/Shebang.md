---
title: Shebang
date: 2024-07-18
tags:
  - ressource
  - linux
  - bash
  - scripts
  - programmation
status:
  - En cours
type de note:
  - ressource
référence:
  - "[[Création-script]]"
---
# Documentation pour Shebang sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Fonctionnement du Shebang](#fonctionnement-du-shebang)
4. [Syntaxe du Shebang](#syntaxe-du-shebang)
5. [Options du Shebang](#options-du-shebang)
    - [Option `#!/bin/bash`](#option-binbash)
    - [Option `#!/usr/bin/env python3`](#option-usrbinenv-python3)
    - [Option `#!/usr/bin/perl`](#option-usrbinperl)
6. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Script Bash](#exemple-1--script-bash)
    - [Exemple 2 : Script Python](#exemple-2--script-python)
    - [Exemple 3 : Script Perl](#exemple-3--script-perl)


## Introduction

Le shebang, ou hashbang, est une séquence de caractères (`#!`) utilisée au début d'un script pour indiquer au système quel interpréteur utiliser pour exécuter le script. C'est une fonctionnalité couramment utilisée dans les systèmes Unix et Linux pour permettre l'exécution de scripts avec différents langages de programmation.

## Installation

Le shebang n'a pas besoin d'être installé car il fait partie intégrante du noyau Unix/Linux et des interpréteurs de scripts. Cependant, vous devez avoir l'interpréteur spécifié installé sur votre système.

### Vérifier l'installation de l'interpréteur

Pour vérifier si un interpréteur est installé, vous pouvez utiliser les commandes suivantes :

```bash
which bash
which python3
which perl
```

Ces commandes afficheront le chemin de l'interpréteur s'il est installé.

## Fonctionnement du Shebang

Le shebang indique au système d'exploitation quel interpréteur utiliser pour exécuter le script. Lorsque vous exécutez un script, le système lit la première ligne pour déterminer l'interpréteur à utiliser, puis passe le reste du fichier à cet interpréteur.

## Syntaxe du Shebang

La syntaxe de base du shebang est la suivante :

```bash
#![chemin/vers/interpréteur]
```

### Exemple :

```bash
#!/bin/bash
```

## Options du Shebang

### Option `#!/bin/bash`

Cette option spécifie que le script doit être exécuté avec l'interpréteur Bash.

**Exemple :**

```bash
#!/bin/bash
echo "Hello, world!"
```

**Explication :** Ce script utilise Bash pour exécuter la commande `echo`.

### Option `#!/usr/bin/env python3`

Cette option utilise `env` pour trouver l'interpréteur Python3 dans le PATH de l'utilisateur. Cela rend le script plus portable.

**Exemple :**

```python
#!/usr/bin/env python3
print("Hello, world!")
```

**Explication :** Ce script utilise Python 3 pour exécuter la commande `print`.

### Option `#!/usr/bin/perl`

Cette option spécifie que le script doit être exécuté avec l'interpréteur Perl.

**Exemple :**

```perl
#!/usr/bin/perl
print "Hello, world!\n";
```

**Explication :** Ce script utilise Perl pour exécuter la commande `print`.

## Exemples concrets

### Exemple 1 : Script Bash

```bash
#!/bin/bash
# Script pour afficher un message de bienvenue

echo "Bienvenue sur mon script Bash!"
```

**Explication :**

1. `#!/bin/bash` indique que le script doit être exécuté avec Bash.
2. La commande `echo` affiche un message de bienvenue.

### Exemple 2 : Script Python

```python
#!/usr/bin/env python3
# Script pour afficher un message de bienvenue

print("Bienvenue sur mon script Python!")
```

**Explication :**

1. `#!/usr/bin/env python3` indique que le script doit être exécuté avec Python 3.
2. La commande `print` affiche un message de bienvenue.

### Exemple 3 : Script Perl

```perl
#!/usr/bin/perl
# Script pour afficher un message de bienvenue

print "Bienvenue sur mon script Perl!\n";
```

**Explication :**

1. `#!/usr/bin/perl` indique que le script doit être exécuté avec Perl.
2. La commande `print` affiche un message de bienvenue.

---

Cette documentation vous fournit toutes les informations nécessaires pour comprendre et utiliser efficacement le shebang sous Linux. Pour toute question supplémentaire, consultez les pages de manuel de votre interpréteur ou utilisez la commande `man`.