## Gnome

### 1. Vérifier les Paramètres de VSCode
- Assurez-vous que la fonctionnalité de sélection multiple est activée dans les paramètres de VSCode. Bien qu'il n'y ait pas de paramètre spécifique pour activer ou désactiver `Alt` + clic pour la sélection multiple, il est bon de vérifier si d'autres paramètres relatifs au comportement de la souris ont été modifiés.

### 2. Tester dans un Nouvel Environnement de Bureau ou une Session Xorg
- Si vous utilisez Wayland, essayez de passer à une session Xorg pour voir si le problème persiste, car certains comportements de la souris peuvent différer entre Wayland et Xorg.
- Si vous utilisez un environnement de bureau particulier (comme GNOME, KDE, etc.), essayez de voir si le problème se pose également dans un environnement différent.

### 3. Vérifier les Raccourcis Globaux du Système
- Certains environnements de bureau ou gestionnaires de fenêtres utilisent `Alt` + clic gauche pour des fonctions comme déplacer des fenêtres. Vérifiez les paramètres de raccourcis globaux de votre système pour s'assurer qu'il n'y a pas de conflit.
- Sous GNOME, KDE, ou d'autres environnements, cherchez dans les paramètres des raccourcis clavier ou dans le gestionnaire de configurations pour modifier ou désactiver les raccourcis en conflit.

### 4. Utiliser un Outil de Configuration de Clavier
- Utilisez un outil comme `dconf-editor` sous GNOME pour rechercher et modifier les paramètres de clavier et de souris qui pourraient être en conflit avec VSCode.



## Désactivation ou Reconfiguration de `Alt` + Clic Gauche sous Cinnamon

1. **Ouvrir le Menu des Paramètres du Système**
   - Vous pouvez le faire en cliquant sur le menu, puis en sélectionnant `Paramètres du système` ou en recherchant "Paramètres du système" dans la barre de recherche.

2. **Accéder aux Paramètres de la Fenêtre**
   - Dans les Paramètres du système, cherchez une section nommée `Fenêtres`, `Gestion de la fenêtre`, ou quelque chose de similaire. Sous Cinnamon, cela peut souvent se trouver sous la catégorie `Préférences`.

3. **Chercher l'Option de Mouvement de la Fenêtre**
   - À l'intérieur des paramètres de la fenêtre, recherchez une option qui contrôle le comportement du mouvement de la fenêtre. Ceci peut être sous une sous-section comme `Comportement` ou directement visible dans les options principales.

4. **Modifier ou Désactiver la Touche de Modification**
   - Vous devriez trouver une option permettant de changer ou de désactiver la touche de modification utilisée pour déplacer les fenêtres. Par défaut, cela est souvent réglé sur `Alt`, mais vous pouvez le changer en une autre touche (comme `Super`, c'est-à-dire la touche Windows sur la plupart des claviers) ou le désactiver complètement si vous préférez ne pas utiliser cette fonctionnalité.

5. **Sauvegarder Vos Changements**
   - Une fois que vous avez fait votre choix, assurez-vous de sauvegarder ou d'appliquer vos modifications. Les effets devraient être immédiats.

