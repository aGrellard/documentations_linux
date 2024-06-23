# controler les pértes de mémoire a l"aide de Valgrind

```cpp
#include <iostream>
#include <cstring>

// Méthode pour copier une chaîne de caractères
const char* copyString(const char* src) {
  if (src) {
    size_t len = strlen(src) + 1;
    char* dest = new char[len];
    strcpy(dest, src);
    std::cout << "Allocated memory at: " << static_cast<void*>(dest) << " for string: " << dest << std::endl;
    return dest;
  }
  return nullptr;
}

// Méthode pour libérer une chaîne de caractères
void freeString(const char*& str) {
  if (str) {
    std::cout << "Freeing memory at: " << static_cast<void*>(const_cast<char*>(str)) << " for string: " << str << std::endl;
    delete[] str;
    str = nullptr;
  }
}

const char* uint8ToString(uint8_t value) {
  char buffer[4]; // 3 chiffres + /0
  snprintf(buffer, sizeof(buffer), "%d", value);
  return buffer;
}  

const char* intToString(int value) {
  char buffer[12]; // 
  snprintf(buffer, sizeof(buffer), "%d", value);
  return copyString(buffer);
}

class EffectControlUI {
private:
  const char* _controlName;
public:
  EffectControlUI(const char* name = "ctrl")
    : _controlName(copyString(name)) {}

  ~EffectControlUI() {
    freeString(_controlName);
  }

  operator std::string() const { return std::string(_controlName); }
};

int main() {
  int value = 112;
  const char* tempStr = intToString(value);
  EffectControlUI* effectControlUI = new EffectControlUI(tempStr);
	std::cout << "EffectControlUI: " << std::string(*effectControlUI) << std::endl;
  freeString(tempStr); // Libérer la mémoire allouée par intToString
  delete effectControlUI;
   
  return 0;
}
```

## Installation de Valgrind

```bash
sudo apt-get install valgrind
```

## Compilation et exécution du programme

```bash
g++ -g -o memory memory.cpp
```
- >-g = ajoute des informations de débogage au fichier exécutable
- >-o = spécifie le nom du fichier exécutable

```bash
valgrind --leak-check=full ./memory
```
- >--leak-check=full = affiche les détails de toutes les fuites de mémoire


