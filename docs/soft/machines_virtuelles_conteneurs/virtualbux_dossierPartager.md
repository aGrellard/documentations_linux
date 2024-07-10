# dossier partager avec virtualbox

1. **Installer les Additions Invité de VirtualBox dans la VM** :
   - Démarrez votre VM.
   - Une fois la VM démarrée, cliquez sur "Périphériques" dans la barre de menu de la fenêtre de la VM.
   - Sélectionnez "Insérer l'image CD des Additions Invité...". Cela monte le CD virtuel des Additions Invité dans votre VM.
   - Dans la VM, exécutez le programme d'installation des Additions Invité. La procédure varie selon le système d'exploitation de la VM. Sur un système Windows, cela devrait se lancer automatiquement. Sur Linux, vous devrez peut-être ouvrir un terminal, naviguer jusqu'au CD monté, et exécuter un script d'installation (par exemple, `sudo ./VBoxLinuxAdditions.run` pour un système Linux).

    Si vous êtes en mode console :
    
    1. **Insérer l'image CD des Additions Invité** :
        - Assurez-vous que l'image CD des Additions Invité est insérée virtuellement dans votre VM comme expliqué précédemment.

    2. **Ouvrir un terminal dans la VM** :
        - Si vous êtes déjà en mode console, vous êtes prêt à passer à l'étape suivante.

    3. **Créer un point de montage pour le CD** (si nécessaire) :

        - Vous pouvez créer un dossier pour monter le CD s'il n'existe pas déjà. Par exemple, vous pouvez créer un dossier appelé `/mnt/cdrom` en exécutant :
            ```bash
            sudo mkdir /mnt/cdrom
            ```

    4. **Monter le CD** :
        - Vous devez monter le CD vers le point de montage que vous avez créé. Vous pouvez le faire avec la commande suivante :
            ```bash
            sudo mount /dev/cdrom /mnt/cdrom
            ```
        - Si `/dev/cdrom` ne fonctionne pas, cela peut être dû à une différence dans le nom du périphérique. Essayez `/dev/sr0` ou vérifiez vos périphériques disponibles avec `ls /dev` pour identifier votre lecteur de CD virtuel.

    5. **Accéder au contenu du CD et installer les Additions Invité** :
        - Changez de répertoire pour accéder au contenu du CD :
            ```bash
            cd /mnt/cdrom
            ```
        - Assurez-vous que le script d'installation est exécutable :
            ```bash
            sudo chmod +x VBoxLinuxAdditions.run
            ```
        - Exécutez le script d'installation des Additions Invité :
            ```bash
            sudo ./VBoxLinuxAdditions.run
            ```


2. **Configurer le partage de dossier** :
   - Avec la VM éteinte (pas en pause ou en sauvegarde d'état), ouvrez les "Paramètres" de la VM dans le gestionnaire VirtualBox.
   - Allez dans l'onglet "Dossiers partagés".
   - Cliquez sur l'icône avec le signe plus sur le côté droit pour ajouter un nouveau dossier partagé.
   - Dans la fenêtre qui s'ouvre, cliquez sur "Dossier Chemin" et choisissez le dossier de votre système hôte que vous souhaitez partager avec la VM.
   - Entrez un "Nom" pour le dossier partagé; ce sera le nom sous lequel le dossier apparaîtra dans votre VM.
   - Vous avez également l'option de cocher "Montage Automatique" et "Rendre Permanent" si vous souhaitez que le dossier soit automatiquement monté et disponible à chaque démarrage de la VM.
   - Validez en cliquant sur "OK".

3. **Accéder au dossier partagé depuis la VM** :
   - Démarrez votre VM.
   - Si vous avez choisi l'option "Montage Automatique", le dossier partagé devrait apparaître automatiquement quelque part dans le système de fichiers de la VM, souvent sous `/media/sf_<NomDuDossierPartagé>` pour les VMs Linux.
   - Si le dossier n'est pas monté automatiquement, vous devrez peut-être le monter manuellement. Sur Linux, vous pouvez le faire avec une commande comme `sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) <NomDuDossierPartagé> <PointDeMontage>`, où `<NomDuDossierPartagé>` est le nom que vous avez donné au dossier partagé et `<PointDeMontage>` est le répertoire où vous souhaitez accéder au dossier partagé.

