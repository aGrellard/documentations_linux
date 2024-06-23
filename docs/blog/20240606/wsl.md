Pour vérifier si WSL 2 est installé sur Windows 10 et si une distribution Linux est installée, suivez ces étapes :

### Vérification de l'installation de WSL 2

1. **Ouvrir PowerShell en tant qu'administrateur :**
   - Appuyez sur `Windows + X`, puis sélectionnez **Windows PowerShell (Admin)**.

2. **Vérifier la version de WSL :**
   - Tapez la commande suivante et appuyez sur `Entrée` :
     ```powershell
     wsl -l -v
     ```
   - Cette commande affiche une liste des distributions Linux installées et indique la version de WSL utilisée. Si WSL 2 est installé, vous verrez une ligne indiquant "Version 2".

3. **Si WSL 2 n'est pas installé :**
   - Vous pouvez l'installer en exécutant les commandes suivantes dans PowerShell (en tant qu'administrateur) :

     ```powershell
     # Activer le sous-système Windows pour Linux
     dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

     # Activer la machine virtuelle
     dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

     # Télécharger et installer le package de mise à jour du noyau WSL 2
     wsl --update

     # Définir WSL 2 comme version par défaut
     wsl --set-default-version 2
     ```

### Vérification de l'installation d'une distribution Linux

1. **Liste des distributions installées :**
   - Toujours dans PowerShell, tapez :
     ```powershell
     wsl -l -v
     ```
   - La commande affiche une liste des distributions Linux installées. Par exemple, vous pourriez voir `Ubuntu`, `Debian`, etc., avec des informations sur la version de WSL utilisée pour chaque distribution.

2. **Installer une distribution Linux si aucune n'est installée :**
   - Ouvrez le **Microsoft Store** et recherchez une distribution Linux (comme Ubuntu, Debian, etc.).
   - Cliquez sur **Installer** pour ajouter la distribution à votre système.
   - Une fois installée, lancez la distribution pour terminer la configuration initiale.

### Exemple de sortie de commande

Supposons que vous ayez exécuté la commande `wsl -l -v`, vous pourriez obtenir une sortie similaire à celle-ci :

```plaintext
  NAME      STATE           VERSION
* Ubuntu    Running         2
  Debian    Stopped         2
```

### Autres commandes utiles

- **Vérifier la version de WSL par défaut :**
  ```powershell
  wsl --set-default-version
  ```
  Cette commande vous indiquera la version par défaut de WSL utilisée lorsque vous installez une nouvelle distribution.

- **Définir WSL 2 comme version par défaut :**
  ```powershell
  wsl --set-default-version 2
  ```
  Cela configurera WSL 2 comme la version par défaut pour toutes les futures installations de distributions Linux.

En utilisant ces commandes, vous pouvez facilement vérifier et gérer la version de WSL sur votre système Windows 10.