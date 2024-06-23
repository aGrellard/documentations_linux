# L'Héritage du Bit setgid 

Le bit setgid est un attribut de fichier qui permet à un fichier d'hériter du groupe propriétaire du répertoire parent lorsqu'il est exécuté. Cela signifie que les fichiers exécutables avec le bit setgid activé seront exécutés avec le groupe propriétaire du répertoire parent, plutôt que le groupe de l'utilisateur qui les exécute.

# questions sur les droits d'accès `drwxrwsr-x`

```bash
User
╭─adri-rpi@rpi4-debi12 /media                                                     
╰─$ sudo chmod -R 775 usb_3T                                                      
╭─adri-rpi@rpi4-debi12 /media                                                     
╰─$ ls -lsha                                                                      
total 40K                                                                         
4,0K drwxr-xr-x  4 root     root     4,0K 31 mars  21:44 .                        
4,0K drwxr-xr-x 18 root     root     4,0K 31 mars  18:12 ..                       
 16K drwxrwxr-x  1 adri-rpi adri-rpi   30 12 mars  21:39 usb_1T                   
 16K drwxrwsr-x  1 adri-rpi adri-rpi   22  3 nov.  05:32 usb_3T                   


peux tu expliquer le masque : drwxrwsr-x  1 adri-rpi adri-rpi   22  3 nov.  05:32 usb_3T  
et a quoi coresspond le s de sr-x  normalement je devrait avoir drwxrwxr-x
```

Le masque que vous voyez (`drwxrwsr-x`) pour le dossier `usb_3T` dans votre système de fichiers Linux donne beaucoup d'informations sur les permissions de ce dossier. Voici une explication détaillée de chaque partie de ce masque :

- **d** : Cela indique qu'il s'agit d'un dossier (directory).

- **rwx** : Les trois premiers caractères après le `d` représentent les permissions du propriétaire du fichier ou du dossier. Dans ce cas, `rwx` signifie que le propriétaire a les droits de lecture (`r`), d'écriture (`w`), et d'exécution (`x`).

- **rws** : Les trois caractères suivants représentent les permissions du groupe associé au fichier ou au dossier. Habituellement, vous verriez `rwx` ou `r-x` ici, mais le `s` au lieu du `x` a une signification spéciale. Le `r` signifie que les membres du groupe ont le droit de lire le dossier, le `w` signifie qu'ils ont le droit de modifier le contenu du dossier, et le `s` (au lieu de `x`) indique que le bit setgid (Set Group ID) est activé pour ce dossier. Lorsqu'un dossier a le bit setgid activé, les nouveaux fichiers créés dans ce dossier hériteront du groupe du dossier, plutôt que du groupe principal de l'utilisateur qui les a créés. Cela est souvent utilisé dans les environnements où plusieurs utilisateurs travaillent dans le même dossier et ont besoin d'accéder et de modifier les fichiers des autres. Pour les fichiers exécutables, cela signifie que le programme est exécuté avec les permissions du groupe propriétaire du fichier.

- **r-x** : Les trois derniers caractères représentent les permissions pour tous les autres utilisateurs qui ne sont ni le propriétaire ni membres du groupe. `r-x` signifie que les autres utilisateurs peuvent lire le dossier et l'exécuter (c'est-à-dire accéder à son contenu), mais pas modifier son contenu.

La raison pour laquelle vous voyez `drwxrwsr-x` au lieu de `drwxrwxr-x` est due à l'activation du bit setgid sur le dossier `usb_3T`. Cela a été probablement fait avec une commande comme `chmod g+s usb_3T`.

En résumé, `drwxrwsr-x` indique un dossier où le propriétaire a tous les droits, les membres du groupe ont le droit de lire, écrire et les nouveaux fichiers hériteront du groupe du dossier (à cause du `s`), et les autres utilisateurs peuvent seulement lire et accéder au dossier.

## suite

Si vous avez spécifié `chmod -R 775` sur le dossier `usb_3T` depuis son dossier parent et que vous vous attendiez à voir les permissions `drwxrwxr-x` mais que vous voyez à la place `drwxrwsr-x`, cela indique que le bit setgid était déjà activé sur ce dossier ou qu'il a été activé par une autre opération.

Voici quelques points à considérer :

1. **L'Héritage du Bit setgid** : Lorsque vous appliquez `chmod -R 775` à un dossier, cela définit les permissions comme `rwxrwxr-x` pour tous les fichiers et dossiers à l'intérieur. Cependant, si le bit setgid est déjà activé sur le dossier parent ou sur `usb_3T` lui-même, cette commande n'affecte pas le bit setgid. Le `s` dans les permissions du groupe (`rws`) indique que le bit setgid est activé, ce qui fait que les fichiers ou dossiers créés à l'intérieur héritent du groupe du dossier parent, et non du groupe principal de l'utilisateur qui les crée.

