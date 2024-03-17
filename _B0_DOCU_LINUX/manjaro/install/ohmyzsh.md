# ZSH (using Oh My ZSH) on Manjaro Linux

#### 0. If `ZSH` is not already installed on your Manjaro system you can do it with the command:

```
sudo pacman -Syu zsh
```

You do not need to install `manjaro-zsh-config` and all the other related packages like `zsh-syntax-highlighting`, `zsh-history-substring-search`, `zsh-autosuggestions`, etc., as we will use Oh My Zsh.

#### 1. Install [Oh My ZSH](https://ohmyz.sh/)

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

or

```
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

#### 2. Installation of two important plugins I can't live without

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
and
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### 3. Configuring zsh

Modify the `~/.zshrc` config file editting plugins section like this:
```
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```

Change the theme to agnoster:
```
ZSH_THEME="agnoster"
```

#### 4. Logout/logon or apply the changes with:
```
source ~/.zshrc
```

#### 5. Make zsh default if you haven't already:
```
chsh -s $(which zsh)
```

#### 6. Enjoy!