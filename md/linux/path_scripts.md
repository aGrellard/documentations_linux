- [ajouter des scripts au $**PATH**](#ajouter-des-scripts-au-path)
- [zsh: ajouter des scripts au $**PATH**](#zsh-ajouter-des-scripts-au-path)
- [exemple de script python a lier dans le $PATH](#exemple-de-script-python-a-lier-dans-le-path)
  - [hello\_world.py](#hello_worldpy)
  - [traiter\_fichier.py](#traiter_fichierpy)


# ajouter des scripts au $**PATH**

1. **Rendez le script exécutable :**
   - Ajoutez la shebang line (`#!/usr/bin/env python3`) au début de votre script pour indiquer avec quel interpréteur le script doit être exécuté.
   - Rendez le fichier exécutable en utilisant la commande `chmod +x mon_script.py`.

2. **Placez le script dans un dossier inclus dans votre `$PATH` :**
   - Le `$PATH` est une variable d'environnement qui spécifie les répertoires dans lesquels le shell recherche les commandes. Vous pouvez voir les dossiers actuellement dans votre `$PATH` en exécutant `echo $PATH` dans le terminal.
   - Les emplacements communs pour les scripts personnels sont `/usr/local/bin` ou `~/bin` (un dossier `bin` dans votre répertoire personnel).
     - **Pour `/usr/local/bin`** (nécessite des privilèges superutilisateur) : déplacez ou créez un lien symbolique de votre script dans `/usr/local/bin`.
       - Par exemple : 
            ```bash
            sudo mv mon_script.py /usr/local/bin/
            ```
            ou
            ```bash
            sudo ln -s /chemin/vers/mon_script.py /usr/local/bin/mon_script
            ```
     - **Pour `~/bin`** :
       1. Créez le dossier s'il n'existe pas déjà :
            ```bash
            mkdir -p ~/bin
            ```
       2. Déplacez ou créez un lien symbolique de votre script dans `~/bin`.
           - Par exemple :
                ```bash
                mv mon_script.py ~/bin/
                ```
                ou
                ```bash
                ln -s /chemin/vers/mon_script.py ~/bin/mon_script
                ``` 
       3. Assurez-vous que `~/bin` est dans votre `$PATH`. 
          1. Si ce n'est pas le cas, vous pouvez l'ajouter en modifiant le fichier `~/.bashrc`, `~/.bash_profile`, ou `~/.profile` (selon votre shell et configuration) et en ajoutant la ligne :
                ```bash
                export PATH="$HOME/bin:$PATH"
                ```
                Ensuite, rechargez la configuration avec :
                ```bash
                source ~/.bashrc

3. **Utilisez le nom du script pour l'exécuter :**
   - Après avoir suivi ces étapes, vous devriez être capable d'exécuter votre script en tapant simplement son nom (sans le `.py` si vous avez choisi de le renommer lors du déplacement) dans le terminal, peu importe le répertoire dans lequel vous vous trouvez.

**Note :** Si vous travaillez avec des versions spécifiques de Python ou dans des environnements virtuels, assurez-vous que la shebang line de votre script pointe vers l'interpréteur Python appropri

# zsh: ajouter des scripts au $**PATH**

Si vous utilisez `zsh` comme shell, le processus pour ajouter `~/bin` à votre `$PATH` et y accéder rapidement depuis la ligne de commande reste assez similaire à celui de `bash`, avec quelques petites différences dans les fichiers de configuration que vous pourriez modifier.

Pour ajouter `~/bin` à votre `$PATH` en utilisant `zsh`, suivez ces étapes :

1. **Créez le dossier `~/bin` si ce n'est pas déjà fait :**
   ```
   mkdir -p ~/bin
   ```

2. **Ouvrez votre fichier de configuration `zsh` :**
   - Le fichier de configuration pour `zsh` est généralement `~/.zshrc`. Vous pouvez l'ouvrir avec votre éditeur de texte préféré. Par exemple, avec nano, vous feriez :
     ```
     nano ~/.zshrc
     ```

3. **Ajoutez `~/bin` à votre `$PATH` :**
   - À la fin du fichier `~/.zshrc`, ajoutez la ligne suivante :
     ```
     export PATH="$HOME/bin:$PATH"
     ```
   - Cette commande ajoute `~/bin` au début de votre `$PATH`, ce qui signifie que les exécutables dans `~/bin` seront trouvés et exécutés en priorité par rapport à ceux situés dans les autres répertoires listés dans votre `$PATH`.

4. **Sauvegardez le fichier et rechargez la configuration :**
   - Après avoir sauvegardé vos modifications (dans nano, vous appuyeriez sur `Ctrl+O`, puis `Enter` pour sauvegarder, et `Ctrl+X` pour quitter), rechargez votre configuration `zsh` pour que les changements prennent effet. Vous pouvez le faire en exécutant :
     ```
     source ~/.zshrc
     ```
     ou simplement en fermant et en rouvrant votre terminal.

5. **Rendez votre script exécutable et déplacez-le (ou créez un lien) dans `~/bin` :**
   - Assurez-vous que votre script est exécutable :
     ```
     chmod +x /chemin/vers/mon_script.py
     ```
   - Déplacez ou créez un lien symbolique de votre script dans `~/bin` :
     ```
     ln -s /chemin/vers/mon_script.py ~/bin/mon_script
     ```
     ou
     ```
     mv /chemin/vers/mon_script.py ~/bin/
     ```

Après avoir suivi ces étapes, vous devriez pouvoir exécuter votre script Python en tapant `mon_script` (ou le nom que vous avez choisi pour le lien symbolique) directement dans votre terminal `zsh`.

# exemple de script python a lier dans le $PATH
## hello_world.py
```python
#!/usr/bin/env python3
print("Hello, world!")
```
```bash
chmod +x /chemin/vers/mon_script.py
ln -s /chemin/vers/mon_script.py ~/bin/mon_script
```
```bash
mon_script
```
## traiter_fichier.py
```python
#!/usr/bin/env python3

import sys
from pathlib import Path

def is_file(_path) -> bool:
    return Path(_path).is_file()

def traiter_fichier(chemin_fichier):
    # Ici, vous mettriez votre logique de traitement du fichier
    print(f"Traitement du fichier: {chemin_fichier}")
    
    # Créer un objet Path
    p = Path(chemin_fichier)

    # Obtenir le dossier parent
    dossier_parent = p.parent

    # Obtenir le nom du fichier
    nom_fichier = p.name
    
    # Obtenir le nom du fichier sans extension
    nom_fichier_se = p.stem

    # Obtenir l'extension du fichier
    extension = p.suffix

    # Afficher les informations
    print(f"Dossier parent: {dossier_parent}")
    print(f"Nom du fichier: {nom_fichier}")
    print(f"Nom du fichier sans extension: {nom_fichier_se}")
    print(f"Extension: {extension}")
    print(f"isfile: {is_file(chemin_fichier)}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python traiter_fichier.py <chemin_fichier>")
        sys.exit(1)

    chemin_fichier = sys.argv[1]
    traiter_fichier(chemin_fichier)
```
```bash
chmod +x /chemin/vers/traiter_fichier.py
ln -s /chemin/vers/mon_script.py ~/bin/traiter_fichier
```
```bash
traiter_fichier /chemin/vers/mon_fichier.txt
```

