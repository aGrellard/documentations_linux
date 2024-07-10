Pour établir une connexion SSH sécurisée via clé de chiffrement entre un client sous Debian 12 et un serveur (également sous Debian ou un autre système UNIX/Linux), en utilisant un client Debian 12, suivez ces étapes :

- [Générer une paire de clés SSH sur le client Debian 12 et la copier sur le serveur](#générer-une-paire-de-clés-ssh-sur-le-client-debian-12-et-la-copier-sur-le-serveur)
  - [1. Générer une paire de clés SSH sur le client Debian 12](#1-générer-une-paire-de-clés-ssh-sur-le-client-debian-12)
  - [2. Copier la clé publique sur le serveur](#2-copier-la-clé-publique-sur-le-serveur)
  - [3. Tester la connexion SSH](#3-tester-la-connexion-ssh)
- [Utiliser un agent SSH (optionnel)](#utiliser-un-agent-ssh-optionnel)
  - [1. Démarrer l'Agent SSH](#1-démarrer-lagent-ssh)
  - [2. Ajouter votre clé privée à l'agent SSH](#2-ajouter-votre-clé-privée-à-lagent-ssh)
  - [3. Connexion SSH sans entrer la passphrase](#3-connexion-ssh-sans-entrer-la-passphrase)
  - [Remarques :](#remarques-)


## Générer une paire de clés SSH sur le client Debian 12 et la copier sur le serveur

### 1. Générer une paire de clés SSH sur le client Debian 12

1. **Ouvrir un terminal** sur votre client Debian 12.
   
2. **Générer la paire de clés** en exécutant :
   ```sh
   ssh-keygen -t rsa -b 4096
   ```
   - Suivez les instructions, vous pouvez spécifier un mot de passe pour sécuriser l'utilisation de votre clé privée (recommandé).
   - Les clés seront enregistrées dans le répertoire `~/.ssh/` par défaut. La clé publique aura une extension `.pub` (par exemple, `id_rsa.pub`).

### 2. Copier la clé publique sur le serveur

1. **Utiliser ssh-copy-id pour copier la clé publique** sur le serveur. Remplacez `utilisateur` par votre nom d'utilisateur sur le serveur et `adresse_du_serveur` par son adresse IP ou son nom de domaine :
   ```sh
   ssh-copy-id utilisateur@adresse_du_serveur
   ```
   - Si `ssh-copy-id` n'est pas disponible ou si vous préférez une méthode manuelle, voir l'alternative ci-dessous.

2. **Méthode alternative (manuelle)** : Si `ssh-copy-id` ne fonctionne pas ou si vous préférez le faire manuellement, vous pouvez ajouter votre clé publique à la liste des clés autorisées sur le serveur en exécutant :
   ```sh
   cat ~/.ssh/id_rsa.pub | ssh utilisateur@adresse_du_serveur 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'
   ```
   - Cette commande lit votre clé publique, se connecte à votre serveur, crée le répertoire `.ssh` si nécessaire, et ajoute votre clé publique au fichier `authorized_keys`.

### 3. Tester la connexion SSH

- **Connectez-vous** à votre serveur sans mot de passe :
  ```sh
  ssh utilisateur@adresse_du_serveur
  ```
- Si tout est correctement configuré, vous devriez être capable de vous connecter sans avoir à entrer le mot de passe de l'utilisateur. L'authentification se fera grâce à la clé privée présente sur votre client Debian.

## Utiliser un agent SSH (optionnel)

Pour éviter de devoir entrer votre mot de passe à chaque connexion, vous pouvez utiliser un agent SSH pour gérer vos clés. Voici comment configurer et utiliser un agent SSH sur votre client Debian 12 :

### 1. Démarrer l'Agent SSH

Ouvrez un terminal et exécutez la commande suivante pour démarrer l'agent SSH si ce n'est pas déjà fait :

```sh
eval "$(ssh-agent -s)"
```

Cette commande devrait afficher le PID (identifiant de processus) de l'agent, indiquant qu'il est en cours d'exécution.

### 2. Ajouter votre clé privée à l'agent SSH

Avant d'ajouter votre clé privée à `ssh-agent`, vous devez vous assurer que les permissions de votre fichier de clé privée sont correctement définies pour qu'elle soit sécurisée. Les permissions recommandées pour le fichier de clé privée sont `600`, ce qui signifie que seul l'utilisateur propriétaire peut lire et écrire ce fichier, et personne d'autre ne peut le lire, écrire ou exécuter.

Exécutez cette commande pour corriger les permissions de votre clé privée :

```sh
chmod 600 /home/adrien/.ssh/id_rsa
```

Utilisez ensuite la commande `ssh-add` pour ajouter votre clé privée à l'agent SSH. Si vous avez utilisé l'emplacement par défaut pour sauvegarder votre clé lors de sa création, exécutez simplement :

```sh
ssh-add
```

Si vous avez défini un emplacement personnalisé pour votre clé privée, vous devez spécifier le chemin de la clé :

```sh
ssh-add /chemin/vers/votre/cle
```

Vous serez invité à entrer la passphrase de votre clé privée. Après l'avoir saisie, l'agent SSH mémorisera la clé privée déverrouillée.

### 3. Connexion SSH sans entrer la passphrase

Maintenant, lorsque vous vous connectez à un serveur via SSH, l'agent SSH fournira la clé privée déverrouillée, et vous ne devriez pas avoir à entrer la passphrase à nouveau pour toutes les connexions ultérieures durant la session de l'agent.

### Remarques :

- **Sécurité** : Bien que l'utilisation d'un agent SSH soit pratique, gardez à l'esprit que toute personne ayant accès à votre session système pourrait potentiellement utiliser les clés privées mémorisées par l'agent SSH pour se connecter aux serveurs. Assurez-vous donc de sécuriser votre session système.
- **Sessions et redémarrages** : Si vous redémarrez votre système ou fermez votre session, vous devrez relancer `ssh-agent` et utiliser `ssh-add` à nouveau pour ajouter les clés privées à l'agent SSH.
- **Automatisation** : Pour éviter de devoir démarrer manuellement `ssh-agent` et ajouter vos clés à chaque session, vous pouvez ajouter les commandes correspondantes à votre fichier de démarrage de shell, comme `.bashrc` ou `.profile`, selon votre environnement de shell.