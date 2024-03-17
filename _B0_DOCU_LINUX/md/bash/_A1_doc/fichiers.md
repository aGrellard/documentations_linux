- [Gestion des Fichiers dans un Script Bash](#gestion-des-fichiers-dans-un-script-bash)
  - [Tests de Fichiers](#tests-de-fichiers)
    - [Exemple de Test de Fichier](#exemple-de-test-de-fichier)
  - [Lecture de Fichiers](#lecture-de-fichiers)
  - [Écriture dans des Fichiers](#écriture-dans-des-fichiers)
    - [Écrire ou Ajouter à un Fichier](#écrire-ou-ajouter-à-un-fichier)
  - [Manipulation de Fichiers et Répertoires](#manipulation-de-fichiers-et-répertoires)
  - [Lire et Assigner des Fichiers à des Variables](#lire-et-assigner-des-fichiers-à-des-variables)
  - [Trouver des Fichiers](#trouver-des-fichiers)
  - [Permissions de Fichiers](#permissions-de-fichiers)
  - [Conclusion](#conclusion)


# Gestion des Fichiers dans un Script Bash

La manipulation de fichiers est une part essentielle de la programmation Bash, permettant de lire, écrire, modifier et tester des fichiers et répertoires. Cette documentation détaille comment gérer efficacement les fichiers dans vos scripts Bash, incluant les tests de fichiers, la lecture, l'écriture, et d'autres opérations courantes.

## Tests de Fichiers

Les tests de fichiers en Bash permettent de vérifier diverses propriétés d'un fichier ou d'un répertoire avant de procéder à des opérations plus complexes. Voici quelques opérateurs de test couramment utilisés :

- **`-e`** : Vérifie si le fichier existe.
- **`-f`** : Vérifie si le fichier est un fichier régulier (et non un répertoire).
- **`-d`** : Vérifie si le fichier est un répertoire.
- **`-r`** : Vérifie si le fichier est lisible.
- **`-w`** : Vérifie si le fichier est modifiable.
- **`-x`** : Vérifie si le fichier est exécutable.
- **`-s`** : Vérifie si le fichier est non vide.
- **`-L`** : Vérifie si le fichier est un lien symbolique.

### Exemple de Test de Fichier

```bash
if [ -f "mon_script.sh" ]; then
    echo "Le fichier existe et est un fichier régulier."
fi
```

## Lecture de Fichiers

Pour lire le contenu d'un fichier ligne par ligne :

```bash
while IFS= read -r ligne; do
  echo "$ligne"
done < "mon_fichier.txt"
```

Cette boucle `while` lit `mon_fichier.txt` ligne par ligne, en stockant chaque ligne dans la variable `ligne` que l'on peut ensuite manipuler.

## Écriture dans des Fichiers

### Écrire ou Ajouter à un Fichier

- **`>`** : Redirige la sortie vers un fichier, en écrasant son contenu.
- **`>>`** : Redirige la sortie vers un fichier, en ajoutant à la fin.

```bash
echo "Nouvelle ligne" > mon_fichier.txt  # Écrase le fichier
echo "Ajout d'une ligne" >> mon_fichier.txt  # Ajoute à la fin
```

## Manipulation de Fichiers et Répertoires

- **Copier** : `cp fichier_source fichier_destination`
- **Déplacer/Renommer** : `mv fichier_source fichier_destination`
- **Supprimer** : `rm mon_fichier.txt` pour les fichiers, `rm -r mon_dossier` pour les répertoires.
- **Créer un Répertoire** : `mkdir nouveau_dossier`

## Lire et Assigner des Fichiers à des Variables

Pour stocker le contenu d'un fichier dans une variable :

```bash
contenu=$(<mon_fichier.txt)
echo "$contenu"
```

## Trouver des Fichiers

Utilisez `find` pour rechercher des fichiers dans un système de fichiers :

```bash
find /chemin/de/recherche -type f -name "*.txt"
```

## Permissions de Fichiers

Changer les permissions avec `chmod` :

```bash
chmod +x mon_script.sh  # Rend le script exécutable
```

## Conclusion

La gestion efficace des fichiers est un pilier de la programmation Bash, permettant des scripts robustes et polyvalents. Que ce soit pour tester des propriétés de fichiers, lire ou écrire des données, manipuler des fichiers et répertoires, ou ajuster les permissions, maîtriser ces opérations élargit considérablement vos capacités en tant que scripteur Bash. Pratiquez ces commandes et intégrez-les dans vos scripts pour automatiser et simplifier la gestion des fichiers sur vos systèmes.