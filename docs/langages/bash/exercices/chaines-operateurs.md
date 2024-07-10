### Catégorie : Chaînes opérateurs

#### Exercice 1 : Opérateur de comparaison égale
=== "Problème 1"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche si elles sont égales.

=== "Réponse 1"

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
    - [ "$str1" == "$str2" ] compare deux chaînes pour vérifier si elles sont égales.
    ```

#### Exercice 2 : Opérateur de comparaison non égale
=== "Problème 2"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche si elles sont différentes.

=== "Réponse 2"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Comparer les chaînes
    if [ "$str1" != "$str2" ]; then
        echo "Les chaînes sont différentes."
    else
        echo "Les chaînes sont égales."
    fi
    ```

    ```bash
    Explications :
    - [ "$str1" != "$str2" ] compare deux chaînes pour vérifier si elles sont différentes.
    ```

#### Exercice 3 : Opérateur de comparaison plus grand
=== "Problème 3"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche laquelle est plus grande (lexicographiquement).

=== "Réponse 3"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Comparer les chaînes
    if [[ "$str1" > "$str2" ]]; then
        echo "\"$str1\" est plus grande que \"$str2\"."
    else
        echo "\"$str1\" n'est pas plus grande que \"$str2\"."
    fi
    ```

    ```bash
    Explications :
    - [[ "$str1" > "$str2" ]] compare deux chaînes lexicographiquement pour vérifier si la première est plus grande que la deuxième.
    ```

#### Exercice 4 : Opérateur de comparaison plus petit
=== "Problème 4"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche laquelle est plus petite (lexicographiquement).

=== "Réponse 4"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Comparer les chaînes
    if [[ "$str1" < "$str2" ]]; then
        echo "\"$str1\" est plus petite que \"$str2\"."
    else
        echo "\"$str1\" n'est pas plus petite que \"$str2\"."
    fi
    ```

    ```bash
    Explications :
    - [[ "$str1" < "$str2" ]] compare deux chaînes lexicographiquement pour vérifier si la première est plus petite que la deuxième.
    ```

#### Exercice 5 : Opérateur de concaténation
=== "Problème 5"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et affiche leur concaténation.

=== "Réponse 5"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Concaténer les chaînes
    concatenated="$str1$str2"

    # Afficher le résultat
    echo "La chaîne concaténée est : $concatenated"
    ```

    ```bash
    Explications :
    - La concaténation des chaînes se fait en utilisant "$str1$str2".
    ```

#### Exercice 6 : Opérateur de longueur
=== "Problème 6"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche sa longueur.

=== "Réponse 6"

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
    - ${#str} permet de calculer la longueur d'une chaîne.
    ```

#### Exercice 7 : Opérateur de sous-chaîne
=== "Problème 7"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et une sous-chaîne, et affiche si la sous-chaîne est présente dans la chaîne.

=== "Réponse 7"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne et une sous-chaîne
    echo "Entrez une chaîne :"
    read str
    echo "Entrez une sous-chaîne :"
    read substr

    # Vérifier si la sous-chaîne est présente
    if [[ "$str" == *"$substr"* ]]; then
        echo "La sous-chaîne \"$substr\" est présente dans \"$str\"."
    else
        echo "La sous-chaîne \"$substr\" n'est pas présente dans \"$str\"."
    fi
    ```

    ```bash
    Explications :
    - [[ "$str" == *"$substr"* ]] vérifie si une sous-chaîne est présente dans une chaîne.
    ```

#### Exercice 8 : Opérateur de remplacement
=== "Problème 8"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et deux sous-chaînes, et remplace la première sous-chaîne par la deuxième.

=== "Réponse 8"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne et deux sous-chaînes
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

#### Exercice 9 : Opérateur d'extraction
=== "Problème 9"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et deux indices, et extrait la sous-chaîne correspondante.

=== "Réponse 9"

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

#### Exercice 10 : Opérateur de conversion
=== "Problème 10"

    Écrivez un script bash qui demande à l'utilisateur de saisir une chaîne et affiche la chaîne en majuscules ou en minuscules selon le choix de l'utilisateur.

=== "Réponse 10"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une chaîne
    echo "Entrez une chaîne :"
    read str
    echo "Voulez-vous convertir en (M)ajuscules ou (m)inuscules ?"
    read choice

    # Convertir la chaîne
    if [ "$choice" == "M" ]; then
        result=$(echo $str | tr '[:lower:]' '[:upper:]')
    elif [ "$choice" == "m" ]; then
        result=$(echo $str | tr '[:upper:]' '[:lower:]')
    else
        echo "Choix invalide"
        exit 1
    fi

    # Afficher le résultat
    echo "La chaîne convertie est : $result"
    ```

