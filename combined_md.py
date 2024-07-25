import os

# Dossier de base
BASE_DIR = "/home/adrien/Documents/_I0_DOCU_EXT/mk-docs/documentations_linux/docs/commandes-de-base"
COMBINED_DIR = os.path.join(BASE_DIR, "combiner")
COMBINED_FILE_PATH = os.path.join(COMBINED_DIR, "combined_all.md")

# Créer le dossier 'combiner' s'il n'existe pas
os.makedirs(COMBINED_DIR, exist_ok=True)

# Ouvrir le fichier combiné en mode écriture
with open(COMBINED_FILE_PATH, 'w') as combined_file:
    # Parcourir chaque sous-dossier et fichier du dossier de base
    for root, dirs, files in os.walk(BASE_DIR):
        for file in files:
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                # Ajouter une séparation et la métadonnée du fichier inclus
                combined_file.write(f"\n\n---\n\n<!-- File: {file} -->\n\n")
                with open(file_path, 'r') as md_file:
                    combined_file.write(md_file.read())

print(f"Tous les fichiers Markdown ont été combinés dans le fichier {COMBINED_FILE_PATH}.")


