---
title: TP Scripting bash - texte_1
date: 2024-07-18
date de modification: 2024-07-18
timestamp: 12:41
tags:
  - projet
status:
  - En cours
type de note:
  - projet
référence:
  - liens web
auteur:
---
## Analyse et Transformation de Rapports Textuels

### Script pour créer l'environnement de l'exercice

Voici un script qui crée l'environnement nécessaire pour l'exercice. Exécutez ce script avant de commencer l'exercice.

```bash
#!/bin/bash

# Créer la structure de répertoires pour l'exercice
mkdir -p ExerciceRapports

# Créer un fichier de rapport avec du contenu
echo -e "Date: 2023-07-01\nSection: A\nDetails: Item1, Item2, Item3\nSummary: Completed\n\nDate: 2023-07-02\nSection: B\nDetails: Item4, Item5\nSummary: Pending\n\nDate: 2023-07-03\nSection: A\nDetails: Item6, Item7, Item8, Item9\nSummary: Completed" > ExerciceRapports/rapport.txt
```

### Énoncé de l'exercice

Enregistrez ce script sous le nom `setup_exercice_rapports.sh` et exécutez-le avec la commande `bash setup_exercice_rapports.sh` pour préparer l'environnement.

Votre tâche consiste à créer et utiliser des fonctions pour analyser et transformer des rapports textuels en utilisant des outils de traitement de texte. Vous devez :

1. Créer des fonctions pour extraire des sections spécifiques du rapport, compter le nombre de rapports complets et en attente, et résumer les détails des sections.
2. Utiliser ces fonctions pour traiter le fichier `ExerciceRapports/rapport.txt`.
3. Enregistrer les résultats sous forme de journal.
### Instructions :

1. **Créer une fonction pour extraire des sections spécifiques :**
   - Créez une fonction `extraire_sections` qui prend en argument un fichier de rapport et retourne les sections spécifiques.

2. **Créer une fonction pour compter les rapports complets et en attente :**
   - Créez une fonction `compter_rapports` qui prend en argument un fichier de rapport et retourne le nombre de rapports complets et en attente.

3. **Créer une fonction pour résumer les détails des sections :**
   - Créez une fonction `resumer_details` qui prend en argument un fichier de rapport et retourne un résumé des détails par section.

4. **Utiliser les fonctions :**
   - Utilisez les fonctions pour extraire les sections, compter les rapports complets et en attente, et résumer les détails des sections.
   - Enregistrez les résultats dans un fichier de journal.
## Créations des affichages

> [!Extraire des sections]
> **`grep -E`** : l'option **`-E`** indique à grep d'utiliser des **expressions régulière étendues **
> - `"^motif\@:.*"`
> 	- `^` : **ancre** le début de ligne, la correspondance doit commencer au tout **début de la ligne**.
> 	- `motif\@:`
> 		- `\` : par sécurité on échappe le `@`même si ce n'est pas obligatoire
> 		- le motif a rechercher est :** `motif@:`**
> 	- `.*`:
> 		- `.` : correspond a **n'importe qu'elle caractères** sauf à un caractère de nouvelle ligne.
> 		- `*` : Correspond a zéro ou plusieurs **caractères** qui le **précède** (*dans l'expression*).
> 		- Donc `.*` indique une correspondance de zéro ou plusieurs caractère de n'importe qu'elle type jusqu'au caractère de nouvelle ligne.
> 
> grâce a la commande `grep -e` on va pouvoir extraire les section du fichier texte.

> [!Compter le nombres de ligne ou une occurence a etait trouver]
> `grep -c "Summary: Completed"` : au lieu d'afficher les lignes l'option `-c` permet d'afficher le **nombre** de ligne qui contienne le motif a rechercher.
> - "Summary: Completed" : motifs a rechercher
> 
> grâce a la commande `grep -c` on peut compter le nombre de ligne avec la correspondance Completed ou Pending
> 

## Création d'un tableau associatif

 > `local -A` permet de déclarer un tableau associatif : [Tableaux](../langages/bash/bash-docu/Tableaux.md)

boucler a l'aide dune boucle `while` sur chaque ligne d'un fichier texte
- [IFS](../langages/bash/bash-docu/IFS.md)
-  [[02_RESSOURCES/bash - commandes/read|read]] et [while read -r - 1](../langages/bash/bash-docu/while read -r - 1.md) et [while read -r - 2](../langages/bash/bash-docu/while read -r - 2.md)
- [[redirections]]
- [structure_boucles](../langages/bash/bash-docu/structure_boucles.md)

```bash
while IFS= read -r ligne; do
```

>`read -r` : l'option `r` permet d’empêcher l'interprétation des caractérise d'échappement permettant ainsi des les lire littéralement.

>`IFS=` redéfinit `IFS` comme une chaîne vide, donc la ligne entière est lue comme un seul champ, sans que les espaces, `\n` ou `\t` soient interprétés comme des séparateurs de champs.

>par défaut IFS est = à : `IFS=$' \t\n'`

>Le but de redéfinir `IFS=`  et d'utiliser `read -r` est de conserver la structure du fichier par exemple des **block de code** qui on une certaine indentation.

Test sur chaines de caractères : [Conditions](../langages/bash/bash-docu/Conditions.md) et [Conditions-composite](../langages/bash/bash-docu/Conditions-composite.md) et [Structures-Conditionnelles](../langages/bash/bash-docu/Structures-Conditionnelles.md)
- `^Section:\ (.*)`
	- `^` : **ancre** le début de ligne, la correspondance doit commencer au tout **début de la ligne**.
	- `\ ` : échappement pour un espace.
	- `(.*)`
		- les parenthèses créent un groupe de capture pour capturer tous ce qui suite après le motif `Section: `
		- `.` : correspond a **n'importe qu'elle caractères** sauf à un caractère de nouvelle ligne.
		- `*` : Correspond a zéro ou plusieurs **caractères** qui le **précède** (_dans l'expression_).
- Dans une expression régulière `( ... )` définit un **groupe de capture**, ce groupe permet de spécifier qu'elle **partie la chaîne correspondante** nous voulons extraire et y accéder dans notre script.
  **[BASH_REMATCH](../langages/bash/bash-docu/BASH_REMATCH.md)** permet d’accéder aux **groupe de captures** c'est une variable spécial de type tableau donc nous devrons passer par l'[Expansion-de-Paramètre](../langages/bash/bash-docu/Expansion-de-Paramètre.md) pour y accéder.
- Dans un **test** sur chaîne des caractères nous pouvons faire un **test de comparaison** en utilisant les **expressions régulière** grâce a l'opérateur `=~` et `[[ ... ]]` .
- **L'expression régulière s'écrit sans utiliser les quotes**.

> [!NOTE]
> **Test** si un élément du tableau associatif et **vide** ou s'il contient une **valeur** 
> - `[[ -z "${tableau[$key]}" ]]`
> - si l'élément contient déjà une valeur on peut **rajouter** une valeur  :
> 	-  `tableau[$key]="${tableau[$key]}, nouvelle valeur" `

> [!NOTE]
> Il faut utiliser l'[Expansion-de-Paramètre](../langages/bash/bash-docu/Expansion-de-Paramètre.md) pour accéder a l'élément d'un tableaux avec son indice : `"${tableau[$indice]}"`
> 
> pour affecter des valeurs il ne faut pas d’espaces entre les 2 opérande du signe `=`
> 
> on accède au **clé** d'un tableau associatif en utilisant le préfixe **`!`** sur le tableau: `"${!tableau[@]}"`










