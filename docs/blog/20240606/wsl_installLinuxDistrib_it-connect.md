```markdown
## II. Prérequis et activation WSL

Vous devez exécuter à minima **Windows 10 version 2004 (build 19041 ou ultérieure) ou Windows 10 v1903/v1909 en 64 bits (compatibilité ajoutée en août 2020)**. Pour le vérifier, vous pouvez exécuter la commande "*winver*" dans la barre de recherche Windows 10 et appuyer sur "Entrée". Une fenêtre va s'ouvrir.

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-00.png)

Ensuite, nous allons devoir activer deux fonctionnalités :

- **Virtual Machine Platform**
- **Microsoft Windows Subsystem Linux**

La **Virtual Machine Platform doit être activée pour WSL 2**, pour WSL 1 ce n'était pas utile puisque le système ne s'appuyait pas sur de la virtualisation. Il est à noter que si le rôle Hyper-V ou Windows Sandbox est déjà opérationnel sur votre PC, il n'est pas nécessaire d'installer ce composant (il l'est déjà).

**Pour activer Virtual Machine Platform :**

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```

**Pour activer Windows Subsystem for Linux :**

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Il est à noter que sur Windows Server, l'activation de WSL passe par cette commande :

```powershell
Install-WindowsFeature -Name Microsoft-Windows-Subsystem-Linux
```

Suite à l'exécution de ces deux commandes s'effectue sans problème, redémarrez le PC.

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-01.png)

Dès lors que le PC est redémarré, vous pouvez passer à la suite...

## III. Définir WSL 2 par défaut

WSL 2 est comme une surcouche de WSL 1 sur lequel il s'appuie, ce qui laisse la possibilité d'utiliser soit WSL 1 ou WSL 2. Pour définir WSL 2 par défaut sur votre machine, il va falloir exécuter cette commande :

```powershell
wsl.exe --set-default-version 2
```

Si vous avez le message "**WSL 2 nécessite une mise à jour de son composant noyau**" qui s'affiche, il est nécessaire de télécharger le paquet de mise à jour du kernel Linux et de l'installer sur votre PC (voir ci-dessous). Une fois que c'est fait, ré-exécutez la commande ci-dessus.

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-03.png)

Le téléchargement de la mise à jour du kernel s'effectue sur cette page : [WSL 2 Kernel](https://docs.microsoft.com/fr-fr/windows/wsl/wsl2-kernel?WT.mc_id=AZ-MVP-5004580) - L'installation s'effectue en quelques clics.

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-02.png)

## IV. Télécharger une distribution Linux

Pour **télécharger et déployer une distribution Linux sur sa machine Windows 10**, il y a deux possibilités :

- À partir du Microsoft Store
- À partir d'un package APPX téléchargé directement sur le site Microsoft

La page suivante recense les distributions disponibles et donne accès au téléchargement des packages APPX associés : [Linux - APPX](https://docs.microsoft.com/en-us/windows/wsl/install-manual?WT.mc_id=AZ-MVP-5004580)

Pour le téléchargement, soit vous passez par votre navigateur, soit directement en PowerShell via une commande de ce type (URL à adapter en fonction de la distribution que vous souhaitez récupérer) :

```powershell
Invoke-WebRequest -Uri https://aka.ms/wsl-debian-gnulinux -OutFile Debian.appx -UseBasicParsing
```

Lorsque vous avez obtenu le package APPX, il faudra le déployer sur votre PC. Pour cela, nous allons utiliser le cmdlet `Add-AppPackage` suivi du nom du fichier .appx. Exemple :

```powershell
Add-AppPackage Debian.appx
```

Il suffit de patienter pendant l'installation...

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-04.png)

Sachez que l'installation, tout comme le téléchargement, peut être effectué via l'interface graphique. Il suffit de faire un clic droit et de cliquer sur "Installer" lorsque le paquet APPX est téléchargé.

Lorsque l'installation est terminée, **la distribution Linux doit être accessible dans le menu Démarrer** de votre PC Windows 10 :

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-05.png)

Sinon, pour réaliser une installation à partir du Microsoft Store, si vous recherchez "Linux" ou "WSL", vous allez pouvoir afficher la liste des distributions Linux disponibles pour Windows 10.

![Windows 10 WSL 2](https://www.it-connect.fr/wp-content-itc/uploads/2020/06/windows-10-wsl-2-06.jpg)

Il ne reste plus qu'à rechercher l'application dans le menu Démarrer de Windows 10 et à réaliser le premier démarrage de votre environnement Unix basé sur WSL 2.

La documentation officielle Microsoft recense quelques codes d'erreurs, si vous avez besoin : [WSL 2 Microsoft](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10?WT.mc_id=AZ-MVP-5004580)

Voici pour le premier épisode ! Il vous reste d'autres épisodes à découvrir pour maîtriser pleinement WSL. Pour cela rendez-vous sur ce [lien](https://www.it-connect.fr/cours-tutoriels/administration-systemes/windows-client/tutos-wsl/) 