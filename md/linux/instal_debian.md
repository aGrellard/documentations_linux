# apress l'installation

## ajouter le groupe sudo a l'utilisateur


### 1. Se connecter en tant que root

Si vous n'avez pas accès à `sudo`, vous devrez vous connecter directement en tant que l'utilisateur root. Si vous êtes déjà connecté avec un utilisateur non-root, vous pouvez essayer de passer à l'utilisateur root en utilisant :

```bash
su -
```

### 2. Installer sudo

Une fois connecté en tant que root, exécutez la commande suivante pour installer `sudo` :

```bash
apt update && apt install sudo -y
```

Cette commande met à jour la liste des paquets puis installe le paquet `sudo`.

### 3. Ajouter l'utilisateur au groupe sudo

Après avoir installé `sudo`, assurez-vous que votre utilisateur non-root est ajouté au groupe `sudo` avec la commande suivante (remplacez `nom_utilisateur` par le nom de votre utilisateur) :

```bash
adduser nom_utilisateur sudo
```

Ou, vous pouvez utiliser cette commande :

```bash
usermod -aG sudo nom_utilisateur
```

### 4. Se déconnecter et se reconnecter

Pour que les changements prennent effet, vous devez vous déconnecter puis vous reconnecter avec votre compte utilisateur.

- Si vous êtes en session SSH, tapez `exit` ou appuyez sur `Ctrl+D`, puis reconnectez-vous.
- Si vous êtes en accès physique ou via une console KVM, déconnectez-vous de la session root et reconnectez-vous avec votre utilisateur.

### 5. Tester sudo

Pour tester si `sudo` fonctionne correctement avec votre utilisateur, vous pouvez exécuter une commande simple comme :

```bash
sudo echo "sudo fonctionne!"
```

### mettre a jour le systeme 
sudo apt-get update && sudo apt-get upgrade -y

### installer des utilitaires
```bash
apt install git curl wget unzip
```
### installer zsh
```sh
sudo apt install zsh
```
```sh
chsh -s $(which zsh)
```

#### zshrc
```sh
export ZSH="$HOME/.oh-my-zsh"
bira
zsh-autosuggestions zsh-syntax-highlighting
copy_find_a() {
    echo "find -type d \( -iname 'md' \) -o  \( -iname \"*cmd*\" \) -exec find {} -type f -iname \"*.md\" \;" | xclip -selection clipboard
}
alias clip="xclip -selection clipboard"
alias find_1='copy_find_a'

export HSTR_CONFIG=hicolor         
setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=100000
export SAVEHIST=100000
setopt SHARE_HISTORY

export PATH="$HOME/bin:$PATH"
```
### installer oh-my-zsh
```sh
sudo apt install curl
```
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```sh
sh -c "$(wget -O- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```