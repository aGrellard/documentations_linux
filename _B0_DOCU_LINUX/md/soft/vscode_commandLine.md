- [1. Ouvrir VS Code](#1-ouvrir-vs-code)
  - [**Ouvrir VS Code**:](#ouvrir-vs-code)
  - [**Ouvrir un fichier ou dossier**:](#ouvrir-un-fichier-ou-dossier)
  - [**Ouvrir un fichier à une ligne et colonne spécifiques**:](#ouvrir-un-fichier-à-une-ligne-et-colonne-spécifiques)
- [2. Gestion des fenêtres et des sessions](#2-gestion-des-fenêtres-et-des-sessions)
  - [**Ajouter un dossier à la dernière fenêtre active**:](#ajouter-un-dossier-à-la-dernière-fenêtre-active)
  - [**Nouvelle fenêtre**:](#nouvelle-fenêtre)
  - [**Rejoindre une fenêtre (pour le développement multi-serveur)**:](#rejoindre-une-fenêtre-pour-le-développement-multi-serveur)
  - [**Aller à un fichier (Quick Open)**:](#aller-à-un-fichier-quick-open)
- [3. Gestion des espaces de travail](#3-gestion-des-espaces-de-travail)
  - [**Ouvrir un espace de travail**:](#ouvrir-un-espace-de-travail)
  - [**Créer un nouvel espace de travail avec des dossiers spécifiques**:](#créer-un-nouvel-espace-de-travail-avec-des-dossiers-spécifiques)
- [4. Différences et modifications](#4-différences-et-modifications)
  - [**Comparer deux fichiers**:](#comparer-deux-fichiers)
- [5. Options diverses](#5-options-diverses)
  - [**Forcer une nouvelle instance**:](#forcer-une-nouvelle-instance)
  - [**Ouvrir un fichier ou dossier en mode lecture seule** (Preview) :](#ouvrir-un-fichier-ou-dossier-en-mode-lecture-seule-preview-)
  - [**Désactiver les extensions**:](#désactiver-les-extensions)
  - [**Ouvrir VS Code avec une langue spécifique**:](#ouvrir-vs-code-avec-une-langue-spécifique)
  - [**Afficher la version de VS Code**:](#afficher-la-version-de-vs-code)
  - [**Afficher l'aide sur la ligne de commande**:](#afficher-laide-sur-la-ligne-de-commande)
- [Exemples pratiques](#exemples-pratiques)
  - [**Ouvrir plusieurs dossiers dans une nouvelle fenêtre**:](#ouvrir-plusieurs-dossiers-dans-une-nouvelle-fenêtre)
  - [**Comparer deux fichiers directement**:](#comparer-deux-fichiers-directement)


### 1. Ouvrir VS Code

#### **Ouvrir VS Code**:
-
    ```bash
    code
    ```
#### **Ouvrir un fichier ou dossier**:
  - 
    ```bash
    code /chemin/vers/fichier_ou_dossier
    ```

#### **Ouvrir un fichier à une ligne et colonne spécifiques**:
  - 
    ```bash
    code /chemin/vers/fichier:ligne:colonne
    ```

### 2. Gestion des fenêtres et des sessions

#### **Ajouter un dossier à la dernière fenêtre active**:
  - 
    ```bash
    code --add /chemin/vers/dossier
    ```

#### **Nouvelle fenêtre**:
  - 
    ```bash
    code --new-window
    ```

  ou pour ouvrir un fichier/dossier dans une nouvelle fenêtre:

  - 
    ```bash
    code --new-window /chemin/vers/fichier_ou_dossier
    ```

#### **Rejoindre une fenêtre (pour le développement multi-serveur)**:
  - 
    ```bash
    code --reuse-window
    ```

#### **Aller à un fichier (Quick Open)**:
  - 
    ```bash
    code --goto /chemin/vers/fichier:ligne:colonne
    ```

### 3. Gestion des espaces de travail

#### **Ouvrir un espace de travail**:
  - 
    ```bash
    code /chemin/vers/espace_de_travail.code-workspace
    ```

#### **Créer un nouvel espace de travail avec des dossiers spécifiques**:
  - 
    ```bash
    code --new-window --add /chemin/vers/dossier1 --add /chemin/vers/dossier2
    ```

### 4. Différences et modifications

#### **Comparer deux fichiers**:
  - 
    ```bash
    code --diff /chemin/vers/fichier1 /chemin/vers/fichier2
    ```

### 5. Options diverses

#### **Forcer une nouvelle instance**:
  - 
    ```bash
    code --new-instance
    ```

#### **Ouvrir un fichier ou dossier en mode lecture seule** (Preview) :
  - 
    ```bash
    code --preview /chemin/vers/fichier_ou_dossier
    ```

#### **Désactiver les extensions**:
  - 
    ```bash
    code --disable-extensions
    ```

#### **Ouvrir VS Code avec une langue spécifique**:
  - 
    ```bash
    code --locale=fr
    ```

#### **Afficher la version de VS Code**:
  - 
    ```bash
    code --version
    ```

#### **Afficher l'aide sur la ligne de commande**:
  - 
    ```bash
    code --help
    ```

### Exemples pratiques

#### **Ouvrir plusieurs dossiers dans une nouvelle fenêtre**:
  - 
    ```bash
    code --new-window --add /chemin/vers/dossier1 --add /chemin/vers/dossier2
    ```

#### **Comparer deux fichiers directement**:
  - 
    ```bash
    code --diff /chemin/vers/fichier1.txt /chemin/vers/fichier2.txt
    ```

Cette liste couvre les options de ligne de commande les plus courantes et utiles. VS Code est régulièrement mis à jour avec de nouvelles fonctionnalités, donc pour la liste la plus à jour des options de ligne de commande, vous pouvez exécuter `code --help` dans votre terminal ou consulter la documentation officielle de VS Code.