---
title: 
tags:
  - ressource
  - bash
  - linux
  - programmation
  - scripts
status:
  - En cours
type de note:
  - ressource
date: 2024-07-08
---
# Les Opérateurs Logiques[¶](https://agrellard.github.io/documentations_linux/langages/bash/bash-docu/operateurs_logiques/#chapitre-2-les-operateurs-logiques "Permanent link")

Les opérateurs logiques permettent de combiner plusieurs tests.

## ET Logique[¶](https://agrellard.github.io/documentations_linux/langages/bash/bash-docu/operateurs_logiques/#21-et-logique "Permanent link")

- **`&&`** ou **`-a`** dans les expressions `[ ]` (mais `&&` est préféré dans `[[ ]]`).

## OU Logique[¶](https://agrellard.github.io/documentations_linux/langages/bash/bash-docu/operateurs_logiques/#22-ou-logique "Permanent link")

- **`||`** ou **`-o`** dans les expressions `[ ]` (mais `||` est préféré dans `[[ ]]`).

## NON Logique[¶](https://agrellard.github.io/documentations_linux/langages/bash/bash-docu/operateurs_logiques/#23-non-logique "Permanent link")

- **`!`** inverse le résultat d'un test.

## Exemples d'Utilisation[¶](https://agrellard.github.io/documentations_linux/langages/bash/bash-docu/operateurs_logiques/#24-exemples-dutilisation "Permanent link")

```
if [ "$a" -gt 0 ] && [ "$b" -gt 0 ]; then echo "a et b sont positifs"; fi
if [ "$a" -lt 0 ] || [ "$b" -lt 0 ]; then echo "au moins un parmi a et b est négatif"; fi
if ! [ "$a" -eq "$b" ]; then echo "a est différent de b"; fi
```

## Connexes
- [[Conditions]]
- [[Conditions composite]]