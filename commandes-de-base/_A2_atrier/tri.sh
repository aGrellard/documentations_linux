#!/bin/bash

# Création des dossiers pour les catégories
mkdir -p gestion_fichiers droits_permissions visualisation_fichiers gestion_utilisateurs_groupes gestion_processus reseau utilitaires_divers

# Déplacement des fichiers dans les dossiers appropriés
mv cut.md df.md dmesh.md du.md rm.md sort.md tree.md tr.md gestion_fichiers/
mv droits/chown.md droits/mask.md droits_permissions/
mv fichiers_visualisation/cat.md fichiers_visualisation/grep.md fichiers_visualisation/head.md fichiers_visualisation/less.md visualisation_fichiers/
mv utilisateurs_groups/adduser.md utilisateurs_groups/deluser.md utilisateurs_groups/gpasswd.md utilisateurs_groups/groupadd.md utilisateurs_groups/groupdel.md utilisateurs_groups/id.md utilisateurs_groups/su.md utilisateurs_groups/useradd.md utilisateurs_groups/usermod.md gestion_utilisateurs_groupes/
mv processus/journalctl.md processus/ps_aux.md gestion_processus/
mv hostnamectl.md hostname.md nmblookup.md reseau/
mv find.md lsof.md utilitaires_divers/

# Suppression des dossiers vides
rmdir droits fichiers_visualisation processus utilisateurs_groups

echo "Organisation terminée."
