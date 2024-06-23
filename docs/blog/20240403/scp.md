# scp

scp : secure copy

## Déscription de scp :

`scp` est une commande utilisée pour transférer des fichiers entre des hôtes sur un réseau sécurisé. Il utilise le protocole SSH (Secure Shell) pour assurer la confidentialité et l'intégrité des données pendant le transfert. `scp` est similaire à la commande `cp` mais fonctionne sur un réseau distant.

## Prérequis :

- Deux hôtes avec SSH installé et configuré.
- Deux hôtes avec SCP installé.
- Accès aux hôtes via SSH.
- Les autorisations nécessaires pour lire et écrire les fichiers que vous souhaitez transférer.
- Les deux hôtes doivent être accessibles via le réseau.
- Les noms d'utilisateur et les mots de passe des hôtes.
- Les chemins des fichiers que vous souhaitez transférer.
- Les autorisations nécessaires pour écrire dans le répertoire de destination.

## Installer SSH

```bash
sudo apt-get install openssh-server
```

Vérifier le statut du service SSH

```bash
sudo systemctl status ssh
```

## Installer SCP

```bash
sudo apt-get install scp
```

## Utilisation de scp :

### Transférer un fichier d'un hôte à un autre :

```bash
scp /chemin/du/fichier utilisateur@hôte:/chemin/destination
```

- `/chemin/du/fichier` : le chemin du fichier que vous souhaitez transférer.
- `utilisateur` : le nom d'utilisateur de l'hôte de destination.
- `hôte` : l'adresse IP ou le nom d'hôte de l'hôte de destination.
- `/chemin/destination` : le chemin du répertoire de destination sur l'hôte de destination.
- Vous serez invité à saisir le mot de passe de l'utilisateur de l'hôte de destination.
- Le fichier sera transféré vers le répertoire de destination sur l'hôte de destination.

>Si vous souhaitez transférer un fichier de l'hôte de destination vers l'hôte source, vous pouvez inverser les chemins du fichier source et destination :

```bash
scp utilisateur@hôte:/chemin/du/fichier /chemin/destination
```

