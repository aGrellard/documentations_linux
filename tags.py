import os
import yaml
from collections import defaultdict

docs_dir = "docs"
tags = defaultdict(list)

# Base URL pour générer les chemins corrects
base_url = "/documentations_linux/"

# Parcours des fichiers dans le répertoire docs
for root, dirs, files in os.walk(docs_dir):
    for file in files:
        if file.endswith(".md"):
            file_path = os.path.join(root, file)
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
                try:
                    # Extraction des métadonnées YAML
                    data = yaml.safe_load(content.split('---')[1])
                    if "tags" in data:
                        for tag in data["tags"]:
                            relative_path = os.path.relpath(file_path, docs_dir)
                            # Transformation du chemin en URL
                            url = base_url + relative_path.replace(os.path.sep, '/').replace(".md", "/")
                            tags[tag].append({
                                "title": data["title"],
                                "url": url
                            })
                except:
                    continue

# Génération du fichier tags.md
with open(os.path.join(docs_dir, "tags.md"), "w", encoding="utf-8") as f:
    f.write("# Tags\n\n")
    for tag, pages in tags.items():
        f.write(f"## <a id='{tag}'>{tag}</a>\n\n")
        for page in pages:
            f.write(f"- [{page['title']}]({page['url']})\n")
        f.write("\n")
