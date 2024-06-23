- [Navigation dans le Terminal](#navigation-dans-le-terminal)
- [Manipulation de Texte](#manipulation-de-texte)
- [Gestion et Contrôle des Processus](#gestion-et-contrôle-des-processus)
- [Recherche et Historique](#recherche-et-historique)
- [Complétion et Correction](#complétion-et-correction)
- [Navigation dans un Fichier avec `cat`, `nano`, `less`, etc.](#navigation-dans-un-fichier-avec-cat-nano-less-etc)

### Navigation dans le Terminal

- **Ctrl+A** : Déplace le curseur au début de la ligne. Utile pour retourner rapidement au début sans utiliser les touches fléchées.
- **Ctrl+E** : Déplace le curseur à la fin de la ligne. Cela vous permet de passer rapidement à la fin pour continuer votre saisie.
- **Ctrl+B** : Déplace le curseur d'un caractère vers la gauche, similaire à la flèche gauche, sans supprimer de caractères.
- **Ctrl+F** : Déplace le curseur d'un caractère vers la droite, comme la flèche droite, sans supprimer de caractères.
- **Alt+B** : Déplace le curseur d'un mot vers la gauche, permettant de naviguer plus rapidement dans les commandes longues.
- **Alt+F** : Déplace le curseur d'un mot vers la droite, idéal pour sauter par-dessus des mots sans effacer.
- **Ctrl+XX** : Bascule entre le début de la ligne et la position actuelle du curseur, offrant une méthode rapide pour revenir à une position antérieure.

### Manipulation de Texte

- **Ctrl+K** : Supprime tout à droite du curseur jusqu'à la fin de la ligne. Utilisé pour effacer rapidement la partie inutile d'une commande.
- **Ctrl+U** : Supprime tout à gauche du curseur jusqu'au début de la ligne. Parfait pour corriger des erreurs au début d'une commande sans effacer toute la ligne.
- **Ctrl+W** : Supprime le mot à gauche du curseur, offrant une méthode efficace pour corriger des erreurs de mot spécifiques.
- **Ctrl+Y** : Colle le texte précédemment coupé avec `Ctrl+U`, `Ctrl+K`, ou `Ctrl+W`. Utilisez-le pour récupérer ou déplacer du texte.
- **Ctrl+T** : Transpose les deux caractères avant le curseur, utile pour corriger rapidement les fautes de frappe.
- **Alt+T** : Transpose les deux mots avant le curseur, permettant de changer l'ordre des mots sans les supprimer.
- **Alt+L** : Convertit en minuscules le mot après le curseur, utile pour corriger la casse sans ressaisir le mot.
- **Alt+U** : Convertit en majuscules le mot après le curseur, permettant de mettre en évidence des mots spécifiques ou de corriger la casse.

### Gestion et Contrôle des Processus

- **Ctrl+C** : Interrompt la commande en cours d'exécution, envoyant le signal `SIGINT` pour arrêter l'exécution.
- **Ctrl+Z** : Suspend le processus en cours, le mettant en arrière-plan. Peut être repris avec `fg` ou `bg`.
- **Ctrl+D** : Envoie un signal EOF (End Of File) pour fermer le terminal ou la session en cours si la ligne est vide. Utilisé aussi pour terminer l'entrée dans de nombreux programmes interactifs.
- **Ctrl+S** : Suspend temporairement le défilement du terminal, utile pour lire des sorties longues.
- **Ctrl+Q** : Reprend le défilement du terminal après une suspension avec `Ctrl+S`.

### Recherche et Historique

- **Ctrl+R** : Active la recherche récursive dans l'historique des commandes, permettant de retrouver rapidement une commande utilisée précédemment.
- **Ctrl+P** ou `Flèche vers le haut` : Navigue à la commande précédente dans l'historique.
- **Ctrl+N** ou `Flèche vers le bas` : Navigue à la commande suivante dans l'historique.
- **Alt+.** ou **Alt+_** : Insère le dernier argument de la commande précédente. Très utile pour réutiliser des arguments sans les retaper.
- **Ctrl+G** : Annule l'interaction en cours dans le mode de recherche d'historique ou de complétion, permettant de quitter sans effectuer de changement.

### Complétion et Correction

- **Tab** : Tente de compléter le nom

 du fichier, du dossier, de la commande ou de l'option commencé à taper, accélérant la saisie des commandes.
- **Alt+?** : Affiche une liste de complétions possibles lorsque la complétion automatique avec Tab est ambiguë, offrant un choix entre plusieurs options.

### Navigation dans un Fichier avec `cat`, `nano`, `less`, etc.

- **`nano`** : Dans `nano`, utilisez `Ctrl+Y` pour avancer d'une page et `Ctrl+V` pour reculer. `Ctrl+O` sauvegarde le fichier, et `Ctrl+X` quitte l'éditeur.
- **`less`** : Dans `less`, utilisez `Space` pour avancer d'une page, `b` pour reculer, `/` pour rechercher en avant, et `?` pour rechercher en arrière. `q` quitte `less`.
- **`cat`** ne permet pas la navigation interactive, mais peut être combiné avec `less` ou `more` pour visualiser le contenu d'un fichier page par page.

