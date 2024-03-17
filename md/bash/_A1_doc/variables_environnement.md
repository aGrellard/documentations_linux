- [Variables Système Basiques](#variables-système-basiques)
- [Variables liées à l'Utilisateur et au Groupe](#variables-liées-à-lutilisateur-et-au-groupe)
- [Variables de Configuration Locale](#variables-de-configuration-locale)
- [Variables liées au Terminal](#variables-liées-au-terminal)
- [Variables liées au Réseau](#variables-liées-au-réseau)
- [Variables liées au Système d'Exploitation et au Matériel](#variables-liées-au-système-dexploitation-et-au-matériel)
- [Variables de Gestion de Jobs](#variables-de-gestion-de-jobs)
- [Variables liées à Bash](#variables-liées-à-bash)
- [Autres Variables Importantes](#autres-variables-importantes)


### Variables Système Basiques

- **`HOME`** : Le chemin du répertoire personnel de l'utilisateur courant.
- **`PWD`** : Le répertoire de travail actuel.
- **`OLDPWD`** : Le répertoire de travail précédent.
- **`PATH`** : Les chemins des répertoires où le shell cherche les commandes exécutables.
- **`SHELL`** : Le chemin de l'interpréteur de commande par défaut pour l'utilisateur.

### Variables liées à l'Utilisateur et au Groupe

- **`USER`** (ou **`LOGNAME`**) : Le nom de l'utilisateur courant.
- **`UID`** : L'ID utilisateur du processus courant.
- **`EUID`** : L'ID utilisateur effectif du processus courant.
- **`GROUPS`** : Les groupes auxquels l'utilisateur courant appartient.
- **`GID`** : L'ID du groupe principal de l'utilisateur courant.

### Variables de Configuration Locale

- **`LANG`** : La langue et la localisation courante, affectant l'affichage des dates, des montants monétaires, etc.
- **`LC_*`** : Un ensemble de variables (`LC_COLLATE`, `LC_CTYPE`, `LC_MESSAGES`, `LC_MONETARY`, `LC_NUMERIC`, `LC_TIME`, etc.) qui peuvent affiner les paramètres locaux.

### Variables liées au Terminal

- **`TERM`** : Le type de terminal utilisé pour l'exécution du script ou de la session shell.
- **`PS1`**, **`PS2`** : Les prompts de commande primaire et secondaire.

### Variables liées au Réseau

- **`HOSTNAME`** : Le nom d'hôte de la machine.
- **`SSH_CLIENT`**, **`SSH_CONNECTION`**, **`SSH_TTY`** : Fournissent des informations sur la session SSH courante, si applicable.

### Variables liées au Système d'Exploitation et au Matériel

- **`OSTYPE`** : Une chaîne décrivant le système d'exploitation.
- **`MACHTYPE`** : Le type de machine, typiquement l'architecture du système.

### Variables de Gestion de Jobs

- **`$?`** : Le statut de sortie de la dernière commande exécutée.
- **`$$`** : Le PID du processus shell courant.
- **`$!`** : Le PID du dernier processus exécuté en arrière-plan.

### Variables liées à Bash

- **`BASH_VERSION`**, **`BASH_VERSINFO`** : Informations sur la version de Bash.
- **`HISTSIZE`**, **`HISTFILESIZE`** : Contrôlent la taille de l'historique des commandes.

### Autres Variables Importantes

- **`EDITOR`**, **`VISUAL`** : Définissent l'éditeur de texte par défaut.
- **`MAIL`** : Le chemin vers la boîte de réception de l'utilisateur courant.
- **`TMPDIR`** : Spécifie le répertoire temporaire pour les fichiers temporaires.

Cette liste couvre les variables d'environnement les plus fondamentales et couramment utilisées sous Linux, mais gardez à l'esprit que des applications et des services spécifiques peuvent définir et utiliser leurs propres variables d'environnement, qui ne sont pas incluses ici.