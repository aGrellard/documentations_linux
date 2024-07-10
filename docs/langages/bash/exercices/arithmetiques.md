### Catégorie : Arithmétiques

#### Exercice 1 : Addition de deux nombres
=== "Problème 1"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et affiche leur somme.

=== "Réponse 1"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Calculer la somme des deux nombres
    sum=$((num1 + num2))

    # Afficher le résultat
    echo "La somme est : $sum"
    ```

    ```bash
    Explications :
    - read capture les entrées utilisateur.
    - $((expression)) évalue une expression arithmétique.
    ```

#### Exercice 2 : Soustraction de deux nombres
=== "Problème 2"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et affiche leur différence.

=== "Réponse 2"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Calculer la différence des deux nombres
    diff=$((num1 - num2))

    # Afficher le résultat
    echo "La différence est : $diff"
    ```

    ```bash
    Explications :
    - read capture les entrées utilisateur.
    - $((expression)) évalue une expression arithmétique.
    ```

#### Exercice 3 : Multiplication de deux nombres
=== "Problème 3"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et affiche leur produit.

=== "Réponse 3"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Calculer le produit des deux nombres
    product=$((num1 * num2))

    # Afficher le résultat
    echo "Le produit est : $product"
    ```

    ```bash
    Explications :
    - read capture les entrées utilisateur.
    - $((expression)) évalue une expression arithmétique.
    ```

#### Exercice 4 : Division de deux nombres
=== "Problème 4"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et affiche leur quotient.

=== "Réponse 4"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Calculer le quotient des deux nombres
    quotient=$((num1 / num2))

    # Afficher le résultat
    echo "Le quotient est : $quotient"
    ```

    ```bash
    Explications :
    - read capture les entrées utilisateur.
    - $((expression)) évalue une expression arithmétique.
    - Assurez-vous que le deuxième nombre n'est pas zéro pour éviter une division par zéro.
    ```

#### Exercice 5 : Calcul du reste
=== "Problème 5"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et affiche le reste de leur division.

=== "Réponse 5"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez le premier nombre :"
    read num1
    echo "Entrez le deuxième nombre :"
    read num2

    # Calculer le reste de la division des deux nombres
    remainder=$((num1 % num2))

    # Afficher le résultat
    echo "Le reste de la division est : $remainder"
    ```

    ```bash
    Explications :
    - read capture les entrées utilisateur.
    - $((expression)) évalue une expression arithmétique.
    - % est l'opérateur de modulo.
    ```

#### Exercice 6 : Calcul de la puissance
=== "Problème 6"

    Écrivez un script bash qui demande à l'utilisateur de saisir deux nombres et affiche le premier nombre élevé à la puissance du deuxième nombre.

=== "Réponse 6"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir deux nombres
    echo "Entrez la base :"
    read base
    echo "Entrez l'exposant :"
    read exponent

    # Calculer la puissance
    result=$((base ** exponent))

    # Afficher le résultat
    echo "Le résultat est : $result"
    ```

    ```bash
    Explications :
    - ** est l'opérateur de puissance en bash.
    ```

#### Exercice 7 : Calcul de la racine carrée
=== "Problème 7"

    Écrivez un script bash qui demande à l'utilisateur de saisir un nombre et affiche sa racine carrée.

=== "Réponse 7"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir un nombre
    echo "Entrez un nombre :"
    read num

    # Calculer la racine carrée en utilisant bc pour les calculs avec virgule
    sqrt=$(echo "scale=2; sqrt($num)" | bc)

    # Afficher le résultat
    echo "La racine carrée est : $sqrt"
    ```

    ```bash
    Explications :
    - bc est une calculatrice en ligne de commande pour les calculs avec virgule.
    - scale=2 définit la précision des décimales.
    ```

#### Exercice 8 : Calcul de la factorielle
=== "Problème 8"

    Écrivez un script bash qui demande à l'utilisateur de saisir un nombre et affiche sa factorielle.

=== "Réponse 8"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir un nombre
    echo "Entrez un nombre :"
    read num

    # Initialiser la factorielle
    factorial=1

    # Calculer la factorielle
    for (( i=1; i<=num; i++ ))
    do
      factorial=$((factorial * i))
    done

    # Afficher le résultat
    echo "La factorielle est : $factorial"
    ```

    ```bash
    Explications :
    - Une boucle for calcule la factorielle en multipliant les nombres de 1 à num.
    ```

#### Exercice 9 : Conversion Celsius en Fahrenheit
=== "Problème 9"

    Écrivez un script bash qui demande à l'utilisateur de saisir une température en Celsius et affiche la conversion en Fahrenheit.

=== "Réponse 9"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir une température en Celsius
    echo "Entrez la température en Celsius :"
    read celsius

    # Convertir en Fahrenheit
    fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)

    # Afficher le résultat
    echo "La température en Fahrenheit est : $fahrenheit"
    ```

    ```bash
    Explications :
    - La conversion se fait en multipliant par 9/5 et en ajoutant 32.
    - bc est utilisé pour les calculs avec virgule.
    ```

#### Exercice 10 : Calcul de l'aire d'un cercle
=== "Problème 10"

    Écrivez un script bash qui demande à l'utilisateur de saisir le rayon d'un cercle et affiche l'aire du cercle.

=== "Réponse 10"

    ```bash
    #!/bin/bash
    # Demander à l'utilisateur de saisir le rayon
    echo "Entrez le rayon du cercle :"
    read radius

    # Calculer l'aire du cercle
    area=$(echo "scale=2; 3.14159 * $radius * $radius" | bc)

    # Afficher le résultat
    echo "L'aire du cercle est : $area"
    ```

    ```bash
    Explications :
    - L'aire d'un cercle est calculée avec la formule π r^2.
    - bc est utilisé pour les calculs avec virgule.
    ```
