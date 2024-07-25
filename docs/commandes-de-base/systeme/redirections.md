---
title: redirections
date: 2024-07-18
tags:
  - ressource
  - linux
status:
  - En cours
type de note:
  - ressource
---

- [Introduction aux flux d'entrées et de sorties](#introduction-aux-flux-dentrées-et-de-sorties)
  - [Redirections](#redirections)
    - [Rediriger la sortie standard](#rediriger-la-sortie-standard)
    - [Rediriger l'erreur standard](#rediriger-lerreur-standard)
    - [Rediriger à la fois la sortie standard et l'erreur standard](#rediriger-à-la-fois-la-sortie-standard-et-lerreur-standard)
    - [Rediriger l'entrée standard](#rediriger-lentrée-standard)
    - [Pipelines](#pipelines)
    - [Exemples avancés](#exemples-avancés)
    - [Exemple : Dupliquer des descripteurs](#exemple--dupliquer-des-descripteurs)
      - [Utilisation de `tee` pour la duplication de sortie](#utilisation-de-tee-pour-la-duplication-de-sortie)


# Introduction aux flux d'entrées et de sorties

Dans un environnement Linux, le terminal interagit avec les utilisateurs à travers trois flux principaux :

1. **0 : Entrée standard (stdin)** : C'est le flux d'entrée à travers lequel le terminal reçoit les données. Par défaut, il s'agit de votre clavier.
2. **1 : Sortie standard (stdout)** : C'est le flux de sortie où le terminal affiche les données. Par défaut, il s'agit de votre écran.
3. **2 : Erreur standard (stderr)** : C'est un flux de sortie dédié aux messages d'erreur. Par défaut, il s'affiche également sur votre écran.

## Redirections

Les redirections permettent de diriger les flux d'entrées et de sorties vers des fichiers ou à partir de fichiers, au lieu des sources et destinations par défaut.

### Rediriger la sortie standard

Pour enregistrer la sortie d'une commande dans un fichier, utilisez le caractère `>` suivi du nom du fichier.

```bash
ls > liste_des_fichiers.txt
```

Cette commande redirige la sortie de `ls` vers `liste_des_fichiers.txt`.

### Rediriger l'erreur standard

Utilisez `2>` pour rediriger les erreurs.

```bash
commande_inexistante 2> erreur.txt
```

Les erreurs de `commande_inexistante` seront écrites dans `erreur.txt`.

### Rediriger à la fois la sortie standard et l'erreur standard

```bash
commande > sortie_et_erreur.txt 2>&1
```
```bash
commande > /dev/null 2>&1
```

Ou, de manière plus concise avec la syntaxe `&>` :

```bash
commande &> sortie_et_erreur.txt
```

### Rediriger l'entrée standard

Utilisez `<` pour rediriger l'entrée standard depuis un fichier.

```bash
sort < liste_des_fichiers.txt
```

Cette commande triera le contenu de `liste_des_fichiers.txt`.

### Pipelines

Les pipelines utilisent le caractère `|` pour passer la sortie standard d'une commande comme entrée standard à une autre.

```bash
ls | sort
```

Cette commande liste les fichiers et dossiers puis trie cette liste.

### Exemples avancés

- #### **Compter le nombre de fichiers dans un répertoire** :

  ```bash
  ls | wc -l
  ```

  `wc -l` compte le nombre de lignes, ce qui, dans ce cas, correspond au nombre de fichiers.

- #### **Trouver un fichier spécifique** :

  ```bash
  ls -R | grep 'nom_du_fichier'
  ```

  `ls -R` liste tous les fichiers récursivement, et `grep` filtre cette liste pour afficher seulement ceux qui correspondent à 'nom_du_fichier'.

- #### Créer un fichier sans commande d'entrée

    ```bash
    > fichier_vide.txt
    ```

    Cela crée un nouveau fichier vide `fichier_vide.txt` ou écrase un fichier existant avec un fichier vide, sans avoir besoin d'une commande qui génère une sortie.

- #### Concaténer des fichiers en redirigeant l'entrée

```bash
cat > nouveau_fichier.txt << EOF
Texte ligne 1
Texte ligne 2
EOF
```
    

Ceci utilise l'opérateur `<<` pour rediriger un bloc de texte (délimité par `EOF` dans ce cas) vers `cat`, qui à son tour le redirige vers `nouveau_fichier.txt`. C'est utile pour écrire plusieurs lignes de texte dans un fichier directement depuis le terminal.

- ### Manipulation et analyse des flux d'E/S

Les outils comme `grep`, `awk`, et `sed` permettent de manipuler et d'analyser les données à l'intérieur de ces flux.

- **Filtrer la sortie** : `grep 'motif'` extrait les lignes contenant 'motif'.
- **Analyse et transformation** : `awk '{print $1}'` imprime la première colonne de chaque ligne.
- **Édition en flux** : `sed 's/ancien/nouveau/g'` remplace toutes les occurrences de 'ancien' par 'nouveau'.


### Exemple : Dupliquer des descripteurs

Imaginons que vous voulez rediriger à la fois stdout et stderr vers le même fichier mais également conserver stderr sur l'écran. Ceci peut être accompli en dupliquant le descripteur de stderr avant de le rediriger.

```bash
commande 2>&1 1>fichier.log | tee erreur.log
```

Cette commande complexe fait plusieurs choses :
1. `2>&1` redirige stderr vers la destination courante de stdout (l'écran, dans ce cas).
2. `1>fichier.log` redirige ensuite stdout (qui inclut maintenant ce qui était destiné à stderr) vers `fichier.log`.
3. `| tee erreur.log` prend la sortie de stderr (avant qu'elle soit redirigée) et la duplique dans `erreur.log` tout en la laissant s'afficher à l'écran.

#### Utilisation de `tee` pour la duplication de sortie

La commande `tee` est utilisée pour lire depuis l'entrée standard et écrire à la fois dans la sortie standard et dans un fichier. Cela est particulièrement utile pour conserver une trace de la sortie d'une commande tout en visualisant cette sortie en temps réel.

```bash
ls | tee liste_des_fichiers.txt
```

Cette commande affiche la sortie de `ls` dans le terminal et écrit également cette sortie dans `liste_des_fichiers.txt`.