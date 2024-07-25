---
title: base64
date: 2024-07-18
tags:
  - ressource
  - linux
  - programmes
status:
  - En cours
type de note:
  - ressource
---

# Documentation pour la commande `base64` sous Linux

## Table des matières
1. [Introduction](#introduction)
2. [Fonctionnement de la commande `base64`](#fonctionnement-de-la-commande-base64)
3. [Syntaxe de la commande `base64`](#syntaxe-de-la-commande-base64)
4. [Options de la commande `base64`](#options-de-la-commande-base64)
    - [Option `-d` (decode)](#option--d-decode)
    - [Option `-i` (ignore-garbage)](#option--i-ignore-garbage)
    - [Option `-w` (wrap)](#option--w-wrap)
5. [Exemples concrets](#exemples-concrets)
    - [Exemple 1 : Encoder un fichier en base64](#exemple-1--encoder-un-fichier-en-base64)
    - [Exemple 2 : Décoder un fichier base64](#exemple-2--décoder-un-fichier-base64)
    - [Exemple 3 : Encoder une chaîne de texte en base64](#exemple-3--encoder-une-chaîne-de-texte-en-base64)
    - [Exemple 4 : Décoder une chaîne base64](#exemple-4--décoder-une-chaîne-base64)
    - [Exemple 5 : Ignorer les caractères non base64 lors du décodage](#exemple-5--ignorer-les-caractères-non-base64-lors-du-décodage)
6. [Conclusion](#conclusion)

## Introduction

La commande `base64` sous Linux est utilisée pour encoder et décoder des données en base64. L'encodage base64 est couramment utilisé pour représenter des données binaires sous forme de texte ASCII, ce qui est utile pour le transfert de données sur des réseaux qui ne sont pas 8-bit propres, comme les emails.

## Fonctionnement de la commande `base64`

La commande `base64` lit les données d'un fichier ou de l'entrée standard et les encode en base64, ou bien elle décode des données encodées en base64. Le résultat est envoyé vers la sortie standard, ou peut être redirigé vers un fichier.

## Syntaxe de la commande `base64`

```bash
base64 [options] [fichier]
```

### Arguments

- `[fichier]` : Le chemin du fichier à encoder ou décoder. Si aucun fichier n'est spécifié, `base64` lit l'entrée standard.

## Options de la commande `base64`

### Option `-d` (decode)

Décode les données encodées en base64.

```bash
base64 -d [fichier]
```

### Option `-i` (ignore-garbage)

Ignore les caractères non base64 lors du décodage.

```bash
base64 -i [fichier]
```

### Option `-w` (wrap)

Enveloppe la sortie encodée en base64 à tous les `n` caractères (par défaut, 76). Utilisez `0` pour désactiver l'enveloppement.

```bash
base64 -w <n> [fichier]
```

## Exemples concrets

### Exemple 1 : Encoder un fichier en base64

Pour encoder le fichier `example.txt` en base64 :

```bash
base64 example.txt
```

**Sortie :**

```
U29tZSBleGFtcGxlIHRleHQgdG8gYmUgZW5jb2RlZCBpbiBiYXNlNjQu
```

### Exemple 2 : Décoder un fichier base64

Pour décoder le fichier `example.b64` encodé en base64 :

```bash
base64 -d example.b64
```

**Sortie :**

```
Some example text to be encoded in base64.
```

### Exemple 3 : Encoder une chaîne de texte en base64

Pour encoder une chaîne de texte `Hello, World!` en base64 :

```bash
echo -n "Hello, World!" | base64
```

**Sortie :**

```
SGVsbG8sIFdvcmxkIQ==
```

### Exemple 4 : Décoder une chaîne base64

Pour décoder une chaîne base64 `SGVsbG8sIFdvcmxkIQ==` :

```bash
echo "SGVsbG8sIFdvcmxkIQ==" | base64 -d
```

**Sortie :**

```
Hello, World!
```

### Exemple 5 : Ignorer les caractères non base64 lors du décodage

Pour décoder un fichier `example.b64` en ignorant les caractères non base64 :

```bash
base64 -di example.b64
```

**Explication :** Cette commande décode les données du fichier `example.b64` en ignorant les caractères non base64, ce qui peut être utile si le fichier contient des caractères parasites.

## Conclusion

La commande `base64` est un outil puissant pour encoder et décoder des données en base64 sous Linux. En utilisant ses différentes options, vous pouvez personnaliser l'encodage et le décodage des données selon vos besoins. Pour plus de détails, consultez les pages de manuel en utilisant la commande `man base64` ou la documentation officielle de votre distribution Linux.