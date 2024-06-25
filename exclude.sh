for dir in $(find . -type d \( -name "*_A2_atrier*" -o -name "*_A*" \)); do
  # Vérifier si le dossier est suivi par Git
  if git ls-files --error-unmatch "$dir" > /dev/null 2>&1; then
    git rm -r --cached "$dir"
  fi
done
