### Tutoriel et Documentation sur SCP (Secure Copy Protocol)

#### Introduction à SCP

SCP (Secure Copy Protocol) est un outil de ligne de commande utilisé pour le transfert sécurisé de fichiers entre deux ordinateurs sur un réseau. Il utilise SSH (Secure Shell) pour le transfert de données, garantissant ainsi la sécurité des données transférées. SCP est largement utilisé pour copier des fichiers et des dossiers entre un système local et un système distant, ou entre deux systèmes distants.

#### Installation de SCP

SCP est généralement installé avec le paquet SSH sur la plupart des distributions Linux et macOS. Sur Windows, SCP peut être utilisé via Git Bash ou en installant Windows Subsystem for Linux (WSL).

#### Syntaxe de base

La syntaxe de base de SCP est la suivante :

```bash
scp [OPTIONS] source destination
```

- **[OPTIONS]** : Paramètres supplémentaires pour personnaliser le comportement de SCP (facultatif).
- **source** : Le chemin du fichier ou du dossier à copier.
- **destination** : Le chemin où le fichier ou le dossier sera copié.

#### Options de SCP

Voici une liste des options les plus couramment utilisées avec SCP :

- `-P port` : Spécifie le port SSH sur lequel se connecter (si différent du port par défaut 22).
- `-p` : Préserve les attributs des fichiers, tels que le mode d'accès et les horodatages.
- `-r` : Copie récursivement les dossiers entiers.
- `-q` : Mode silencieux, n'affiche pas la barre de progression ni les messages d'erreur.
- `-C` : Active la compression. Utile pour accélérer le transfert de fichiers sur des connexions lentes.
- `-i identity_file` : Utilise un fichier d'identité (clé privée) pour l'authentification SSH.

#### Utilisation de SCP

**Transférer un fichier d'un système local vers un système distant :**

```bash
scp fichier.txt utilisateur@serveurdistant:/chemin/destination/
```

**Transférer un fichier d'un système distant vers un système local :**

```bash
scp utilisateur@serveurdistant:/chemin/source/fichier.txt /chemin/destination/local/
```

**Copier récursivement un dossier vers un système distant :**

```bash
scp -r dossier utilisateur@serveurdistant:/chemin/destination/
```

**Utiliser un port SSH spécifique :**

```bash
scp -P 2222 fichier.txt utilisateur@serveurdistant:/chemin/destination/
```

**Conserver les attributs des fichiers lors du transfert :**

```bash
scp -p fichier.txt utilisateur@serveurdistant:/chemin/destination/
```

#### Exemples complets avec SCP

- **Transférer plusieurs fichiers vers un système distant :**

  ```bash
  scp fichier1.txt fichier2.txt utilisateur@serveurdistant:/chemin/destination/
  ```

- **Transférer un fichier avec compression activée :**

  ```bash
  scp -C gros_fichier.txt utilisateur@serveurdistant:/chemin/destination/
  ```

- **Utiliser un fichier d'identité spécifique pour l'authentification :**

  ```bash
  scp -i ~/.ssh/ma_cle_privee fichier.txt utilisateur@serveurdistant:/chemin/destination/
  ```

#### Conseils et bonnes pratiques

- Assurez-vous que SSH est installé et configuré correctement sur les deux systèmes impliqués dans le transfert.
- Pour améliorer la sécurité, privilégiez l'authentification par clé SSH plutôt que par mot de passe.
- Utilisez l'option `-C` pour la compression sur des transferts de données volumineux et des connexions lentes.
- Testez d'abord le transfert avec un petit fichier pour vous assurer que la connexion et les permissions sont correctement configurées.

SCP est un outil puissant et flexible pour le transfert sécurisé de fichiers. Sa simplicité d'utilisation et sa sécurisation intégrée en font un choix privilégié pour de nombreux administrateurs système et utilisateurs.