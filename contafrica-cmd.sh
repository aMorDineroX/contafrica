#!/bin/bash
# Script pour exécuter des commandes contafrica via Docker

# Vérifier si au moins une commande est fournie
if [ $# -eq 0 ]; then
    echo "Usage: $0 <commande-contafrica> [arguments]"
    echo "Exemple: $0 config:print"
    exit 1
fi

# Construire la commande avec tous les arguments
CMD="/app/contafrica --config /app/config/config.yml $@"

# Exécuter la commande dans le conteneur
docker exec -it contafrica sh -c "$CMD"
