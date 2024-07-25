---
title: 
tags:
  - ressource
  - linux
  - programmation
  - scripts
  - bash
status:
  - En cours
type de note:
  - ressource
source:
  - chatgpt
date: 2024-07-08
---

# Création d'un script en bash
## les étapes de la création du scripts

1. Ouvrir un éditeur de texte :
	Tout d'abord, ouvrez un éditeur de texte tel que Nano, Vim ou Gedit pour commencer à écrire votre script en bash.

2. Définir l'en-tête du script :
	Commencez par définir l'en-tête du script en utilisant la ligne suivante :
	```bash
	#!/bin/bash
	```
	Cette ligne indique au système d'exploitation qu'il doit utiliser l'interpréteur bash pour exécuter le script.

	Cependant, il existe d'autres interpréteurs que vous pouvez spécifier dans l'en-tête d'un script en fonction de vos besoins. Voici quelques exemples d'en-têtes possibles pour la création d'un script :
	1. Pour utiliser l'interpréteur bash :
	```bash
	#!/bin/bash
	```
	
	2. Pour utiliser l'interpréteur sh (shell) :
	```bash
	#!/bin/sh
	```
	
	3. Pour utiliser l'interpréteur zsh (Z shell) :
	```bash
	#!/bin/zsh
	```
	
	4. Pour utiliser l'interpréteur ksh (Korn shell) :
	```bash
	#!/bin/ksh
	```
	
	5. Pour utiliser l'interpréteur dash (Debian Almquist shell) :
	```bash
	#!/bin/dash
```


3. Écrire les commandes du script :
Ensuite, écrivez les commandes que vous souhaitez exécuter dans votre script. Par exemple, vous pouvez créer un script simple qui affiche "Bonjour, monde !" en utilisant la commande suivante :
```bash
echo "Bonjour, monde !"
```

4. Enregistrer le script :
Enregistrez votre script en utilisant une extension .sh pour indiquer qu'il s'agit d'un script en bash. Par exemple, vous pouvez enregistrer votre script sous le nom "bonjour.sh".

5. Rendre le script exécutable :
Pour rendre votre script exécutable, utilisez la commande suivante dans votre terminal :
```bash
chmod +x bonjour.sh
```
Cela permet à votre script d'être exécuté en tant que programme.

6. Exécuter le script :
Pour exécuter votre script, utilisez la commande suivante dans votre terminal :
```bash
./bonjour.sh
```
Cela lancera votre script en bash et affichera "Bonjour, monde !" à l'écran.

