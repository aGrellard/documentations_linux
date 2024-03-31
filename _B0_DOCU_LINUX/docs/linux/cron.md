- [`cron`](#cron)
  - [Introduction](#introduction)
  - [Configuration de Cron Jobs](#configuration-de-cron-jobs)
    - [Commandes et Options](#commandes-et-options)
    - [Format d'une Entrée Cron](#format-dune-entrée-cron)
  - [Exemples d'Utilisation de Cron](#exemples-dutilisation-de-cron)
    - [Exécuter un Script Tous les Jours à Minuit](#exécuter-un-script-tous-les-jours-à-minuit)
    - [Exécuter une Tâche Toutes les Heures](#exécuter-une-tâche-toutes-les-heures)
    - [Exécuter une Tâche Tous les Jours à une Heure Spécifique](#exécuter-une-tâche-tous-les-jours-à-une-heure-spécifique)
    - [Exécuter une Tâche Tous les Lundi](#exécuter-une-tâche-tous-les-lundi)
    - [Exécuter une Tâche Tous les Premiers du Mois](#exécuter-une-tâche-tous-les-premiers-du-mois)
    - [Exécuter une Tâche Toutes les 15 Minutes](#exécuter-une-tâche-toutes-les-15-minutes)
    - [Exécuter une Tâche Toutes les 5 Minutes entre 14h et 14h59](#exécuter-une-tâche-toutes-les-5-minutes-entre-14h-et-14h59)
  - [Bonnes Pratiques](#bonnes-pratiques)
  - [Conclusion](#conclusion)


# `cron`

## Introduction

`cron` est un daemon utilisé dans les systèmes d'exploitation de type Unix pour exécuter des commandes à des intervalles réguliers, spécifiés par l'utilisateur. Les tâches planifiées par `cron` sont appelées "cron jobs". `cron` est extrêmement utile pour automatiser des tâches de maintenance ou d'administration, comme les sauvegardes, les mises à jour de logiciels ou tout script personnalisé.

## Configuration de Cron Jobs

Les cron jobs sont configurés dans une table de planification, connue sous le nom de crontab. Pour modifier la crontab, vous utilisez la commande `crontab` suivie d'une option. Chaque utilisateur sur un système peut avoir sa propre crontab.

### Commandes et Options

- `crontab -e` : Édite la crontab de l'utilisateur courant dans l'éditeur de texte par défaut.
- `crontab -l` : Liste les cron jobs de l'utilisateur courant.
- `crontab -r` : Supprime la crontab de l'utilisateur courant.
- `crontab -u nom_utilisateur` : Spécifie l'utilisateur dont la crontab doit être manipulée (nécessite des privilèges d'administration).

### Format d'une Entrée Cron

Une entrée dans une crontab consiste en six champs séparés par des espaces, suivis par la commande à exécuter :

```
* * * * *  commande à exécuter
┬ ┬ ┬ ┬ ┬
│ │ │ │ │
│ │ │ │ │
│ │ │ │ └─── Jour de la semaine (0 - 7) (Dimanche =0 ou =7)
│ │ │ └───── Mois (1 - 12)
│ │ └─────── Jour du mois (1 - 31)
│ └────────── Heure (0 - 23)
└──────────── Minute (0 - 59)
```

## Exemples d'Utilisation de Cron

### Exécuter un Script Tous les Jours à Minuit

```cron
0 0 * * * /chemin/vers/le/script
```

### Exécuter une Tâche Toutes les Heures

```cron
0 * * * * commande
```

### Exécuter une Tâche Tous les Jours à une Heure Spécifique

```cron
0 14 * * * commande  # Exécute `commande` tous les jours à 14h00.
```

### Exécuter une Tâche Tous les Lundi

```cron
0 0 * * 1 commande  # Exécute `commande` tous les lundi à minuit.
```

### Exécuter une Tâche Tous les Premiers du Mois

```cron
0 0 1 * * commande
```

### Exécuter une Tâche Toutes les 15 Minutes

```cron
*/15 * * * * commande
```

### Exécuter une Tâche Toutes les 5 Minutes entre 14h et 14h59

```cron
*/5 14 * * * commande
```

## Bonnes Pratiques

- **Commenter vos Cron Jobs** : Commentez vos entrées dans la crontab pour rappeler leur fonction.
- **Tester vos Commandes** : Testez vos commandes dans le terminal avant de les ajouter à votre crontab pour vous assurer qu'elles fonctionnent comme prévu.
- **Utiliser des Chemins Complets** : Spécifiez toujours le chemin complet vers les fichiers et commandes dans vos cron jobs pour éviter les erreurs d'exécution.
- **Gérer la Sortie** : Redirigez la sortie standard et la sortie d'erreur de vos commandes pour éviter de recevoir des courriels avec la sortie de vos tâches cron (par exemple, en ajoutant `> /dev/null 2>&1` à la fin de vos commandes).

## Conclusion

`cron` est un outil essentiel pour la planification de tâches automatiques sur les systèmes Unix et Linux. En comprenant le format de la crontab et en suivant les meilleures pratiques, vous pouvez automatiser efficacement une grande variété de tâches de maintenance et d'administration système.