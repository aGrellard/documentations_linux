# sauvegarde avec rsync

sauvegarde du répertoire `/media/usb_1T/Data/Logiciels` ver `/media/usb_3T/Partage/logiciels/adri/`

```bash
rsync -avh --progress /source/dossier/ /destination/dossier/
```

- `-a` : Mode archivage, copie les fichiers et répertoires récursivement, préserve les permissions, les propriétaires et les dates de modification.
- `-v` : Mode verbeux, affiche les fichiers copiés.
- `-h` : Mode humain, affiche les tailles de fichiers dans un format lisible.
- `--progress` : Affiche la progression de la copie.
- `/source/dossier/` : Chemin du répertoire source à copier.
- `/destination/dossier/` : Chemin du répertoire de destination.
- Pour copier un répertoire local vers un répertoire distant, utilisez la syntaxe suivante :
    ```bash
    rsync -avh --progress /source/dossier/ utilisateur@serveur:/destination/dossier/
    ```

Vérification après la copie :

```bash
diff -rq /source/dossier/ /destination/dossier/
```

- `-r` : Mode récursif, compare les fichiers et répertoires récursivement.
- `-q` : Mode silencieux, n'affiche que les différences.
- `/source/dossier/` : Chemin du répertoire source.
- `/destination/dossier/` : Chemin du répertoire de destination.
- Pour comparer un répertoire local avec un répertoire distant, utilisez la syntaxe suivante :
    ```bash
    diff -rq /source/dossier/ utilisateur@serveur:/destination/dossier/
    ```

