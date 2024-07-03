### Catégorie : Conditions composites

#### Exercice 1 : Vérification de deux conditions
=== "Problème 1"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et vérifie s'ils sont tous les deux positifs.

=== "Réponse 1"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Vérifier si les deux nombres sont positifs
    if [ $num1 -gt 0 ] && [ $num2 -gt 0 ]; then
        echo "Les deux nombres sont positifs."
    else
        echo "L'un des nombres ou les deux ne sont pas positifs."
    fi
    ```

    ```bash
    Explications :
    - [ $num1 -gt 0 ] && [ $num2 -gt 0 ] vérifie que les deux nombres sont supérieurs à zéro.
    ```

#### Exercice 2 : Vérification d'une condition ou une autre
=== "Problème 2"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et vérifie si l'un ou l'autre est positif.

=== "Réponse 2"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Vérifier si l'un des deux nombres est positif
    if [ $num1 -gt 0 ] || [ $num2 -gt 0 ]; then
        echo "Au moins un des deux nombres est positif."
    else
        echo "Aucun des deux nombres n'est positif."
    fi
    ```

    ```bash
    Explications :
    - [ $num1 -gt 0 ] || [ $num2 -gt 0 ] vérifie que l'un des deux nombres est supérieur à zéro.
    ```

#### Exercice 3 : Vérification de deux chaînes non vides
=== "Problème 3"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et vérifie si elles sont toutes les deux non vides.

=== "Réponse 3"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Vérifier si les deux chaînes sont non vides
    if [ -n "$str1" ] && [ -n "$str2" ]; then
        echo "Les deux chaînes sont non vides."
    else
        echo "L'une des chaînes ou les deux sont vides."
    fi
    ```

    ```bash
    Explications :
    - [ -n "$str1" ] && [ -n "$str2" ] vérifie que les deux chaînes ne sont pas vides.
    ```

#### Exercice 4 : Vérification de l'une des deux chaînes non vide
=== "Problème 4"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux chaînes et vérifie si l'une ou l'autre est non vide.

=== "Réponse 4"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux chaînes
    echo "Entrez la première chaîne :"
    read str1
    echo "Entrez la deuxième chaîne :"
    read str2

    # Vérifier si l'une des deux chaînes est non vide
    if [ -n "$str1" ] || [ -n "$str2" ]; then
        echo "Au moins une des chaînes est non vide."
    else
        echo "Les deux chaînes sont vides."
    fi
    ```

    ```bash
    Explications :
    - [ -n "$str1" ] || [ -n "$str2" ] vérifie que l'une des deux chaînes n'est pas vide.
    ```

#### Exercice 5 : Combinaison de conditions numériques et de chaînes
=== "Problème 5"

    Écrivez un script bash qui demande à l'utilisateur de saisir un nombre et une chaîne, et vérifie si le nombre est positif et la chaîne non vide.

=== "Réponse 5"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir un nombre et une chaîne
    echo "Entrez un nombre :"
    read num
    echo "Entrez une chaîne :"
    read str

    # Vérifier si le nombre est positif et la chaîne est non vide
    if [ $num -gt 0 ] && [ -n "$str" ]; then
        echo "Le nombre est positif et la chaîne est non vide."
    else
        echo "Le nombre n'est pas positif ou la chaîne est vide."
    fi
    ```

    ```bash
    Explications :
    - [ $num -gt 0 ] vérifie que le nombre est supérieur à zéro.
    - [ -n "$str" ] vérifie que la chaîne n'est pas vide.
    ```

### Catégorie : Conditions composites

#### Exercice 6 : Vérification de multiples conditions
=== "Problème 6"

    Écrivez un script bash qui demande à l'utilisateur de saisir trois nombres et vérifie s'ils sont tous positifs.

=== "Réponse 6"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir trois nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2
    echo "Entrez le troisième nombre :"
    read num3

    # Vérifier si les trois nombres sont positifs
    if [ $num1 -gt 0 ] && [ $num2 -gt 0 ] && [ $num3 -gt 0 ]; then
        echo "Les trois nombres sont positifs."
    else
        echo "L'un des nombres ou plus ne sont pas positifs."
    fi
    ```

    ```bash
    Explications :
    - [ $num1 -gt 0 ] && [ $num2 -gt 0 ] && [ $num3 -gt 0 ] vérifie que les trois nombres sont supérieurs à zéro.
    ```

