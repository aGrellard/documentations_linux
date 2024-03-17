- [Manipulation de Chaînes de Caractères en Bash : Guide Complet](#manipulation-de-chaînes-de-caractères-en-bash--guide-complet)
  - [Chapitre 1 : Opérations de Base sur les Chaînes](#chapitre-1--opérations-de-base-sur-les-chaînes)
    - [1.1 Concaténation](#11-concaténation)
    - [1.2 Longueur d'une Chaîne](#12-longueur-dune-chaîne)
    - [1.3 Accès à un Caractère](#13-accès-à-un-caractère)
  - [Chapitre 2 : Extraction et Remplacement](#chapitre-2--extraction-et-remplacement)
    - [2.1 Extraction de Sous-chaîne](#21-extraction-de-sous-chaîne)
    - [2.2 Remplacement de Sous-chaîne](#22-remplacement-de-sous-chaîne)
  - [Chapitre 3 : Manipulation Avancée des Chaînes](#chapitre-3--manipulation-avancée-des-chaînes)
    - [3.1 Suppression de Sous-chaînes](#31-suppression-de-sous-chaînes)
    - [3.2 Majuscules et Minuscules](#32-majuscules-et-minuscules)
    - [3.3 Comparaison de Chaînes](#33-comparaison-de-chaînes)
    - [3.4 Supprimer un caractère d'une chaîne par sa position](#34-supprimer-un-caractère-dune-chaîne-par-sa-position)
    - [3.5 Supprimer un caractère d'une chaîne par son motif](#35-supprimer-un-caractère-dune-chaîne-par-son-motif)
  - [Chapitre 4 : Opérations sur les Lignes et les Mots](#chapitre-4--opérations-sur-les-lignes-et-les-mots)
    - [4.1 Diviser une Chaîne en Mots](#41-diviser-une-chaîne-en-mots)
    - [4.2 Joindre des Mots en une Chaîne](#42-joindre-des-mots-en-une-chaîne)
  - [Conclusion](#conclusion)


# Manipulation de Chaînes de Caractères en Bash : Guide Complet

La manipulation de chaînes de caractères est une compétence essentielle en programmation Bash, permettant de traiter efficacement les données textuelles. Ce guide détaillé explore les techniques de base et avancées pour manipuler des chaînes en Bash.

## Chapitre 1 : Opérations de Base sur les Chaînes

### 1.1 Concaténation

La concaténation se fait simplement en juxtaposant des variables ou des chaînes.

```bash
str1="Hello, "
str2="World!"
str="$str1$str2"
echo "$str"  # Affiche "Hello, World!"
```

### 1.2 Longueur d'une Chaîne

Utilisez `${#str}` pour obtenir la longueur d'une chaîne.

```bash
str="Hello, World!"
echo ${#str}  # Affiche 13
```

### 1.3 Accès à un Caractère

Accédez à un caractère spécifique via son indice (basé sur zéro) avec `${str:position:1}`.

```bash
echo ${str:7:1}  # Affiche "W"
```

## Chapitre 2 : Extraction et Remplacement

### 2.1 Extraction de Sous-chaîne

Extraire une sous-chaîne en spécifiant la position de départ et la longueur.

```bash
echo ${str:7:5}  # Affiche "World"
```

Si la longueur est omise, la sous-chaîne jusqu'à la fin est extraite.

```bash
echo ${str:7}  # Affiche "World!"
```

### 2.2 Remplacement de Sous-chaîne

Remplacez la première occurrence d'une sous-chaîne par une autre avec `${str/old/new}`.

```bash
echo ${str/World/Universe}  # Affiche "Hello, Universe!"
```

Pour remplacer toutes les occurrences, utilisez `${str//old/new}`.

```bash
str="Hello, World! World is big."
echo ${str//World/Universe}  # Affiche "Hello, Universe! Universe is big."
```

## Chapitre 3 : Manipulation Avancée des Chaînes

### 3.1 Suppression de Sous-chaînes

Supprimez une sous-chaîne du début (`#`) ou de la fin (`%`) de la chaîne.

- **Supprimer le préfixe le plus court** : `${str#pattern}`
- **Supprimer le préfixe le plus long** : `${str##pattern}`
- **Supprimer le suffixe le plus court** : `${str%pattern}`
- **Supprimer le suffixe le plus long** : `${str%%pattern}`

```bash
str="folder/subfolder/file.txt"
echo ${str#*/}  # Affiche "subfolder/file.txt"
echo ${str##*/}  # Affiche "file.txt"
```

### 3.2 Majuscules et Minuscules

Convertir une chaîne en majuscules ou en minuscules.

- **Majuscules** : `${str^^}`
- **Minuscules** : `${str,,}`

```bash
str="Hello, World!"
echo ${str^^}  # Affiche "HELLO, WORLD!"
echo ${str,,}  # Affiche "hello, world!"
```

### 3.3 Comparaison de Chaînes

Bash utilise `=` pour vérifier si deux chaînes sont identiques et `!=` pour leur différence. Utilisez `[[` et `]]` pour les tests.

```bash
str1="Hello"
str2="World"
if [[ $str1 = $str2 ]]; then
    echo "Les chaînes sont identiques."
else
    echo "Les chaînes sont différentes."
fi
```

### 3.4 Supprimer un caractère d'une chaîne par sa position

1. **Extraire le début de la chaîne jusqu'au caractère avant `n`.**  
   `${chaine:0:n-1}`  
   Cela prend les caractères depuis le début jusqu'au caractère juste avant la position `n`.

2. **Extraire le reste de la chaîne après le caractère à la position `n`.**  
   `${chaine:n+1}`  
   Cela prend les caractères de la position `n+1` jusqu'à la fin.

3. **Concaténer ces deux parties.**

    Supposons que vous voulez supprimer le 4ème caractère (`j`) de la chaîne `"bonjour"`, ce qui signifie `n = 3` (car les positions commencent à 0).

    ```bash
    chaine="bonjour"
    n=3
    nouvelle_chaine="${chaine:0:n}${chaine:n+1}"
    echo "$nouvelle_chaine"
    ```

### 3.5 Supprimer un caractère d'une chaîne par son motif

```bash
chaine="bonjour"
echo "${chaine//j/}"
```

- `${chaine` : Cela indique que nous travaillons avec la variable `chaine`.
- `//j/` : Le double slash `//` indique que nous voulons remplacer toutes les occurrences du motif qui suit (dans ce cas, "j") par ce qui vient après le second slash (dans ce cas, rien, signifiant que nous supprimons le motif).
- `}` : Ferme l'expression de remplacement.

Cela affichera "bonour", qui est la chaîne "bonjour" avec le "j" supprimé.

## Chapitre 4 : Opérations sur les Lignes et les Mots

### 4.1 Diviser une Chaîne en Mots

Divisez une chaîne en mots en utilisant `read` et un `IFS` (Internal Field Separator) personnalisé.

```bash
str="one two three"
IFS=' ' read -r -a mots <<< "$str"
echo "${mots[1]}"  # Affiche "two"
```

### 4.2 Joindre des Mots en une Chaîne

Pour joindre des éléments d'un tableau en une chaîne, utilisez `IFS` et `*`.

```bash
mots=("one" "two" "three")
IFS=','; echo "${mots[*]}"  # Affiche "one,two,three"
```

## Conclusion

La manipulation de chaînes en Bash offre une grande flexibilité pour le traitement de données textuelles. Maîtriser ces techniques vous permettra de gérer efficacement des opérations complexes sur des chaînes, rendant vos scripts Bash plus puissants et plus adaptables aux besoins de traitement des données.