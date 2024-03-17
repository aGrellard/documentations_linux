Pour activer la sélection multiple avec le raccourci `Ctrl` + `Alt` + flèche dans VSCode sous Debian (ou dans d'autres distributions Linux où ce raccourci est intercepté par le gestionnaire de fenêtres pour changer de bureau virtuel), vous devez désactiver ou modifier le raccourci dans le gestionnaire de fenêtres. Voici comment vous pouvez le faire dans GNOME, qui est souvent utilisé avec Debian :

### Désactiver le changement de bureau avec `Ctrl` + `Alt` + flèche
1. **Ouvrez les Paramètres de GNOME :** Vous pouvez y accéder via le menu des applications ou en utilisant la recherche.
2. **Allez dans "Clavier" ou "Raccourcis Clavier" :** Le nom peut varier selon la version de GNOME.
3. **Naviguez vers les raccourcis pour les bureaux virtuels ou la navigation :** Vous cherchez les raccourcis liés au changement de bureau, souvent sous une catégorie comme "Navigation" ou "Bureaux virtuels".
4. **Désactivez ou modifiez les raccourcis :** Trouvez les raccourcis pour "Changer de bureau à gauche/droite/haut/bas" qui sont généralement liés à `Ctrl` + `Alt` + flèche, et désactivez-les ou modifiez-les selon vos préférences.

### Alternative : Modifier le raccourci dans VSCode
Si vous préférez ne pas modifier les raccourcis globaux de votre système, vous pouvez reconfigurer les raccourcis dans VSCode pour contourner le conflit :

1. **Ouvrez les Paramètres de raccourcis dans VSCode :** Utilisez `Ctrl` + `Shift` + `P` pour ouvrir la palette de commandes, puis tapez `Open Keyboard Shortcuts (JSON)` pour éditer directement le fichier de configuration des raccourcis.
2. **Trouvez ou ajoutez les raccourcis pour la sélection multiple :** Vous pouvez modifier ou ajouter des raccourcis pour la sélection multiple. Si le raccourci `Ctrl` + `Alt` + flèche n'est pas utilisé par défaut pour cela dans VSCode, vous devrez peut-être ajouter une nouvelle entrée correspondant à l'action souhaitée.

Exemple de modification dans le fichier JSON de raccourcis (remplacez `"key"` par le nouveau raccourci si vous modifiez) :

```json
{
    "key": "ctrl+alt+down",
    "command": "editor.action.insertCursorBelow",
    "when": "editorTextFocus"
},
{
    "key": "ctrl+alt+up",
    "command": "editor.action.insertCursorAbove",
    "when": "editorTextFocus"
}
```

3. **Dans la Palette de Commandes, tapez** : `Open Keyboard Shortcuts (JSON)`. Vous verrez cette option apparaître pendant que vous tapez. Sélectionnez-la et appuyez sur `Entrée`.

