#!/bin/bash

# Définir les chemins de base
BASE_DIR="/home/adrien/Documents/_I0_DOCU_EXT/mk-docs/documentations_linux/docs"
COMMANDES_DIR="$BASE_DIR/commandes-de-base"

# Créer la nouvelle structure de dossiers
mkdir -p $COMMANDES_DIR/editeurs_gestionnaires_fichiers
mkdir -p $COMMANDES_DIR/gestion_processus
mkdir -p $COMMANDES_DIR/gestion_utilisateurs_groupes
mkdir -p $COMMANDES_DIR/gestion_systeme
mkdir -p $COMMANDES_DIR/gestionnaires_paquets_outils_divers
mkdir -p $COMMANDES_DIR/machines_virtuelles_conteneurs
mkdir -p $COMMANDES_DIR/navigateurs_web
mkdir -p $COMMANDES_DIR/reseau
mkdir -p $COMMANDES_DIR/systeme
mkdir -p $COMMANDES_DIR/terminal_gestionnaires_fenetres
mkdir -p $COMMANDES_DIR/utilitaires_divers
mkdir -p $COMMANDES_DIR/utilitaires_reseau
mkdir -p $COMMANDES_DIR/visualisation_fichiers

# Déplacer les fichiers dans la nouvelle structure
mv $COMMANDES_DIR/droits_permissions/chown.md $COMMANDES_DIR/droits_permissions/
mv $COMMANDES_DIR/droits_permissions/groups.md $COMMANDES_DIR/droits_permissions/
mv $COMMANDES_DIR/droits_permissions/mask.md $COMMANDES_DIR/droits_permissions/

mv $COMMANDES_DIR/editeurs_gestionnaires_fichiers/* $COMMANDES_DIR/editeurs_gestionnaires_fichiers/

mv $COMMANDES_DIR/gestion_fichiers/* $COMMANDES_DIR/gestion_fichiers/

mv $COMMANDES_DIR/gestionnaires_paquets_outils_divers/network-manager_install.md $COMMANDES_DIR/gestionnaires_paquets_outils_divers/
mv $COMMANDES_DIR/gestionnaires_paquets_outils_divers/vite.md $COMMANDES_DIR/gestionnaires_paquets_outils_divers/

mv $COMMANDES_DIR/gestion_processus/journalctl.md $COMMANDES_DIR/gestion_processus/
mv $COMMANDES_DIR/gestion_processus/ps_aux.md $COMMANDES_DIR/gestion_processus/

mv $COMMANDES_DIR/gestion_systeme/dejadup.md $COMMANDES_DIR/gestion_systeme/
mv $COMMANDES_DIR/gestion_systeme/fail2ban.md $COMMANDES_DIR/gestion_systeme/
mv $COMMANDES_DIR/gestion_systeme/gparted.md $COMMANDES_DIR/gestion_systeme/
mv $COMMANDES_DIR/gestion_systeme/nmon.md $COMMANDES_DIR/gestion_systeme/

mv $COMMANDES_DIR/gestion_utilisateurs_groupes/* $COMMANDES_DIR/gestion_utilisateurs_groupes/

mv $COMMANDES_DIR/gestionnaires_paquets_outils_divers/* $COMMANDES_DIR/gestionnaires_paquets_outils_divers/

mv $COMMANDES_DIR/index.md $COMMANDES_DIR/

mv $COMMANDES_DIR/machines_virtuelles_conteneurs/virtualbux_dossierPartager.md $COMMANDES_DIR/machines_virtuelles_conteneurs/

mv $COMMANDES_DIR/navigateurs_web/lynx.md $COMMANDES_DIR/navigateurs_web/

mv $COMMANDES_DIR/reseau/curl.md $COMMANDES_DIR/reseau/
mv $COMMANDES_DIR/reseau/hostnamectl.md $COMMANDES_DIR/reseau/
mv $COMMANDES_DIR/reseau/hostname.md $COMMANDES_DIR/reseau/
mv $COMMANDES_DIR/reseau/nmblookup.md $COMMANDES_DIR/reseau/
mv $COMMANDES_DIR/reseau/rsync.md $COMMANDES_DIR/reseau/
mv $COMMANDES_DIR/reseau/scp.md $COMMANDES_DIR/reseau/
mv $COMMANDES_DIR/reseau/wget.md $COMMANDES_DIR/reseau/

mv $COMMANDES_DIR/systeme/* $COMMANDES_DIR/systeme/

mv $COMMANDES_DIR/terminal_gestionnaires_fenetres/* $COMMANDES_DIR/terminal_gestionnaires_fenetres/

mv $COMMANDES_DIR/tri.sh $COMMANDES_DIR/

mv $COMMANDES_DIR/utilitaires_divers/* $COMMANDES_DIR/utilitaires_divers/

mv $COMMANDES_DIR/utilitaires_reseau/* $COMMANDES_DIR/utilitaires_reseau/

mv $COMMANDES_DIR/visualisation_fichiers/* $COMMANDES_DIR/visualisation_fichiers/

echo "Réorganisation terminée."
