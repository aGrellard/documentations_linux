Pour installer une distribution Linux pour WSL 2 sur Windows 10, suivez ces étapes :

### Prérequis
1. **Activer WSL et la plateforme de machine virtuelle :**
   - Ouvrez PowerShell en tant qu'administrateur et exécutez les commandes suivantes :
     ```powershell
     dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
     dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
     ```

2. **Redémarrer votre ordinateur :**
   - Après avoir activé ces fonctionnalités, redémarrez votre système.

3. **Installer la mise à jour du noyau WSL 2 :**
   - Téléchargez et installez le package de mise à jour du noyau WSL 2 depuis le site officiel de Microsoft : [WSL 2 Kernel Update](https://aka.ms/wsl2kernel).

4. **Définir WSL 2 comme version par défaut :**
   - Après le redémarrage, ouvrez PowerShell (pas besoin d'être en tant qu'administrateur cette fois) et exécutez la commande suivante :
     ```powershell
     wsl --set-default-version 2
     ```

### Installer une distribution Linux

1. **Ouvrir Microsoft Store :**
   - Ouvrez le Microsoft Store depuis le menu Démarrer.

2. **Rechercher une distribution Linux :**
   - Dans le champ de recherche, tapez le nom de la distribution que vous souhaitez installer, comme `Ubuntu`, `Debian`, `Kali Linux`, etc.

3. **Installer la distribution :**
   - Sélectionnez la distribution souhaitée, puis cliquez sur **Obtenir** ou **Installer**.

4. **Lancer la distribution :**
   - Une fois l'installation terminée, cliquez sur **Lancer** ou ouvrez la distribution depuis le menu Démarrer.
   - La distribution se lancera et vous demandera de créer un nom d'utilisateur et un mot de passe pour la configuration initiale.

### Exemple : Installation d'Ubuntu

1. **Ouvrir Microsoft Store :**
   - Ouvrez le Microsoft Store depuis le menu Démarrer.

2. **Rechercher `Ubuntu` :**
   - Dans la barre de recherche, tapez `Ubuntu`.

3. **Sélectionner et installer `Ubuntu` :**
   - Sélectionnez `Ubuntu` dans les résultats de recherche.
   - Cliquez sur **Obtenir** ou **Installer**.

4. **Lancer `Ubuntu` :**
   - Après l'installation, cliquez sur **Lancer** ou trouvez `Ubuntu` dans le menu Démarrer et ouvrez-le.
   - La première fois que vous lancez `Ubuntu`, une fenêtre de terminal s'ouvrira pour terminer la configuration. Vous serez invité à créer un nom d'utilisateur et un mot de passe pour l'environnement Linux.

### Vérification de l'installation

1. **Ouvrir PowerShell :**
   - Ouvrez PowerShell et exécutez la commande suivante pour vérifier que la distribution est installée et utilise WSL 2 :
     ```powershell
     wsl -l -v
     ```

2. **Vérifier la sortie :**
   - Vous devriez voir une sortie listant votre distribution et indiquant qu'elle utilise la version 2 de WSL, par exemple :
     ```plaintext
       NAME      STATE           VERSION
     * Ubuntu    Running         2
     ```

En suivant ces étapes, vous devriez être en mesure d'installer et de configurer une distribution Linux pour WSL 2 sur votre système Windows 10.