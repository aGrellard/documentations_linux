# Tutoriel et Documentation Complète sur `tty-clock`

## Introduction

`tty-clock` est une horloge simple mais élégante pour le terminal. Elle affiche l'heure et, optionnellement, la date, dans un format numérique. Elle est particulièrement appréciée pour son faible encombrement et sa facilité d'utilisation dans des environnements de terminal ou des TTYs.

## Installation

`tty-clock` peut ne pas être disponible dans les dépôts officiels de toutes les distributions Linux, mais elle peut souvent être trouvée dans les dépôts communautaires ou compilée à partir des sources.

- Sur **Arch Linux** (disponible sur AUR) :

  ```bash
  yay -S tty-clock
  ```

- Compilation à partir des sources (pour les autres distributions) :

  ```bash
  git clone https://github.com/xorg62/tty-clock.git
  cd tty-clock
  make
  sudo make install
  ```

## Options et Paramètres

`tty-clock` offre plusieurs options de ligne de commande pour personnaliser l'affichage :

- `-C [0-7]` : Définit la couleur de l'horloge (selon les couleurs du terminal).
- `-B` : Active l'utilisation d'un fond coloré pour les chiffres.
- `-b` : Active le mode "gras" pour les chiffres.
- `-c` : Centre l'horloge dans le terminal.
- `-d` : Active l'affichage de la date.
- `-D` : Active l'affichage des secondes.
- `-f` : Active l'utilisation de la police par défaut (désactive `-B` et `-b`).
- `-r` : Active l'affichage en mode 12 heures avec AM/PM.
- `-s` : Active l'effet de défilement des chiffres.
- `-t` : Active l'affichage des secondes sous forme de texte.
- `-x [num]` : Définit la position horizontale de l'horloge.
- `-y [num]` : Définit la position verticale de l'horloge.
- `-h` : Affiche l'aide et quitte.
- `-v` : Affiche la version et quitte.

## Exemples d'Utilisation de `tty-clock`

### Lancer `tty-clock` avec la Couleur par Défaut

```bash
tty-clock
```

### Lancer `tty-clock` avec une Couleur Spécifique

Pour afficher l'horloge en cyan :

```bash
tty-clock -C 6
```

### Afficher l'Horloge et la Date au Centre du Terminal

```bash
tty-clock -c -d
```

### Afficher l'Horloge avec les Secondes

```bash
tty-clock -D
```

### Utiliser le Mode 12 Heures avec AM/PM

```bash
tty-clock -r
```

### Personnaliser la Position de l'Horloge

Pour placer l'horloge en bas à droite du terminal :

```bash
tty-clock -x [largeur_terminal] -y [hauteur_terminal]
```
Notez que `[largeur_terminal]` et `[hauteur_terminal]` doivent être remplacés par des valeurs numériques appropriées.

### Afficher l'Horloge avec un Fond Coloré

```bash
tty-clock -B
```

## Bonnes Pratiques

- **Personnalisation** : Utilisez les options de `tty-clock` pour personnaliser l'affichage selon vos préférences ou besoins. Cela peut être particulièrement utile pour intégrer l'horloge dans des environnements de travail spécifiques.
- **Utilisation dans des Scripts** : `tty-clock` peut être lancé dans des scripts shell pour fournir une horloge visuelle lors de l'exécution de tâches de longue durée dans le terminal.
- **Utilisation en Tant que Réveil** : Avec l'option `-D`, `tty-clock` peut servir de réveil simple lorsque vous travaillez tard.

## Conclusion

`tty-clock` est un outil simple mais flexible pour afficher l'heure dans le terminal, offrant diverses options de personnalisation. Que vous cherchiez à ajouter un peu de flair à votre terminal ou que vous ayez besoin d'une horloge visible pendant que vous travaillez, `tty-clock` est une excellente solution.