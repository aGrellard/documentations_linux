---
title: TP Scripting shell - git
date: 2024-07-12
date de modification: 2024-07-12
timestamp: 20:24
tags:
  - projet
  - linux
  - programmation
  - bash
  - scripts
  - programmes
status:
  - En cours
type de note:
  - projet
référence:
  - liens web
auteur: aGrellard
---

# TP - git status
Mise en place d'un script bash pour exploiter **les bases du langage bash** sous Linux.
Cet article a pour but de vous guider dans la création d'un script en bash en expliquant les moyens à utiliser pour le réaliser.
Il ne s'agit pas d'un tutoriel ou d'un cours exhaustif sur le langage bash.

## les Besoins
Ce script fonctionnera avec un argument qui fera référence à un dossier.
Nous créerons une liste de **dépôts GitHub** dont les répertoires se trouvent tous dans le dossier ciblé par l'argument.
Ensuite, nous utiliserons la commande `git status` sur chaque dépôt.

## Les étapes

1. **Nous** allons créer un fichier pour y **écrire le code de ce script** : 
	- [[Création-script]]
	- [[Shebang]].
2. **Il** faudra **vérifier** qu'au moins un **argument** a été reçu :
	- [[Structures-Conditionnelles]] et [[Conditions-composite]]
	- [[Variables-Speciales#Arguments et Paramètres]] avec `$1`
	- [[Conditions]] (sur chaîne de caractère) avec `-z`
3. **Sortir** du script en signalant une erreur si l'argument n'est pas valide :
	- [[exit]]
4. **Vérifier** qu'il s'agit bien d'un dossier :
	- [[Structures-Conditionnelles]] et [[Conditions-composite]]
	- [[Conditions]] (sur fichier) avec `-d`
5. **Sortir** du script en signalant une erreur si ce n'est pas un dossier :
	- [[exit]]
6. **Déclarer** quelques [**variables**](https://www.formatux.fr/formatux-bash/module-010-niveau1/index.html#variables) :
	- Une variable `workingdir` pour stocker le répertoire d'où le script est exécuté :
		1. Récupérer le nom du script 
			- [[Variables-Speciales#Arguments et Paramètres]] avec `$0`
		2. Avec le nom du script, récupérer le chemin absolu :
			- [[realpath]] 
		3. Ensuite a partir du chemin absolu on peut récupérer le dossier :
			- nous utiliserons la [[Substitution-de-commandes]] pour [[realpath]]
			- nous passerons ce résulta à [[dirname]]
	- Une variable `repertoire` pour stocker le répertoire des dépôts GitHub.
	- Une variable `array` pour stocker la liste des dépôts GitHub.
		- Stocker la sortie de la commande [[find]] dans la variable `array` de type  **Tableaux**. `array=($(find))`
			- [[Tableaux]]
			- [[Expansion-de-Tableau]]
			- [[Substitution-de-commandes]]
7. **Nous** allons donc utiliser la **commande**  [[find]] 
	- avec les **arguments** suivant :
		1. `-maxdepath` : spécifie le niveau maximum de profondeur auquel `find` doit descendre dans l'arborescence des répertoires. Par exemple, si vous définissez `-maxdepth 2`, `find` ne recherchera qu'à une profondeur de deux niveaux dans les répertoires.
		2. `-type` : permet de spécifier le type de fichier à rechercher
		3. `-name` : permet de rechercher des fichiers ou des répertoires en fonction de leur nom. Vous pouvez utiliser des caractères génériques comme `*` pour correspondre à des motifs.
		4. `-path` utilisée pour faire correspondre le chemin complet d'un fichier ou d'un répertoire à un motif donné.
			- [[find### Utiliser la négation]]
	- [[Substitution-de-commandes]] : Permet de capturer la sortie d'une commande pour l'utiliser comme une variable ou une autre commande.
	- [[redirections]] 
		- ***Sortie standard (1)*** : La sortie normale de la commande.
		- ***Sortie d'erreurs (2)*** : La sortie des messages d'erreur de la commande.
		- **`/dev/null`** : Un fichier spécial qui supprime tout ce qui y est écrit, utile pour ignorer les erreurs.
	- La **sortie standard (1)** sera **redirigée** via la [[Substitution-de-commandes]]
	- Les **erreurs éventuelles** sont **redirigées** vers `/dev/null`, supprimant ainsi les messages d'erreur et ne conservant que les résultats valides.
8. **Maintenant** que nous avons notre **liste de dossier**, on peut utiliser la **boucle** `for` pour **itérer** sur chaque **élément** de la liste.
	- Nous aurons besoins d'utiliser des fonctionnalités spécifique aux variables de type Array : 
		- [[Expansion-de-Tableau]]
			- `@` : En Bash, `@` est utilisé pour accéder à tous les éléments d'un tableau. Par exemple, `${array[@]}` va développer tous les éléments du tableau `array`.
			- `#` : Lorsque utilisé comme préfixe d'une variable, `#` retourne la longueur d'une chaîne de caractères. Dans le contexte des tableaux, `${#array[@]}` retourne le nombre d'éléments dans le tableau `array`.
		- [[Expansion-de-Paramètre]]
			- Grâce à l'expansion de paramètres, nous pouvons développer le tableau `array` en une liste d'arguments séparés, ce qui permet d'itérer sur ses éléments à l'aide d'une boucle `for`.
9.  **Dans** notre boucle for:
	- utilisation de la commande `cd` pour se placer dans le dossier du **dépot github**
	- utilisation de la commande `git status`
	- 

## Connexes 
- [[Chemin-absolue-cannonique]]
- [[Conditions-composite]]
- [[Extension-arithmétique]]
- [Extension-substitution-commande](https://www.pierre-giraud.com/shell-bash/extension-substitution-commande/)
- [Pierre-Giraud](https://www.pierre-giraud.com/shell-bash/)
- [Formateux](https://www.formatux.fr/formatux-bash/module-010-niveau1/index.html#premier-script)