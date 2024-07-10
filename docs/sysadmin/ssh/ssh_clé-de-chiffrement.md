SSH, acronyme de Secure Shell, est un protocole de communication sécurisé utilisé pour accéder à des serveurs et à des réseaux à distance. 

Une des méthodes les plus sûres et les plus communes pour établir une connexion SSH est l'utilisation de clés de chiffrement, qui permet une authentification forte sans nécessiter l'usage de mots de passe. Voici comment cela fonctionne :

- [cryptographie asymétrique](#cryptographie-asymétrique)
  - [1. Principe de fonctionnement](#1-principe-de-fonctionnement)
  - [2. Génération des clés](#2-génération-des-clés)
  - [3. Installation de la clé publique sur le serveur](#3-installation-de-la-clé-publique-sur-le-serveur)
  - [4. Connexion SSH au serveur](#4-connexion-ssh-au-serveur)
  - [5. Sécurité supplémentaire](#5-sécurité-supplémentaire)
  - [Conclusion](#conclusion)


## cryptographie asymétrique

### 1. Principe de fonctionnement

La connexion SSH via clé de chiffrement repose sur la cryptographie asymétrique. 

Dans ce modèle, deux clés sont utilisées : une clé publique et une clé privée. Ces deux clés sont mathématiquement liées : ce que l'une chiffre, seule l'autre peut le déchiffrer.

- **Clé publique :** Peut être partagée librement. Elle est utilisée pour chiffrer des données.
- **Clé privée :** Doit rester secrète. Elle est utilisée pour déchiffrer les données.

### 2. Génération des clés

La première étape pour établir une connexion SSH sécurisée est de générer une paire de clés (publique et privée) sur le client.

- Sur un système Linux ou macOS, vous pouvez utiliser la commande `ssh-keygen`.
- Sur Windows, vous pouvez utiliser PuTTYgen ou le même `ssh-keygen` si vous avez Git Bash ou un autre terminal similaire installé.

La commande `ssh-keygen` crée par défaut une paire de clés **RSA** dans le répertoire `~/.ssh/`. Vous pouvez spécifier un algorithme différent (comme **ECDSA** ou **Ed25519**) et une clé de passe pour renforcer la sécurité de votre clé privée.

### 3. Installation de la clé publique sur le serveur

Après avoir généré votre paire de clés, vous devez installer la clé publique sur le serveur auquel vous souhaitez vous connecter. Cela se fait généralement en ajoutant la clé publique au fichier `~/.ssh/authorized_keys` du compte utilisateur sur le serveur.

Vous pouvez copier la clé publique manuellement ou utiliser la commande `ssh-copy-id` pour automatiser ce processus.

### 4. Connexion SSH au serveur

Une fois la clé publique installée sur le serveur, vous pouvez vous connecter sans mot de passe en utilisant votre clé privée. Lorsque vous lancez la commande de connexion SSH (par exemple, `ssh utilisateur@serveur`), le client SSH utilise votre clé privée pour prouver au serveur que vous êtes bien le détenteur de la clé publique correspondante sans jamais transmettre la clé privée elle-même.

Si vous avez sécurisé votre clé privée avec une clé de passe, vous devrez la saisir la première fois que vous utilisez la clé après avoir démarré votre ordinateur.

### 5. Sécurité supplémentaire

- **Agent SSH :** Un agent SSH gère les clés privées et peut automatiquement fournir la clé privée lors de la connexion sans nécessiter une saisie répétée de la clé de passe.
- **Phrases de passe :** Protéger votre clé privée avec une phrase de passe renforce la sécurité en nécessitant une authentification supplémentaire avant que la clé puisse être utilisée.

### Conclusion

La connexion SSH via clé de chiffrement est un moyen sûr et efficace de se connecter à des serveurs à distance. En éliminant le besoin de mots de passe, elle réduit le risque d'attaques de force brute et offre une méthode d'authentification plus sécurisée et plus pratique pour les utilisateurs et les administrateurs de systèmes.