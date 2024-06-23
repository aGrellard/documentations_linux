Pour installer les pilotes NVIDIA sous Debian 12 (Bookworm) à partir du fichier `.run` téléchargé depuis le site officiel de NVIDIA, voici une série d'étapes à suivre. Cependant, il est bon de noter que cette méthode est généralement moins recommandée que l'utilisation des pilotes disponibles dans les dépôts de Debian, principalement pour des raisons de facilité de mise à jour et de compatibilité avec le reste du système. Si vous choisissez toujours d'installer le pilote directement depuis NVIDIA, assurez-vous que votre système est à jour et sauvegardez vos données importantes avant de commencer.

### Prérequis

1. **Installez les outils de compilation et les headers du noyau :** Ces outils sont nécessaires pour compiler le pilote sur votre système.

```bash
sudo apt update
sudo apt install build-essential linux-headers-$(uname -r)
```

2. **Désactivez le serveur X (interface graphique) :** Pour installer le pilote, vous devez arrêter votre session graphique, car le programme d'installation ne peut pas être exécuté dans un environnement graphique.

```bash
sudo systemctl isolate multi-user.target
```

### Installation du pilote

1. **Rendez-vous dans le répertoire où se trouve le fichier `.run` :** Utilisez la commande `cd` pour vous déplacer dans le répertoire où vous avez téléchargé le fichier.

```bash
cd /chemin/vers/le/dossier
```

2. **Rendez le fichier exécutable :** Avant de pouvoir exécuter le script, vous devez lui donner les permissions d'exécution.

```bash
chmod +x NVIDIA-Linux-x86_64-545.29.02.run
```

3. **Exécutez le script d'installation :** Lancez le processus d'installation en exécutant le fichier `.run`.

```bash
sudo ./NVIDIA-Linux-x86_64-545.29.02.run
```

Suivez les instructions à l'écran pour terminer l'installation. Le script vous proposera de refuser l'installation du serveur X NVIDIA nouveau, de configurer automatiquement votre fichier de configuration Xorg, et d'autres options. Il est généralement sûr d'accepter les paramètres par défaut, sauf si vous avez des besoins spécifiques.

### Après l'installation

- **Redémarrez votre interface graphique ou votre système :** Après l'installation, vous devrez redémarrer votre interface graphique ou votre ordinateur pour que les changements prennent effet.

Pour redémarrer l'interface graphique :
```bash
sudo systemctl start graphical.target
```

Ou, redémarrez simplement votre système :
```bash
sudo reboot
```

- **Vérifiez l'installation :** Une fois le système redémarré, vous pouvez vérifier que le pilote NVIDIA est correctement installé et en cours d'utilisation en exécutant :

```bash
nvidia-smi
```

Cette commande affiche des informations sur le pilote NVIDIA et les cartes graphiques installées.

N'oubliez pas que l'utilisation de pilotes directement du site NVIDIA peut nécessiter une réinstallation manuelle à chaque mise à jour du noyau Linux, contrairement aux pilotes disponibles via les dépôts Debian qui sont automatiquement gérés par le système de gestion des paquets.