#### Exercice 7 : Combinaison de conditions composites
=== "Problème 7"

    Écrivez un script bash qui demande à l'utilisateur de saisir trois nombres et vérifie si au moins deux d'entre eux sont positifs.

=== "Réponse 7"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir trois nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2
    echo "Entrez le troisième nombre :"
    read num3

    # Vérifier si au moins deux des trois nombres sont positifs
    if ([ $num1 -gt 0 ] && [ $num2 -gt 0 ]) || ([ $num1 -gt 0 ] && [ $num3 -gt 0 ]) || ([ $num2 -gt 0 ] && [ $num3 -gt 0 ]); then
        echo "Au moins deux des trois nombres sont positifs."
    else
        echo "Moins de deux nombres sont positifs."
    fi
    ```

    ```bash
    Explications :
    - L'utilisation des combinaisons de conditions dans if permet de vérifier si au moins deux des trois nombres sont positifs.
    ```

#### Exercice 8 : Vérification de conditions opposées
=== "Problème 8"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et vérifie si l'un est positif et l'autre est négatif.

=== "Réponse 8"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Vérifier si l'un des nombres est positif et l'autre est négatif
    if ([ $num1 -gt 0 ] && [ $num2 -lt 0 ]) || ([ $num1 -lt 0 ] && [ $num2 -gt 0 ]); then
        echo "L'un des nombres est positif et l'autre est négatif."
    else
        echo "Les deux nombres ne sont pas opposés en signes."
    fi
    ```

    ```bash
    Explications :
    - La combinaison des conditions avec || permet de vérifier si l'un des nombres est positif et l'autre est négatif.
    ```

#### Exercice 9 : Conditions imbriquées
=== "Problème 9"

    Écrivez un script bash qui demande à l'utilisateur de saisir un nombre et vérifie s'il est positif, et s'il est pair ou impair.

=== "Réponse 9"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir un nombre
    echo "Entrez un nombre :"
    read num

    # Vérifier si le nombre est positif
    if [ $num -gt 0 ]; then
        # Vérifier si le nombre est pair ou impair
        if [ $((num % 2)) -eq 0 ]; then
            echo "Le nombre est positif et pair."
        else
            echo "Le nombre est positif et impair."
        fi
    else
        echo "Le nombre n'est pas positif."
    fi
    ```

    ```bash
    Explications :
    - La condition imbriquée permet de vérifier d'abord si le nombre est positif, puis de vérifier s'il est pair ou impair.
    ```

#### Exercice 10 : Combinaison de conditions imbriquées et composites
=== "Problème 10"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et une chaîne, et vérifie si les deux nombres sont positifs et si la chaîne est non vide.

=== "Réponse 10"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres et une chaîne
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2
    echo "Entrez une chaîne :"
    read str

    # Vérifier si les deux nombres sont positifs
    if [ $num1 -gt 0 ] && [ $num2 -gt 0 ]; then
        # Vérifier si la chaîne est non vide
        if [ -n "$str" ]; then
            echo "Les deux nombres sont positifs et la chaîne est non vide."
        else
            echo "Les deux nombres sont positifs mais la chaîne est vide."
        fi
    else
        echo "L'un des nombres ou les deux ne sont pas positifs."
    fi
    ```

    ```bash
    Explications :
    - La condition imbriquée vérifie d'abord si les deux nombres sont positifs, puis si la chaîne est non vide.
    ```
