Les commandes `adduser` et `useradd` ainsi que `deluser` et `userdel` sont utilisées pour gérer les comptes d'utilisateurs sur les systèmes Linux, mais elles diffèrent par leur complexité et leur facilité d'utilisation.

### adduser et useradd

- **useradd** : C'est une commande de bas niveau qui est fournie par défaut sur la plupart des distributions Linux. Elle permet de créer un nouvel utilisateur en ajoutant l'entrée correspondante dans les fichiers système tels que `/etc/passwd`, `/etc/shadow`, et `/etc/group`. `useradd` ne crée pas de répertoire personnel par défaut (sauf si spécifié) et nécessite généralement que l'administrateur définisse manuellement les options de la commande pour configurer correctement le compte de l'utilisateur (comme le répertoire home, le shell de connexion, etc.).

- **adduser** : C'est une commande de plus haut niveau qui est généralement un script Perl sous Debian et ses dérivés (comme Ubuntu). Elle simplifie le processus de création d'un nouvel utilisateur en automatisant plusieurs étapes. Par défaut, `adduser` crée un répertoire personnel pour l'utilisateur, copie les fichiers de configuration dans ce répertoire, et configure d'autres options par défaut comme le shell de connexion. Cette commande est considérée comme plus conviviale, surtout pour les administrateurs moins expérimentés.

### deluser et userdel

- **userdel** : C'est la commande de bas niveau correspondante pour supprimer un utilisateur. Comme `useradd`, elle modifie directement les fichiers système pour enlever l'entrée de l'utilisateur. Cependant, par défaut, `userdel` ne supprime pas le répertoire personnel de l'utilisateur ni ses fichiers, à moins que l'option `-r` ne soit utilisée.

- **deluser** : Comme `adduser`, `deluser` est un script de plus haut niveau qui facilite la suppression des utilisateurs. Sous Debian et ses dérivés, `deluser` peut supprimer non seulement le compte de l'utilisateur mais aussi son répertoire personnel et son courrier, selon les options spécifiées. Elle offre également la possibilité de supprimer un utilisateur d'un groupe spécifique sans supprimer le compte utilisateur entièrement.

En résumé, `adduser` et `deluser` sont des commandes plus conviviales qui automatisent de nombreuses étapes du processus d'ajout et de suppression d'utilisateurs, rendant la gestion des utilisateurs plus simple, en particulier pour les nouveaux administrateurs. En revanche, `useradd` et `userdel` offrent plus de contrôle à l'administrateur, mais nécessitent une meilleure compréhension des options de commande et des fichiers de configuration système.