#########################

# sudo journalctl -ru ssh 

Mar 28 11:10:32 rpidebian sshd[5245]: pam_env(sshd:session): Unable to open env file: /etc/default/locale: No such file or directory

Le message d'erreur :
```
pam_env(sshd:session): Unable to open env file: /etc/default/locale: No such file or directory
```
indique que le système essaie de charger les paramètres régionaux (locale settings) à partir du fichier `/etc/default/locale` lors d'une session SSH, mais ne parvient pas à trouver ce fichier. Les paramètres régionaux définissent la langue, le pays, et d'autres préférences liées à la localisation qui influencent le comportement des logiciels. Ce fichier est souvent utilisé pour garantir que les applications exécutées dans la session SSH utilisent les bonnes préférences de langue et de formatage.

### Ce que cela signifie concrètement

L'absence de ce fichier peut entraîner des comportements inattendus ou des erreurs dans les applications qui s'attendent à ce que certaines variables de localisation soient définies. Par exemple, les formats de date, de monnaie, ou les messages pourraient ne pas s'afficher dans la langue ou le format attendu.

### Comment régler le problème

Pour résoudre ce problème, vous pouvez créer ou mettre à jour le fichier `/etc/default/locale` avec les paramètres régionaux appropriés pour votre système. Voici comment procéder :

1. **Déterminer les paramètres régionaux souhaités** : Vous devez savoir quels paramètres régionaux vous souhaitez utiliser. La commande `locale -a` liste tous les paramètres régionaux disponibles sur votre système. Choisissez celui qui correspond à votre langue et région, par exemple `en_US.UTF-8` pour l'anglais des États-Unis en UTF-8.

2. **Créer ou éditer le fichier `/etc/default/locale`** : Vous devez être root ou utiliser `sudo` pour modifier ou créer ce fichier. Vous pouvez utiliser n'importe quel éditeur de texte, par exemple `nano` ou `vi`.

Exemple de commande pour éditer le fichier avec `nano` (si le fichier n'existe pas, cela le créera) :
```bash
sudo nano /etc/default/locale
```

3. **Ajouter ou modifier les paramètres régionaux** : Dans l'éditeur de texte, ajoutez ou modifiez les lignes pour définir les variables `LANG` et potentiellement d'autres comme `LC_ALL`, `LC_MESSAGES`, etc., selon vos besoins. Par exemple, pour définir les paramètres régionaux en anglais des États-Unis en UTF-8, vous ajouteriez :
```
LANG="en_US.UTF-8"
```
Vous pouvez également définir d'autres variables LC si nécessaire, mais `LANG` est souvent suffisant.

4. **Sauvegarder et fermer le fichier** : Si vous utilisez `nano`, vous pouvez sauvegarder avec `Ctrl-O`, confirmer avec `Enter`, et quitter avec `Ctrl-X`. Avec `vi`, vous pouvez sauvegarder et quitter en tapant `:wq` et en appuyant sur `Enter`.

5. **Appliquer les changements** : Les modifications prendront effet pour les nouvelles sessions. Vous pouvez tester en ouvrant une nouvelle session SSH ou en redémarrant le service SSH avec `sudo systemctl restart ssh`.

En créant ou mettant à jour le fichier `/etc/default/locale` avec les paramètres régionaux appropriés, vous devriez résoudre le problème signalé et assurer une expérience cohérente en termes de langue et de formatage pour les utilisateurs de votre système.

#########################

#########################

# sudo journalctl -ru ssh 


Mar 28 15:34:10 rpidebian sshd[6215]: pam_env(sshd:session): deprecated reading of user environment enabled 


Dans la configuration PAM fournie pour le service SSH, la ligne qui attire l'attention en rapport avec le message d'erreur est :

```
session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
```

Cette ligne indique que le module `pam_env` est utilisé pour configurer l'environnement de session en lisant des variables d'environnement à partir de fichiers spécifiques. Voici les éléments clés de cette ligne :

- **`pam_env.so`** : C'est le module PAM responsable de la gestion des variables d'environnement pour les sessions.
- **`user_readenv=1`** : Cette option active la lecture des variables d'environnement à partir d'un fichier dans le répertoire personnel de l'utilisateur (par défaut, `~/.pam_environment`), ce qui est considéré comme déconseillé (deprecated) dans certaines configurations pour des raisons de sécurité. C'est cette option qui est probablement à l'origine du message d'erreur indiquant que la lecture de l'environnement utilisateur est activée.
- **`envfile=/etc/default/locale`** : Spécifie un fichier d'où lire des variables d'environnement supplémentaires. Ce fichier est utilisé pour configurer les paramètres régionaux (locales) de manière globale sur le système.

Le message d'erreur :
```sh
Mar 28 15:34:10 rpidebian sshd[6215]: pam_env(sshd:session): deprecated reading of user environment enabled
```
fait donc référence à l'utilisation de `user_readenv=1` dans la configuration de `pam_env`, signalant que la fonctionnalité de lecture des variables d'environnement utilisateur est activée, ce qui est considéré comme une pratique déconseillée ou obsolète.

### Comment corriger cette configuration

Pour répondre aux préoccupations de sécurité et éviter ce message d'erreur, vous pouvez modifier la configuration de `pam_env` pour désactiver la lecture des variables d'environnement utilisateur. Voici comment procéder :

1. **Ouvrez le fichier de configuration PAM pour SSH** (souvent situé à `/etc/pam.d/sshd`) avec un éditeur de texte en tant que superutilisateur.

2. **Trouvez la ligne** :
   ```
   session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
   ```
3. **Modifiez ou commentez cette ligne**. Pour simplement désactiver la lecture des variables d'environnement utilisateur, vous pouvez la modifier pour enlever l'option `user_readenv=1`, laissant la ligne comme suit :
   ```
   session    required     pam_env.so envfile=/etc/default/locale
   ```
   Ou, si vous préférez désactiver complètement cette fonctionnalité, vous pouvez commenter toute la ligne en ajoutant un `#` au début :
   ```
   #session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
   ```

4. **Enregistrez le fichier** et fermez l'éditeur.

5. **Redémarrez le service SSH** pour appliquer les changements :
   ```
   sudo systemctl restart sshd
   ```

En modifiant cette configuration, vous vous assurez que les variables d'environnement spécifiques à l'utilisateur ne sont pas lues lors de l'établissement des sessions SSH, ce qui répond aux préoccupations de sécurité et évite le message d'erreur mentionné.

#########################

