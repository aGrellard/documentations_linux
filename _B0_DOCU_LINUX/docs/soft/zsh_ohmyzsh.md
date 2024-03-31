- [Étape 1: Installation de Zsh](#étape-1-installation-de-zsh)
- [Étape 2: Configurer Zsh comme shell par défaut](#étape-2-configurer-zsh-comme-shell-par-défaut)
- [Étape 3: Configuration initiale de Zsh](#étape-3-configuration-initiale-de-zsh)
- [Étape 4: Installation d'Oh My Zsh (Optionnel)](#étape-4-installation-doh-my-zsh-optionnel)
- [Étape 5: Personnalisation de Zsh](#étape-5-personnalisation-de-zsh)
- [Étape 6: plugins](#étape-6-plugins)
  - [download syntax highlighting extension](#download-syntax-highlighting-extension)
  - [download Auto-completion extension](#download-auto-completion-extension)


L'installation et la configuration de Zsh (Z Shell) sous Debian sont relativement simples et peuvent rendre votre expérience en ligne de commande plus agréable grâce à des fonctionnalités comme l'autocomplétion améliorée, les thèmes, et bien plus encore. Voici un guide étape par étape pour installer et configurer Zsh sur Debian.

### Étape 1: Installation de Zsh

1. **Ouvrir le terminal**: La première étape consiste à ouvrir votre terminal.

2. **Mise à jour de la liste des paquets**: Avant d'installer de nouveaux paquets, il est recommandé de mettre à jour la liste des paquets disponibles pour s'assurer que vous installez les dernières versions. Exécutez la commande suivante:

   ```sh
   sudo apt update
   ```

3. **Installation de Zsh**: Une fois la liste des paquets mise à jour, installez Zsh en exécutant la commande suivante:

   ```sh
   sudo apt install zsh
   ```

4. **Vérification de l'installation**: Après l'installation, vous pouvez vérifier la version de Zsh installée pour confirmer que tout s'est bien passé:

   ```sh
   zsh --version
   ```

5. **Une fois que vous avez modifier le fichier .zshrc**, vous pouvez soit relancer le terminal, soit rentrer la commande:

    ```sh
    .zshrc
    ```

### Étape 2: Configurer Zsh comme shell par défaut

1. **Changer le shell par défaut**: Pour utiliser Zsh comme votre shell par défaut, utilisez la commande `chsh` (change shell). Vous devrez entrer votre mot de passe.

   ```sh
   chsh -s $(which zsh)
   ```

2. **Déconnexion et reconnexion**: Pour que le changement prenne effet, vous devrez vous déconnecter et vous reconnecter à votre session utilisateur. Alternativement, vous pouvez redémarrer votre terminal.

### Étape 3: Configuration initiale de Zsh

1. **Premier lancement de Zsh**: Lorsque vous lancez Zsh pour la première fois, vous serez accueilli par un assistant de configuration (`zsh-newuser-install`). Vous pouvez choisir de suivre l'assistant pour configurer les paramètres de base ou appuyer sur `q` pour quitter et configurer Zsh manuellement.

### Étape 4: Installation d'Oh My Zsh (Optionnel)

Oh My Zsh est un framework open-source pour gérer votre configuration Zsh. Il vient avec un grand nombre de thèmes et de plugins pour améliorer votre expérience en ligne de commande.

1. **Installer curl ou wget**: Assurez-vous que `curl` ou `wget` est installé pour télécharger le script d'installation.

   ```sh
   sudo apt install curl
   ```

2. **Installation d'Oh My Zsh**: Exécutez la commande suivante pour installer Oh My Zsh:

   ```sh
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

   Alternativement, si vous préférez `wget`:

   ```sh
   sh -c "$(wget -O- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

### Étape 5: Personnalisation de Zsh

Après avoir installé Oh My Zsh, vous pouvez personnaliser votre shell en éditant le fichier de configuration `~/.zshrc`. Vous pouvez changer le thème, activer des plugins, et ajuster d'autres paramètres selon vos préférences.

```sh
nano ~/.zshrc
```

Par exemple, pour changer de thème, modifiez la ligne `ZSH_THEME="robbyrussell"` par un autre nom de thème disponible dans le répertoire des thèmes d'Oh My Zsh.

### Étape 6: plugins 

#### download syntax highlighting extension

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- Then activate the plugin by updating the .zshrc file.

```sh
# add syntax highlighting to the list of plugins in your ~/.zshrc file
plugins=(zsh-syntax-highlighting)
```

#### download Auto-completion extension

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- Then activate the plugin by updating the .zshrc file.

    ```shqq
    # update plugins in your ~/.zshrc file
    plugins=(
        zsh-syntax-highlighting 
        zsh-autosuggestions
    )
    ```
