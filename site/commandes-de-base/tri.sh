#!/bin/bash

# Création des dossiers pour les catégories
mkdir -p gestion_fichiers droits_permissions visualisation_fichiers gestion_utilisateurs_groupes gestion_processus reseau systeme utilitaires_divers

# Déplacement des fichiers dans les dossiers appropriés
mv gestion_fichiers/cut.md gestion_fichiers/df.md gestion_fichiers/dmesh.md gestion_fichiers/du.md gestion_fichiers/rm.md gestion_fichiers/sort.md gestion_fichiers/tree.md gestion_fichiers/tr.md gestion_fichiers/
mv droits_permissions/chown.md droits_permissions/mask.md groups.md droits_permissions/
mv visualisation_fichiers/cat.md visualisation_fichiers/grep.md visualisation_fichiers/head.md visualisation_fichiers/less.md visualisation_fichiers/
mv gestion_utilisateurs_groupes/adduser.md gestion_utilisateurs_groupes/deluser.md gestion_utilisateurs_groupes/gpasswd.md gestion_utilisateurs_groupes/groupadd.md gestion_utilisateurs_groupes/groupdel.md gestion_utilisateurs_groupes/id.md gestion_utilisateurs_groupes/su.md gestion_utilisateurs_groupes/useradd.md gestion_utilisateurs_groupes/usermod.md utilisateurs.md gestion_utilisateurs_groupes/
mv gestion_processus/journalctl.md gestion_processus/ps_aux.md gestion_processus/
mv reseau/hostnamectl.md reseau/hostname.md reseau/nmblookup.md reseau/
mv build-essential.md cron.md fstab.md mount.md mount_samba.md ntfs-3g.md path_scripts.md redirections.md debian_alt_click.md debian_ctrl_alt_fleche.md instal_debian.md systeme/
mv utilitaires_divers/find.md utilitaires_divers/lsof.md utils.md gestionnaire_de_paquets.md terminal_raccourci_clavier.md raccourcis.md utilitaires_divers/

# Suppression des dossiers vides
rmdir droits_permissions gestion_fichiers visualisation_fichiers gestion_utilisateurs_groupes gestion_processus reseau utilitaires_divers

echo "Organisation terminée."
