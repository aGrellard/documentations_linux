---
title: Chemin-absolue-cannonique
tags:
  - ressource
  - linux
  - informatique
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
date: 2024-07-10
référence:
  - "[[Chemins-absolus]]"
---

Un **chemin absolu** et un **chemin absolu canonique** sont des termes utilisés en informatique pour décrire des chemins de fichiers ou de répertoires dans un système de fichiers. Voici une explication détaillée de chacun :

### Chemin absolu
Un chemin absolu (ou chemin complet) est un chemin qui spécifie l'emplacement exact d'un fichier ou d'un répertoire à partir de la racine du système de fichiers. Il ne dépend pas du répertoire courant et est unique. 

**Caractéristiques d'un chemin absolu :**
- Commence par le répertoire racine (par exemple, `/` sous Unix/Linux ou `C:\` sous Windows).
- Fournit une route complète depuis la racine jusqu'au fichier ou répertoire cible.
- Exemple sous Unix/Linux : `/home/user/documents/report.txt`
- Exemple sous Windows : `C:\Users\User\Documents\report.txt`

### Chemin absolu canonique
Un chemin absolu canonique est une version normalisée d'un chemin absolu. Cela signifie que toutes les références redondantes (comme les `.` pour le répertoire courant et les `..` pour le répertoire parent) sont résolues et supprimées, et les liens symboliques sont également résolus pour donner un chemin unique et simplifié.

**Caractéristiques d'un chemin absolu canonique :**
- Élimine les segments redondants (`.` et `..`).
- Résout les liens symboliques pour pointer directement vers le fichier ou répertoire final.
- Fournit le chemin le plus direct possible.
- Exemple sous Unix/Linux :
  - Chemin avec références redondantes : `/home/user/../user/documents/./report.txt`
  - Chemin canonique : `/home/user/documents/report.txt`
- Exemple sous Windows :
  - Chemin avec références redondantes : `C:\Users\User\..\User\Documents\.\report.txt`
  - Chemin canonique : `C:\Users\User\Documents\report.txt`

En résumé, un chemin absolu vous donne l'emplacement exact d'un fichier ou d'un répertoire, tandis qu'un chemin absolu canonique vous donne la version la plus simple et directe de cet emplacement, sans segments redondants ou ambiguïtés causées par des liens symboliques.
