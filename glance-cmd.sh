#!/bin/bash
# Script pour exécuter des commandes glance via Docker

# Vérifier si au moins une commande est fournie
if [ $# -eq 0 ]; then
    echo "Usage: $0 <commande-glance> [arguments]"
    echo "Exemple: $0 config:print"
    exit 1
fi

# Construire la commande avec tous les arguments
CMD="/app/glance --config /app/config/glance.yml $@"

# Exécuter la commande dans le conteneur
docker exec -it glance sh -c "$CMD"
