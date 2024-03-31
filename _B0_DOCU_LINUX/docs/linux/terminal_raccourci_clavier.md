### Raccourcis fournis
- **Ctrl+A** : Déplace le curseur au début de la ligne de commande.
- **Ctrl+E** : Déplace le curseur à la fin de la ligne de commande.
- **Ctrl+D** : Envoie un EOF (End Of File) pour fermer le terminal si la ligne est vide. Dans un contexte d'entrée, cela peut également servir à supprimer le caractère sous le curseur.
- **Ctrl+W** : Supprime le mot à gauche du curseur sur la ligne de commande.
- **Ctrl+X puis E** : Lance un éditeur de texte (`$EDITOR`, par défaut souvent `vi` ou `nano`) pour éditer la ligne de commande actuelle. Ceci peut varier en fonction de la configuration de l'environnement.
- **Ctrl+R** : Active la recherche récursive dans l'historique des commandes. En tapant après avoir activé ce raccourci, vous recherchez une commande précédente contenant le texte saisi.
- **Esc + .** ou **Alt+.** : Insère le dernier argument de la commande précédente à l'emplacement actuel du curseur. Répéter ce raccourci remonte dans l'historique des arguments.

### Autres raccourcis utiles
- **Ctrl+K** : Supprime tout le texte à droite du curseur jusqu'à la fin de la ligne.
- **Ctrl+U** : Supprime tout le texte à gauche du curseur jusqu'au début de la ligne. Dans certains cas, il supprime toute la ligne.
- **Ctrl+L** : Efface l'écran, équivalent à la commande `clear`.
- **Ctrl+Y** : Colle (ou "yank") le texte supprimé par Ctrl+U, Ctrl+K, ou Ctrl+W.
- **Ctrl+C** : Interrompt la commande en cours d'exécution et retourne à la ligne de commande. Il envoie le signal `SIGINT` au processus en cours.
- **Ctrl+Z** : Suspend le processus en cours en envoyant le signal `SIGSTOP`. Vous pouvez le reprendre plus tard en arrière-plan avec `bg` ou en avant-plan avec `fg`.
- **Ctrl+T** : Transpose (échange) le caractère avant le curseur avec le caractère sous le curseur.
- **Alt+B** : Se déplace en arrière d'un mot dans la ligne de commande.
- **Alt+F** : Se déplace en avant d'un mot dans la ligne de commande.

