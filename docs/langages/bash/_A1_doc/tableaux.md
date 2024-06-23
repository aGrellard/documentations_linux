- [Structures de Type Tableaux en Bash](#structures-de-type-tableaux-en-bash)
  - [Tableaux Indexés](#tableaux-indexés)
    - [Création d'un Tableau Indexé](#création-dun-tableau-indexé)
    - [Accès et Modification](#accès-et-modification)
    - [Ajout et Suppression d'Éléments](#ajout-et-suppression-déléments)
    - [Taille du Tableau et Itération](#taille-du-tableau-et-itération)
    - [Déclaration avec Expansion de Séquence](#déclaration-avec-expansion-de-séquence)
      - [Avantages et Limitations](#avantages-et-limitations)
    - [Déclaration avec Chaîne de Caractères](#déclaration-avec-chaîne-de-caractères)
  - [Tableaux Associatifs](#tableaux-associatifs)
    - [Déclaration](#déclaration)
    - [Accès, Modification, Ajout, et Suppression](#accès-modification-ajout-et-suppression)
    - [Itération sur les Clés et les Valeurs](#itération-sur-les-clés-et-les-valeurs)
  - [Opérations Avancées](#opérations-avancées)
    - [Sous-ensembles et Slicing](#sous-ensembles-et-slicing)
    - [Recherche et Filtre](#recherche-et-filtre)
    - [Longueur des Éléments](#longueur-des-éléments)
  - [Conclusion](#conclusion)


# Structures de Type Tableaux en Bash

Les tableaux en Bash permettent de regrouper plusieurs valeurs dans une seule structure, facilitant la gestion de listes de données. Bash supporte deux types de tableaux : les tableaux indexés et les tableaux associatifs. Ce guide explore la création, la manipulation et les opérations avancées sur ces structures de données.

## Tableaux Indexés

Les tableaux indexés utilisent des nombres entiers comme index pour accéder aux valeurs.

### Création d'un Tableau Indexé

Pour déclarer un tableau indexé, utilisez la syntaxe suivante :

```bash
mon_tableau=('premier' 'deuxième' 'troisième')
```

Ou en spécifiant les indices :

```bash
mon_tableau=([0]='premier' [1]='deuxième' [2]='troisième')
```

### Accès et Modification

Pour accéder à un élément du tableau, utilisez `${nom_du_tableau[indice]}`. Pour modifier un élément, affectez une nouvelle valeur à cet indice.

```bash
echo ${mon_tableau[0]}  # Affiche 'premier'
mon_tableau[0]='nouveau'
```

### Ajout et Suppression d'Éléments

Pour ajouter un élément, utilisez un indice non utilisé ou `+=` pour ajouter à la fin :

```bash
mon_tableau[3]='quatrième'
mon_tableau+=('cinquième')
```

Pour supprimer un élément :

```bash
unset mon_tableau[1]
```

### Taille du Tableau et Itération

La taille d'un tableau s'obtient avec `${#nom_du_tableau[@]}`. Pour itérer sur un tableau :

```bash
for i in "${mon_tableau[@]}"; do
  echo $i
done
```

### Déclaration avec Expansion de Séquence

Bash permet l'utilisation d'expansions de séquences pour initialiser des tableaux indexés. Cette fonctionnalité est particulièrement utile pour créer rapidement des séquences de nombres ou de lettres.

```bash
# Initialisation d'un tableau avec une expansion numérique
numeros=({1..10})

# Initialisation d'un tableau avec une expansion alphabétique
lettres=({a..e})
```

#### Avantages et Limitations

L'expansion de séquences offre une méthode concise pour créer des tableaux. Cependant, elle est limitée aux séquences continues et ordonnées. Pour les séquences personnalisées ou non linéaires, l'initialisation manuelle des tableaux ou l'utilisation de commandes pour générer des valeurs est nécessaire.

### Déclaration avec Chaîne de Caractères

Lorsque vous déclarez un tableau en assignant une chaîne de caractères avec des espaces, Bash interprète cette chaîne comme une série de mots séparés par des espaces et les assigne aux indices successifs du tableau.

```bash
# Création d'un tableau de nombres comme une chaîne de caractères
tab="un deux trois quatre cinq"
# Conversion de la chaîne en un tableau
nombres=($tab)
```
- Pour accéder au troisième élément (`trois`), vous feriez :

    ```bash
    echo ${tableau[2]}
    ```
- Pour itérer sur chaque élément du tableau :

    ```bash
    for element in "${tableau[@]}"; do
        echo $element
    done
    ```


## Tableaux Associatifs

Les tableaux associatifs utilisent des clés alphanumériques. Ils doivent être déclarés avec `declare -A`.

### Déclaration

```bash
declare -A mon_assoc
mon_assoc=([cle1]='valeur1' [cle2]='valeur2')
```

### Accès, Modification, Ajout, et Suppression

L'accès, la modification, l'ajout, et la suppression fonctionnent comme pour les tableaux indexés, mais avec des clés alphanumériques.

```bash
echo ${mon_assoc[cle1]}  # Accès
mon_assoc[cle1]='nouvelle valeur'  # Modification
mon_assoc[cle3]='valeur3'  # Ajout
unset mon_assoc[cle2]  # Suppression
```

### Itération sur les Clés et les Valeurs

Pour itérer sur les clés :

```bash
for cle in "${!mon_assoc[@]}"; do
  echo "$cle"
done
```

Pour itérer sur les valeurs :

```bash
for valeur in "${mon_assoc[@]}"; do
  echo "$valeur"
done
```

## Opérations Avancées

### Sous-ensembles et Slicing

Bash ne supporte pas directement le slicing comme dans certains langages de programmation, mais des sous-ensembles peuvent être extraits avec des boucles :

```bash
# Pour un tableau indexé
for (( i=0; i<3; i++ )); do
  echo "${mon_tableau[$i]}"
done
```

### Recherche et Filtre

La recherche et le filtrage nécessitent généralement des boucles et des instructions conditionnelles :

```bash
for val in "${mon_tableau[@]}"; do
  if [[ $val == *'part'* ]]; then
    echo "$val"
  fi
done
```

### Longueur des Éléments

Pour obtenir la longueur d'un élément spécifique :

```bash
echo "${#mon_tableau[0]}"  # Longueur du premier élément
```

## Conclusion

Les tableaux en Bash, qu'ils soient indexés ou associatifs, offrent une puissante manière de manipuler des collections de données. Bien que les tableaux en Bash ne soient pas aussi avancés que dans d'autres langages, avec une compréhension solide de leur fonctionnement et des techniques de manipulation, vous pouvez réaliser des scripts efficaces et élégants pour traiter des ensembles de données complexes.