import os
import re

def find_links(content):
    links = re.findall(r'\[\[([^\|\]]+)\]\]|\[\[([^\|\]]+)\|([^\]]+)\]\]', content)
    return links

def convert_link(link, source_directory):
    if link[0]:  # Case [[File Name]]
        return f'[[{link[0]}]]', f'[{link[0]}]({source_directory}/{link[0]}.md)', f'{link[0]}.md'
    elif link[1] and link[2]:  # Case [[File Name|Displayed Text]]
        return f'[[{link[1]}|{link[2]}]]', f'[{link[2]}]({source_directory}/{link[1]}.md)', f'{link[1]}.md'
    return '', '', ''

# Paths of the directories
obsidian_paths = [
    "/home/adrien/Documents/_I0_DOCU_EXT/obsidiann/Linux/03_PROJET",
]
source_directory = "/home/adrien/Documents/_I0_DOCU_EXT/mk-docs/documentations_linux/docs/langages/bash/bash-docu"
target_directory = "/home/adrien/Documents/_I0_DOCU_EXT/mk-docs/documentations_linux/docs/"


# Retrieve the files in the source directory
source_files = []
for root, dirs, files in os.walk(source_directory):
    for file in files:
        filepath = os.path.join(root, file)
        if not os.path.islink(filepath):
            source_files.append(file)

# Search for links in Obsidian files and display matches
for obsidian_path in obsidian_paths:
    for root, dirs, files in os.walk(obsidian_path):
        for file in files:
            if file.endswith(".md"):
                filepath = os.path.join(root, file)
                with open(filepath, 'r') as f:
                    content = f.read()
                    links = find_links(content)
                    if links:
                        for link in links:
                            obsidian_link, mkdocs_link, filename = convert_link(link, source_directory)
                            if filename in source_files:
                                print(f"Correspondance trouvée :\nLien Obsidian : {obsidian_link}\nLien MkDocs : {mkdocs_link}\nChemin absolu du fichier source : {source_directory}/{filename}\nDans le fichier : {filepath}\n")
