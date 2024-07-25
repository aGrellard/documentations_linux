---
title: exit
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
source:
  - chatgpt
date: 2024-07-10
---
La commande `exit` en Bash est utilisée pour quitter un script ou une session de terminal. Voici quelques points importants à connaître sur son fonctionnement :

1. **Quitter une session de terminal** :
   - Lorsque vous tapez `exit` dans un terminal Ba
sh interactif, la session se termine et la fenêtre du terminal se ferme (ou revient à l'invite de commande si c'est un terminal intégré dans un IDE ou une interface utilisateur graphique).

2. **Quitter un script avec un code de retour** :
   - Dans un script Bash, vous pouvez utiliser `exit` pour terminer le script et renvoyer un code de sortie à l'environnement qui a exécuté le script. Par exemple, `exit 0` indique que le script s'est terminé avec succès, tandis que `exit 1` (ou tout autre nombre différent de zéro) indique une erreur ou une condition anormale.
   ```bash
   #!/bin/bash
   echo "Début du script"
   # Terminer le script avec un code de sortie 0 (succès)
   exit 0
   echo "Cette ligne ne sera pas exécutée"
   ```

3. **Codes de sortie** :
   - Les codes de sortie sont importants pour les scripts et les outils qui automatisent l'exécution des scripts, car ils permettent de déterminer si le script s'est terminé correctement ou s'il y a eu une erreur. Par convention, `0` signifie succès et tout autre nombre (généralement `1`) signifie échec.

4. **Utilisation dans des fonctions** :
   - Dans les fonctions, l'utilisation de `exit` terminera le script entier, pas seulement la fonction. Si vous voulez seulement quitter une fonction, vous devriez utiliser `return` à la place.
   ```bash
   my_function() {
       echo "Dans la fonction"
       return 1
       echo "Cette ligne ne sera pas exécutée"
   }

   my_function
   echo "Après l'appel de fonction"
   ```

En résumé, `exit` en Bash est une commande puissante pour contrôler la fin des scripts et des sessions, ainsi que pour communiquer l'état d'exécution aux processus appelants.