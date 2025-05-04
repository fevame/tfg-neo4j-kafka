#!/bin/bash

# Nombres de los contenedores
CONTAINER1="neo4j-origin1"
CONTAINER2="neo4j-origin2"
USER="neo4j"
PASS="password"

echo "♻️ Limpiando y cargando datos en origin1..."
docker exec -i $CONTAINER1 cypher-shell -u $USER -p $PASS < ../neo4j-origin1/cypher-init/origin1.cypher

echo "♻️ Limpiando y cargando datos en origin2..."
docker exec -i $CONTAINER2 cypher-shell -u $USER -p $PASS < ../neo4j-origin2/cypher-init/origin2.cypher

echo "✅ Bases de datos rellenadas correctamente."

