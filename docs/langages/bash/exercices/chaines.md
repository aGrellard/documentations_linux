### Catégorie : Chaînes

#### Exercice 1 : Concaténation de chaînes
=== "Problème 1"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche leur concaténation.

=== "Réponse 1"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Concaténer les deux chaînes
    result="$str1$str2"

    # Afficher le résultat
    echo "La chaîne concaténée est : $result"
    ```

    ```bash
    Explications :
    - read capture les entrées utilisateur.
    - La concaténation se fait en utilisant "$str1$str2".
    ```

#### Exercice 2 : Longueur d'une chaîne
=== "Problème 2"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche sa longueur.

=== "Réponse 2"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str

    # Calculer la longueur de la chaîne
    length=${#str}

    # Afficher le résultat
    echo "La longueur de la chaîne est : $length"
    ```

    ```bash
    Explications :
    - ${#str} permet de calculer la longueur de la chaîne.
    ```

#### Exercice 3 : Extraction de sous-chaîne
=== "Problème 3"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et deux indices, et affiche la sous-chaîne correspondante.

=== "Réponse 3"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str
    echo "Entrez l'indice de départ :"
    read start
    echo "Entrez la longueur de la sous-chaîne :"
    read length

    # Extraire la sous-chaîne
    substring=${str:start:length}

    # Afficher le résultat
    echo "La sous-chaîne est : $substring"
    ```

    ```bash
    Explications :
    - ${str:start:length} permet d'extraire une sous-chaîne à partir de la chaîne d'origine.
    ```

#### Exercice 4 : Recherche de caractère dans une chaîne
=== "Problème 4"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et un caractère, et affiche la position du premier caractère trouvé.

=== "Réponse 4"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne et un caractère
    echo "Entrez une chaîne :"
    read str
    echo "Entrez un caractère :"
    read char

    # Trouver la position du premier caractère trouvé
    pos=$(expr index "$str" "$char")

    # Afficher le résultat
    echo "La position du premier caractère trouvé est : $pos"
    ```

    ```bash
    Explications :
    - expr index "$str" "$char" permet de trouver la position du premier caractère trouvé dans une chaîne.
    ```

#### Exercice 5 : Remplacement de sous-chaîne
=== "Problème 5"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne, une sous-chaîne à rechercher et une sous-chaîne de remplacement, et affiche la chaîne résultante.

=== "Réponse 5"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne et les sous-chaînes
    echo "Entrez une chaîne :"
    read str
    echo "Entrez la sous-chaîne à remplacer :"
    read search
    echo "Entrez la nouvelle sous-chaîne :"
    read replace

    # Remplacer la sous-chaîne
    result=${str//$search/$replace}

    # Afficher le résultat
    echo "La chaîne résultante est : $result"
    ```

    ```bash
    Explications :
    - ${str//$search/$replace} permet de remplacer toutes les occurrences de search par replace dans une chaîne.
    ```

#### Exercice 6 : Inversion de chaîne
=== "Problème 6"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche la chaîne inversée.

=== "Réponse 6"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str

    # Inverser la chaîne
    reversed=$(echo $str | rev)

    # Afficher le résultat
    echo "La chaîne inversée est : $reversed"
    ```

    ```bash
    Explications :
    - echo $str | rev permet d'inverser une chaîne en utilisant la commande rev.
    ```

#### Exercice 7 : Conversion en majuscules
=== "Problème 7"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche la chaîne en majuscules.

=== "Réponse 7"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str

    # Convertir en majuscules
    uppercase=$(echo $str | tr '[:lower:]' '[:upper:]')

    # Afficher le résultat
    echo "La chaîne en majuscules est : $uppercase"
    ```

    ```bash
    Explications :
    - echo $str | tr '[:lower:]' '[:upper:]' permet de convertir une chaîne en majuscules en utilisant la commande tr.
    ```

#### Exercice 8 : Conversion en minuscules
=== "Problème 8"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche la chaîne en minuscules.

=== "Réponse 8"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str

    # Convertir en minuscules
    lowercase=$(echo $str | tr '[:upper:]' '[:lower:]')

    # Afficher le résultat
    echo "La chaîne en minuscules est : $lowercase"
    ```

    ```bash
    Explications :
    - echo $str | tr '[:upper:]' '[:lower:]' permet de convertir une chaîne en minuscules en utilisant la commande tr.
    ```

#### Exercice 9 : Comparaison de chaînes
=== "Problème 9"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche si elles sont égales ou non.

=== "Réponse 9"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Comparer les chaînes
    if [ "$str1" == "$str2" ]; then
      echo "Les chaînes sont égales."
    else
      echo "Les chaînes ne sont pas égales."
    fi
    ```

    ```bash
    Explications :
    - [ "$str1" == "$str2" ] permet de comparer deux chaînes pour vérifier si elles sont égales.
    ```

#### Exercice 10 : Comptage de mots
=== "Problème 10"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche le nombre de mots dans la chaîne.

=== "Réponse 10"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str

    # Compter le nombre de mots
    word_count=$(echo $str | wc -w)

    # Afficher le résultat
    echo "Le nombre de mots est : $word_count"
    ```

    ```bash
    Explications :
    - echo $str | wc -w permet de compter le nombre de mots dans une chaîne en utilisant la commande wc.
    ```

Ces exercices couvrent diverses opérations sur les chaînes en bash, avec des explications détaillées pour chaque étape. Voulez-vous que je continue avec la prochaine catégorie ?