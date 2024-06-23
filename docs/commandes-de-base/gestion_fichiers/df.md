
- [Documentation de la fonction `df`](#documentation-de-la-fonction-df)
  - [Syntaxe:](#syntaxe)
  - [Options principales:](#options-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
  - [1. Afficher l'espace disque avec des unités lisibles](#1-afficher-lespace-disque-avec-des-unités-lisibles)
  - [2. Lister tous les systèmes de fichiers, y compris ceux de taille zéro](#2-lister-tous-les-systèmes-de-fichiers-y-compris-ceux-de-taille-zéro)
  - [3. Afficher les types de systèmes de fichiers avec l'espace disque](#3-afficher-les-types-de-systèmes-de-fichiers-avec-lespace-disque)
  - [4. Afficher l'espace disque pour un type de système de fichiers spécifique](#4-afficher-lespace-disque-pour-un-type-de-système-de-fichiers-spécifique)
  - [5. Exclure un type de système de fichiers spécifique de l'affichage](#5-exclure-un-type-de-système-de-fichiers-spécifique-de-laffichage)
  - [6. Afficher un résumé total de l'espace disque utilisé et disponible](#6-afficher-un-résumé-total-de-lespace-disque-utilisé-et-disponible)
- [Cas d'utilisation de la fonction](#cas-dutilisation-de-la-fonction)
  - [1. Surveillance de l'espace disque sur un serveur](#1-surveillance-de-lespace-disque-sur-un-serveur)
  - [2. Identification des systèmes de fichiers à faible espace disque](#2-identification-des-systèmes-de-fichiers-à-faible-espace-disque)
  - [3. Planification de la maintenance du disque](#3-planification-de-la-maintenance-du-disque)
  - [4. Audit des types de systèmes de fichiers](#4-audit-des-types-de-systèmes-de-fichiers)
  - [5. Surveillance de l'espace disque pour un type spécifique de système de fichiers](#5-surveillance-de-lespace-disque-pour-un-type-spécifique-de-système-de-fichiers)
  - [6. Exclure les systèmes de fichiers temporaires ou virtuels de l'affichage](#6-exclure-les-systèmes-de-fichiers-temporaires-ou-virtuels-de-laffichage)
  - [7. Trouver les systèmes de fichiers avec moins de 20% d'espace libre](#7-trouver-les-systèmes-de-fichiers-avec-moins-de-20-despace-libre)
  - [8. Trier les systèmes de fichiers par espace utilisé](#8-trier-les-systèmes-de-fichiers-par-espace-utilisé)
  - [9. Afficher l'utilisation du disque pour les systèmes de fichiers non-temporaires](#9-afficher-lutilisation-du-disque-pour-les-systèmes-de-fichiers-non-temporaires)
  - [10. Surveillance de l'espace disque spécifique à un chemin](#10-surveillance-de-lespace-disque-spécifique-à-un-chemin)
  - [11. Extraction de l'espace disque disponible pour un rapport](#11-extraction-de-lespace-disque-disponible-pour-un-rapport)
  - [12. Vérification de l'espace disque avec alerte pour faible espace disponible](#12-vérification-de-lespace-disque-avec-alerte-pour-faible-espace-disponible)


La commande `df` (disk free) est utilisée dans les systèmes Unix et Linux pour afficher l'espace disque disponible sur tous les systèmes de fichiers montés. Elle fournit des informations cruciales sur l'utilisation du disque, aidant les administrateurs à gérer l'espace disque efficacement.

# Documentation de la fonction `df`

## Syntaxe:
```
df [OPTIONS]... [FILE]...
```

## Options principales:

- `-h, --human-readable`: Affiche les tailles en format lisible par l'homme (par exemple, 1K, 234M, 2G).
- `-a, --all`: Inclut dans le rapport tous les systèmes de fichiers, y compris ceux de taille zéro.
- `-T, --print-type`: Affiche le type de système de fichiers.
- `-t, TYPE`: Affiche les systèmes de fichiers de type TYPE.
- `-x, TYPE`: Exclut les systèmes de fichiers de type TYPE.
- `--total`: Ajoute une ligne affichant les totaux.

# Exemples d'utilisation

## 1. Afficher l'espace disque avec des unités lisibles
   ```bash
   df -h
   ```

## 2. Lister tous les systèmes de fichiers, y compris ceux de taille zéro
   ```bash
   df -a
   ```

## 3. Afficher les types de systèmes de fichiers avec l'espace disque
   ```bash
   df -T
   ```

## 4. Afficher l'espace disque pour un type de système de fichiers spécifique
   ```bash
   df -t ext4
   ```

## 5. Exclure un type de système de fichiers spécifique de l'affichage
   ```bash
   df -x tmpfs
   ```

## 6. Afficher un résumé total de l'espace disque utilisé et disponible
   ```bash
   df --total
   ```

# Cas d'utilisation de la fonction

## 1. Surveillance de l'espace disque sur un serveur
   Pour vérifier rapidement l'espace disque disponible et utilisé sur un serveur, en utilisant des unités faciles à lire.
   ```bash
   df -h
   ```

## 2. Identification des systèmes de fichiers à faible espace disque
   En combinant `df` avec d'autres commandes comme `grep`, on peut identifier les systèmes de fichiers qui sont presque pleins.
   ```bash
   df -h | grep '^[^ ]*  *[89][0-9]%'
   ```

## 3. Planification de la maintenance du disque
   En utilisant `df` pour surveiller l'espace disque disponible, les administrateurs peuvent planifier l'ajout d'espace disque supplémentaire ou la suppression de fichiers inutiles avant d'atteindre une utilisation critique.
   ```bash
   df -h --total
   ```

## 4. Audit des types de systèmes de fichiers
   Pour identifier rapidement les types de systèmes de fichiers utilisés sur le système, facilitant la gestion des supports de stockage et la planification des sauvegardes.
   ```bash
   df -T
   ```

## 5. Surveillance de l'espace disque pour un type spécifique de système de fichiers
   Utile pour les systèmes qui utilisent différents types de systèmes de fichiers pour différentes applications ou services.
   ```bash
   df -h -t ext4
   ```

## 6. Exclure les systèmes de fichiers temporaires ou virtuels de l'affichage
   Pour se concentrer sur l'espace disque des systèmes de fichiers physiques uniquement, en excluant les systèmes de fichiers comme `tmpfs`.
   ```bash
   df -h -x tmpfs -x devtmpfs
   ```
## 7. Trouver les systèmes de fichiers avec moins de 20% d'espace libre
   Ce cas d'utilisation permet d'identifier rapidement les systèmes de fichiers critiques qui pourraient nécessiter une intervention pour libérer de l'espace ou planifier une extension de capacité.
   ```bash
   df -h | awk '$5 > 80 {print $0}'
   ```
   Ici, `awk` est utilisé pour filtrer les lignes où le cinquième champ (utilisation en pourcentage) dépasse 80%, indiquant moins de 20% d'espace libre.

## 8. Trier les systèmes de fichiers par espace utilisé
   Utile pour obtenir une vue d'ensemble de l'utilisation de l'espace disque, triée de manière à mettre en évidence les plus gros consommateurs d'espace.
   ```bash
   df -h | grep -v 'Use%' | sort -k 5 -r
   ```
   Cette commande exclut la ligne d'en-tête (avec `grep -v 'Use%'`), puis trie les résultats en fonction du cinquième champ (pourcentage utilisé), en ordre décroissant.

## 9. Afficher l'utilisation du disque pour les systèmes de fichiers non-temporaires
   Pour concentrer l'attention sur les systèmes de fichiers physiques, excluant les systèmes de fichiers temporaires souvent moins critiques.
   ```bash
   df -h | grep -vE 'tmpfs|devtmpfs'
   ```
   `grep -vE` est utilisé pour exclure les lignes contenant `tmpfs` ou `devtmpfs`, filtrant la sortie pour montrer uniquement les systèmes de fichiers persistants.

## 10. Surveillance de l'espace disque spécifique à un chemin
    Si vous êtes intéressé par l'espace disque disponible pour un chemin spécifique, vous pouvez diriger ce chemin vers `df` pour obtenir les informations pertinentes.
    ```bash
    df -h /path/to/interest | tail -n +2
    ```
    `tail -n +2` est utilisé pour supprimer la ligne d'en-tête de la sortie de `df`, affichant uniquement les informations du système de fichiers concerné.

## 11. Extraction de l'espace disque disponible pour un rapport
    Créer un rapport simple montrant les points de montage et l'espace disponible peut être utile pour les audits ou les vérifications rapides.
    ```bash
    df -h | awk '{print $6, $4}' | tail -n +2
    ```
    Cela utilise `awk` pour extraire les sixième (point de montage) et quatrième (espace disponible) champs de chaque ligne, en excluant la ligne d'en-tête avec `tail`.

## 12. Vérification de l'espace disque avec alerte pour faible espace disponible
    Ce script pourrait être utilisé dans des scripts de maintenance pour générer des alertes lorsque l'espace disque disponible tombe en dessous d'un seuil critique.
    ```bash
    df -h | awk '$5 > 90 {print "Alerte espace disque faible pour:", $6}'
    ```
    Ici, `awk` cherche des systèmes de fichiers où l'utilisation dépasse 90% et imprime un message d'alerte spécifique pour ces points de montage.