2. **La Commande `chmod` et le Bit setgid** : La commande `chmod 775` n'affecte pas les bits spéciaux comme le setuid ou le setgid. Pour spécifiquement enlever le bit setgid, vous devriez utiliser `chmod g-s usb_3T` ou pour le rajouter délibérément, `chmod g+s usb_3T`.

3. **Pourquoi le Bit setgid Était Activé** : Il y a plusieurs raisons pour lesquelles le bit setgid pourrait avoir été activé sur `usb_3T`. Cela peut être une configuration par défaut du système pour les supports amovibles, une politique de sécurité spécifique, ou quelqu'un d'autre qui utilise le système pourrait l'avoir activé pour une raison particulière.

Si vous souhaitez que les permissions soient strictement `drwxrwxr-x` pour `usb_3T` et pour supprimer le bit setgid, exécutez la commande suivante depuis le dossier parent ou directement à l'intérieur de `usb_3T`:

```bash
sudo chmod g-s usb_3T
```

Et si vous voulez ensuite appliquer `775` pour assurer que les permissions sont comme vous le souhaitez, refaites :

```bash
sudo chmod -R 775 usb_3T
```

Cela devrait donner à `usb_3T` les permissions `drwxrwxr-x`, en supposant qu'aucune autre configuration ou processus automatique ne réapplique le bit setgid.

# Tutoriel et Documentation Complète sur le Bit setgid

## Introduction

Le bit setgid (set group ID) est un attribut spécial qui peut être appliqué aux fichiers exécutables et aux répertoires dans les systèmes de fichiers Unix et Linux. Lorsqu'il est appliqué à un fichier exécutable, le bit setgid fait en sorte que le fichier soit exécuté avec les privilèges du groupe propriétaire du fichier, plutôt qu'avec ceux du groupe de l'utilisateur qui lance le fichier. Lorsqu'il est appliqué à un répertoire, le bit setgid garantit que les fichiers créés dans ce répertoire héritent du groupe propriétaire du répertoire, au lieu du groupe principal de l'utilisateur qui les crée.

## Syntaxe de Base pour Appliquer le Bit setgid

Pour modifier les permissions d'un fichier ou d'un répertoire et appliquer le bit setgid, utilisez la commande `chmod` :

```bash
chmod g+s fichier_ou_répertoire
```

## Visualisation du Bit setgid

Pour voir si le bit setgid est appliqué à un fichier ou à un répertoire, utilisez la commande `ls -l` :

```bash
ls -l fichier_ou_répertoire
```

Si le bit setgid est appliqué, vous verrez un `s` dans les permissions du groupe :

- Pour un fichier : `-rwxr-sr-x`
- Pour un répertoire : `drwxr-sr-x`

## Retirer le Bit setgid

Pour retirer le bit setgid d'un fichier ou d'un répertoire, utilisez la commande suivante :

```bash
chmod g-s fichier_ou_répertoire
```

## Exemples d'Utilisation

### Appliquer le Bit setgid à un Répertoire

```bash
chmod g+s /chemin/vers/répertoire
```

Tous les fichiers créés dans ce répertoire auront le même groupe propriétaire que le répertoire.

### Appliquer le Bit setgid à un Fichier Exécutable

```bash
chmod g+s /chemin/vers/fichier
```

Le fichier exécutable sera exécuté avec les privilèges du groupe propriétaire du fichier.

### Vérification du Bit setgid sur un Répertoire

```bash
ls -ld /chemin/vers/répertoire
```

Recherchez un `s` dans les permissions du groupe, par exemple `drwxr-sr-x`.

### Retirer le Bit setgid d'un Répertoire

```bash
chmod g-s /chemin/vers/répertoire
```

Cela empêche les nouveaux fichiers dans le répertoire d'hériter automatiquement du groupe propriétaire du répertoire.

## Conseils d'Utilisation

- L'utilisation du bit setgid sur des répertoires est particulièrement utile dans des environnements de travail collaboratif où plusieurs utilisateurs doivent partager l'accès et la modification des fichiers dans un répertoire commun.
- Faites attention lors de l'application du bit setgid sur des fichiers exécutables, car cela peut avoir des implications en matière de sécurité. Assurez-vous que seul un groupe fiable a des droits d'exécution sur le fichier.
- Le bit setgid peut aussi être combiné avec d'autres bits spéciaux, comme le bit setuid, pour des configurations de permission plus complexes.

## Conclusion

Le bit setgid est un outil puissant pour gérer les permissions et l'accès aux fichiers et répertoires dans les systèmes Unix et Linux. Il facilite la collaboration et la gestion des permissions de groupe, tout en offrant des options flexibles pour l'exécution sécurisée des fichiers exécutables. Comme pour tout outil puissant, il est important de l'utiliser avec prudence et de comprendre ses implications en matière de sécurité.