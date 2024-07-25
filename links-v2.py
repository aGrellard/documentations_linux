import os
import re

def find_links(content):
    links = re.findall(r'\[\[([^\|\]]+)\]\]|\[\[([^\|\]]+)\|([^\]]+)\]\]', content)
    return links

def convert_link(link, relative_path):
    if link[0]:  # Case [[File Name]]
        return f'[[{link[0]}]]', f'[{link[0]}]({relative_path}/{link[0]}.md)', f'{link[0]}.md'
    elif link[1] and link[2]:  # Case [[File Name|Displayed Text]]
        return f'[[{link[1]}|{link[2]}]]', f'[{link[2]}]({relative_path}/{link[1]}.md)', f'{link[1]}.md'
    return '', '', ''

# Paths of the directories
obsidian_paths = [
    "/home/adrien/Documents/_I0_DOCU_EXT/obsidiann/Linux/03_PROJET",
]
source_directory = "/home/adrien/Documents/_I0_DOCU_EXT/mk-docs/documentations_linux/docs/langages/bash/bash-docu"
base_target_directory = "/home/adrien/Documents/_I0_DOCU_EXT/mk-docs/documentations_linux/docs"
target_directory = os.path.join(base_target_directory, "tuto_adri")

# Retrieve the files in the source directory
source_files = []
for root, dirs, files in os.walk(source_directory):
    for file in files:
        filepath = os.path.join(root, file)
        if not os.path.islink(filepath):
            source_files.append(file)

# Create the target directory if it doesn't exist
if not os.path.exists(target_directory):
    os.makedirs(target_directory)

# Copy the files from Obsidian paths to the target directory and replace links
for obsidian_path in obsidian_paths:
    for root, dirs, files in os.walk(obsidian_path):
        for file in files:
            if file.endswith(".md"):
                src_filepath = os.path.join(root, file)
                target_filepath = os.path.join(target_directory, os.path.relpath(src_filepath, obsidian_path))
                target_file_dir = os.path.dirname(target_filepath)
                if not os.path.exists(target_file_dir):
                    os.makedirs(target_file_dir)
                with open(src_filepath, 'r') as f:
                    content = f.read()
                links = find_links(content)
                for link in links:
                    # Calculate relative path from target file directory to source directory
                    relative_path = os.path.relpath(source_directory, target_file_dir)
                    # Adjust relative path if necessary
                    if relative_path.startswith("../docs/"):
                        relative_path = relative_path[len("../docs/"):]
                    obsidian_link, mkdocs_link, filename = convert_link(link, relative_path)
                    if filename in source_files:
                        content = content.replace(obsidian_link, mkdocs_link)
                        print(f"Fichier à modifier : {src_filepath}")
                        print(f"Lien Obsidian : {obsidian_link}")
                        print(f"Lien MkDocs : {mkdocs_link}")
                        print(f"Chemin absolu du fichier source : {source_directory}/{filename}\n")
                with open(target_filepath, 'w') as f:
                    f.write(content)
                print(f"Fichier copié et liens convertis : {target_filepath}")
