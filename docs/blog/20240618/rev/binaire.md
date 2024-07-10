# Révision

- [Révision](#révision)
  - [Binaire](#binaire)
  - [convertion](#convertion)
    - [1. convertion binaire en decimal](#1-convertion-binaire-en-decimal)
    - [2. convertion decimal en binaire](#2-convertion-decimal-en-binaire)
    - [2. convertion binaire en hexadécimal](#2-convertion-binaire-en-hexadécimal)
    - [3. convertion hexadécimal en binaire](#3-convertion-hexadécimal-en-binaire)
    - [4. convertion hexadécimal en decimal](#4-convertion-hexadécimal-en-decimal)
    - [5. convertion decimal en hexadécimal](#5-convertion-decimal-en-hexadécimal)
    - [6. opération binaire bit à bit](#6-opération-binaire-bit-à-bit)
    - [7. Les opérateurs d'affectation](#7-les-opérateurs-daffectation)
    - [8.  apllications de masque binaire](#8--apllications-de-masque-binaire)

## Binaire

- le systéme binaire est un systéme de numération de base 2
- la puissance de cette base est de 2
- chaque position d'un chiffre représente une puissance de 2
- la postion commence par 2^0 a l'extrémité droite

 Exemple:  
| **bits** | **valeure** 
|:---:|:---:|
| Premier bit (à droite) | représente 2^0 (valeur 1) 
| Deuxième bit | représente 2^1 (valeur 2)
| Troisième bit | représente 2^2 (valeur 4)
| Quatrième bit | représente 2^3 (valeur 8)

Et ainsi de suite...

## convertion 

### 1. convertion binaire en decimal
   - pour convertir un nombre binaire en décimal, il suffit de multiplier chaque chiffre binaire par 2 à la puissance de sa position et d'additionner les résultats
   - la position du chiffre binaire commence par 0 à l'extrémité droite
   - exemple: 1011
     - 1 * 2^3 + 0 * 2^2 + 1 * 2^1 + 1 * 2^0
     - 8 + 0 + 2 + 1 = 11
   - on peut aussi s'aider de la table de conversion
     - 1011 = 8 + 0 + 2 + 1 = 11
     - 1101 = 8 + 4 + 0 + 1 = 13
     - 1110 = 8 + 4 + 2 + 0 = 14
     - 1111 = 8 + 4 + 2 + 1 = 15
   - on peut aussi s'aider d'un tableau avec les puissances de 2
  
      | hex    | decimal | 32 768 | 16 384 | 8 192 | 4 096 | 2 048 | 1 024 | 512 | 256 | 128 | 64 | 32 | 16 | 8  | 4  | 2  | 1
      |:------:|:----+--:|:------:|:------:|:-----:|:-----:|:-----:|:-----:|:---:|:---:|:---:|:--:|:--:|:--:|:--:|:--:|:--:|:--|
      |D       |11       |0       |0       |0      |0      |0      |0      |0    |0    |0    |0   |0   |0   |1   |0   |1   |1

### 2. convertion decimal en binaire
   - pour convertir un nombre décimal en binaire, il suffit de diviser le nombre par 2 et de conserver le reste
   - on continue de diviser le quotient par 2 jusqu'à obtenir 0
   - on concatène les restes obtenus
   - exemple: 44
     - 44 / 2 = 22 reste 0
     - 22 / 2 = 11 reste 0
     - 11 / 2 = 5 reste 1
     - 5 / 2 = 2 reste 1
     - 2 / 2 = 1 reste 0
     - 1 / 2 = 0 reste 1
     - résultat: 101100
   - on peut aussi s'aider de la table de conversion
     - 44 = 32 + 8 + 4 = 101100
     - 13 = 8 + 4 + 1 = 1101
     - 14 = 8 + 4 + 2 = 1110
     - 15 = 8 + 4 + 2 + 1 = 1111
   - on peut aussi s'aider d'un tableau avec les puissances de 2
  
      | hex    | decimal | 32 768 | 16 384 | 8 192 | 4 096 | 2 048 | 1 024 | 512 | 256 | 128 | 64 | 32 | 16 | 8  | 4  | 2  | 1
      |:------:|:----+--:|:------:|:------:|:-----:|:-----:|:-----:|:-----:|:---:|:---:|:---:|:--:|:--:|:--:|:--:|:--:|:--:|:--|
      |2c      |44       |0       |0       |0      |0      |0      |0      |0    |0    |0    |0   |1   |0   |1   |1   |0   |0

### 2. convertion binaire en hexadécimal
   1. on divise le nombre binaire en groupe de 4 bits
   2. on convertit chaque groupe de 4 bits en hexadécimal
   3. on concatène les chiffres hexadécimaux obtenus
   4. pour le calculer on peut utiliser la table de conversion
   5. pour placer le nombre binaire on commence pour le LSB (Least Significant Bit) le bit le plus à droite
   6. exemple: 1011(2ème octet) 1101(1er octet)
 
      |8  |4  |2  |1  |8  |4  |2  |1  
      |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
      |128|64 |32 |16 |8  |4  |2  |1
      |1  |0  |1  |1  |1  |1  |0  |1  

   7. en base 16 (hexadécimal) on compte de 0 à 15
   8. 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A = 10, B = 11, C = 12, D = 13, E = 14, F = 15

      - 1 + 0 + 4 + 8 = 13 = D
      - 1 + 2 + 8 = 11 = B
      - résultat: 0xBD

### 3. convertion hexadécimal en binaire
   1. on convertit chaque chiffre hexadécimal en binaire
   2. on concatène les chiffres binaires obtenus
   3. exemple: 0x3D - 0x 3(2ème octet) D(1er octet)
      - 3 
      - D = 13
  
      |8  |4  |2  |1  |8  |4  |2  |1  
      |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
      |128|64 |32 |16 |8  |4  |2  |1
      |0  |0  |1  |0  |0  |0  |1  |1  
      |0  |0  |0  |0  |1  |1  |0  |1  

      - résultat: 
        - 0b11
        - 0b1101
  
### 4. convertion hexadécimal en decimal
   1. on convertit chaque chiffre hexadécimal en binaire
   2. on convertit le nombre binaire en décimal
   3. exemple: 0x3D
      - 3 = 0011
      - D = 1101
  
      |8  |4  |2  |1  |8  |4  |2  |1  
      |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
      |128|64 |32 |16 |8  |4  |2  |1
      |0  |0  |1  |1  |1  |1  |0  |1  
       
      - 1 + 4 + 8 + 16 + 32 = 61
  
### 5. convertion decimal en hexadécimal
### 6. opération binaire bit à bit
   1. AND
   2. OR
   3. XOR
   4. NOT
   5. décalage à gauche
   6. décalage à droite
### 7. Les opérateurs d'affectation
### 8.  apllications de masque binaire