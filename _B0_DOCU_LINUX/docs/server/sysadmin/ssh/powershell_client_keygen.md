- [Générer une paire de clés SSH et la copier sur un serveur Debian](#générer-une-paire-de-clés-ssh-et-la-copier-sur-un-serveur-debian)
  - [Étape 1 : Générer une paire de clés SSH](#étape-1--générer-une-paire-de-clés-ssh)
  - [Étape 2 : Copier la clé publique sur le serveur Debian](#étape-2--copier-la-clé-publique-sur-le-serveur-debian)
  - [Étape 3 : Se connecter au serveur Debian avec la clé SSH](#étape-3--se-connecter-au-serveur-debian-avec-la-clé-ssh)
  - [Conclusion](#conclusion)
- [Activer l'Agent SSH sous Windows](#activer-lagent-ssh-sous-windows)
  - [Activer l'Agent SSH via les Paramètres Windows](#activer-lagent-ssh-via-les-paramètres-windows)
  - [Activer l'Agent SSH via PowerShell](#activer-lagent-ssh-via-powershell)
  - [conclusion](#conclusion-1)


Pour générer une clé SSH sous Windows 10 avec PowerShell et l'envoyer au serveur Debian, vous pouvez suivre ces étapes détaillées. Ce processus implique l'utilisation du client SSH intégré à Windows 10, qui devrait être disponible par défaut sur les versions récentes de Windows.

## Générer une paire de clés SSH et la copier sur un serveur Debian

### Étape 1 : Générer une paire de clés SSH

1. **Ouvrez PowerShell**. Vous pouvez le faire en recherchant "PowerShell" dans le menu de démarrage et en sélectionnant l'application.

2. **Générez la paire de clés SSH** en exécutant la commande suivante dans PowerShell :
   ```powershell
   ssh-keygen -t rsa -b 4096
   ```
   - Vous serez invité à spécifier l'emplacement où sauvegarder la nouvelle clé. Vous pouvez appuyer sur `Entrée` pour accepter l'emplacement par défaut (`C:\Users\YourUsername\.ssh\id_rsa`).
   - Vous aurez ensuite la possibilité d'entrer une passphrase pour sécuriser l'utilisation de votre clé privée. Ceci est optionnel mais recommandé pour une sécurité accrue.

### Étape 2 : Copier la clé publique sur le serveur Debian

Une fois que vous avez généré votre paire de clés, la prochaine étape consiste à copier votre clé publique sur le serveur Debian dans le fichier `~/.ssh/authorized_keys` de l'utilisateur avec lequel vous souhaitez vous connecter. Sous Windows 10, sans `ssh-copy-id`, vous devrez procéder manuellement comme suit :

1. **Affichez votre clé publique** en exécutant :
   ```powershell
   Get-Content $env:USERPROFILE\.ssh\id_rsa.pub
   ```
   Cela affichera le contenu de votre clé publique dans la fenêtre PowerShell. Copiez ce contenu intégralement.

2. **Connectez-vous à votre serveur Debian** via SSH en utilisant un compte utilisateur qui a le droit d'écrire dans le dossier `~/.ssh` :
   ```powershell
   ssh utilisateur@adresse_du_serveur
   ```
   Remplacez `utilisateur` par votre nom d'utilisateur sur le serveur et `adresse_du_serveur` par l'adresse IP ou le nom de domaine du serveur Debian.

3. **Ajoutez la clé publique au fichier `authorized_keys`** sur le serveur :
   - Si le dossier `~/.ssh` n'existe pas déjà, créez-le avec la commande `mkdir -p ~/.ssh`.
   - Ouvrez le fichier `~/.ssh/authorized_keys` avec un éditeur de texte, par exemple :
     ```bash
     nano ~/.ssh/authorized_keys
     ```
   - Collez le contenu de votre clé publique à la fin du fichier. Si vous utilisez `nano`, faites cela en cliquant avec le bouton droit de la souris ou en utilisant les fonctions de collage de votre terminal.
   - Sauvegardez et fermez l'éditeur (pour `nano`, appuyez sur `Ctrl+O`, `Entrée` pour sauvegarder et `Ctrl+X` pour quitter).

4. **Assurez-vous que les permissions sont correctes** :
   - Le dossier `.ssh` doit avoir des permissions `700` :
     ```bash
     chmod 700 ~/.ssh
     ```
   - Le fichier `authorized_keys` doit avoir des permissions `600` :
     ```bash
     chmod 600 ~/.ssh/authorized_keys
     ```

### Étape 3 : Se connecter au serveur Debian avec la clé SSH

Après avoir ajouté votre clé publique au serveur, vous pouvez vous connecter à celui-ci sans mot de passe en utilisant votre clé privée :

```powershell
ssh utilisateur@adresse_du_serveur
```

### Conclusion

Si tout a été configuré correctement, vous devriez pouvoir vous connecter au serveur Debian sans être invité à entrer le mot de passe de l'utilisateur. Si vous avez défini une passphrase pour votre clé privée, vous devrez la saisir la première fois que vous utilisez la clé après le démarrage de votre système ou après avoir ajouté votre clé à un agent SSH.

## Activer l'Agent SSH sous Windows

### Activer l'Agent SSH via les Paramètres Windows

1. **Ouvrez les Paramètres Windows** : Vous pouvez y accéder en cliquant sur le bouton de démarrage puis en sélectionnant l'icône d'engrenage, ou en appuyant sur Win + I.

2. **Accédez à Applications** : Cliquez sur "Applications", puis sur "Applications et fonctionnalités".

3. **Paramètres avancés** : Cliquez sur "Fonctionnalités facultatives" sous les paramètres relatifs aux applications.

4. **Ajouter une fonctionnalité** : Cliquez sur "Ajouter une fonctionnalité" en haut de la page des fonctionnalités facultatives.

5. **Recherchez "OpenSSH Client"** (et "OpenSSH Server" si vous le souhaitez également) dans la liste et cliquez sur "Installer" à côté de ces options. L'agent SSH est inclus avec le client.

Une fois l'installation terminée, vous devriez pouvoir démarrer le service "Agent d'authentification OpenSSH" en suivant les étapes précédemment décrites.

### Activer l'Agent SSH via PowerShell

Si vous préférez, ou si les instructions ci-dessus ne correspondent pas exactement à votre version de Windows, vous pouvez également activer l'Agent SSH via PowerShell :

1. **Ouvrez PowerShell en tant qu'administrateur** : Cliquez droit sur le menu Démarrer, choisissez "Windows PowerShell (Admin)" ou "Invite de commandes (Admin)" si PowerShell n'est pas une option.

2. **Exécutez la commande suivante pour installer le client OpenSSH** (qui inclut l'agent) si ce n'est pas déjà fait :
   ```powershell
   Add-WindowsCapability -Online -Name OpenSSH.Client
   ```

3. **Pour démarrer l'Agent SSH, utilisez la commande suivante** :
   ```powershell
   Start-Service ssh-agent
   ```

4. **Pour s'assurer que l'agent SSH démarre automatiquement avec Windows, exécutez** :
   ```powershell
   Set-Service -Name ssh-agent -StartupType Automatic
   ```

### conclusion

Après avoir activé l'agent SSH et configuré votre système pour l'exécuter automatiquement, vous pouvez ajouter votre clé privée à l'agent avec la commande `ssh-add` comme décrit précédemment. Cela devrait résoudre le problème de devoir saisir la passphrase à chaque connexion SSH.


