- [Commande `read` en Bash](#commande-read-en-bash)
  - [Syntaxe de Base](#syntaxe-de-base)
  - [Options Communes](#options-communes)
  - [Exemples d'Utilisation](#exemples-dutilisation)
  - [Conclusion](#conclusion)


# Commande `read` en Bash


La commande `read` en Bash est une commande intégrée qui permet de lire une ligne d'entrée standard (stdin) ou d'un fichier. Elle est souvent utilisée dans les scripts shell pour capturer l'input utilisateur. Voici une documentation détaillée sur son utilisation :

## Syntaxe de Base

```bash
read [options] variable1 variable2 ...
```

- `options` : Options de la commande `read` (décrites ci-dessous).
- `variable1 variable2 ...` : Noms des variables dans lesquelles les valeurs lues seront stockées. Si plusieurs variables sont fournies, `read` divisera la ligne d'entrée en fonction de l'IFS (Internal Field Separator, par défaut un espace) et assignera chaque partie à une variable. Si l'entrée contient moins de champs que de variables, les variables restantes ne seront pas définies. Si l'entrée contient plus de champs que de variables, la dernière variable listée capturera tout le reste de la ligne.

## Options Communes

- `-p` : Permet de spécifier un prompt qui sera affiché à l'utilisateur. 
  Exemple : `read -p "Entrez votre nom : " nom`
- `-s` : Mode silencieux. Les caractères tapés par l'utilisateur ne sont pas affichés, utile pour la saisie de mot de passe.
- `-r` : Empêche l'interprétation du caractère d'échappement `\`. Sans cette option, un `\` suivi d'un retour à la ligne serait traité comme une continuation de ligne.
- `-t` : Spécifie un délai d'attente en secondes. Si l'utilisateur ne fournit pas d'entrée dans le temps imparti, `read` se termine avec un échec.
- `-a` : Lit une ligne d'entrée dans un tableau. Les mots sont divisés selon l'IFS et assignés à des index consécutifs du tableau commençant à zéro.
- `-n` : Limite l'entrée à un certain nombre de caractères.
- `-d` : Définit le caractère de fin d'entrée (le caractère de nouvelle ligne est le défaut).

## Exemples d'Utilisation

**Lecture simple d'une variable :**

```bash
read nom
echo "Bonjour, $nom !"
```

**Utilisation d'un prompt et lecture silencieuse pour un mot de passe :**

```bash
read -sp "Entrez votre mot de passe : " mot_de_passe
echo -e "\nMot de passe enregistré."
```

**Lecture avec un délai d'attente :**

```bash
if read -t 5 -p "Entrez votre nom dans les 5 secondes : " nom; then
    echo "Bonjour, $nom !"
else
    echo "Temps écoulé !"
fi
```

**Lecture d'un tableau :**

```bash
echo "Entrez trois mots séparés par des espaces."
read -ra mots
echo "Premier mot : ${mots[0]}, deuxième mot : ${mots[1]}, troisième mot : ${mots[2]}"
```

**Lecture d'une ligne jusqu'à un caractère spécifique :**

```bash
read -d ":" -p "Entrez une phrase se terminant par ':' " phrase
echo "Vous avez saisi : $phrase"
```

## Conclusion

La commande `read` est un outil puissant pour la saisie interactive dans les scripts Bash. En utilisant ses nombreuses options, vous pouvez personnaliser la manière dont l'input est capturé, rendant vos scripts plus interactifs et conviviaux pour l'utilisateur.