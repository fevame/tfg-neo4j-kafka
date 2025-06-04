#!/bin/bash

# Lista de conectores a eliminar
connectors=(
    "Neo4jSourceConnectorOrigin1_Observations"
    "Neo4jSourceConnectorOrigin1_TechnicalEvents"
    "Neo4jSourceConnectorOrigin2_Observations"
    "Neo4jSourceConnectorOrigin2_TechnicalEvents"
    "Neo4jSinkConnectorTechnicalEvents"
    "Neo4jSinkConnectorObservations"
)

# Eliminar conectores existentes si los hay
for connector in "${connectors[@]}"; do
    echo "🗑️  Eliminando connector $connector si existe..."
    curl -s -o /dev/null -X DELETE "http://localhost:8083/connectors/$connector"
    sleep 1
done

# Registrar conectores source para Origin1
echo "🚀 Registrando Neo4jSourceConnectorOrigin1_Observations..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-origin1/source-connector-obs.json http://localhost:8083/connectors

echo "🚀 Registrando Neo4jSourceConnectorOrigin1_TechnicalEvents..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-origin1/source-connector-tech.json http://localhost:8083/connectors

# Registrar conectores source para Origin2
echo "🚀 Registrando Neo4jSourceConnectorOrigin2_Observations..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-origin2/source-connector-obs.json http://localhost:8083/connectors

echo "🚀 Registrando Neo4jSourceConnectorOrigin2_TechnicalEvents..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-origin2/source-connector-tech.json http://localhost:8083/connectors

# Registrar sinks
echo "🚀 Registrando Neo4jSinkConnectorTechnicalEvents..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-dest-tech/sink-connector.json http://localhost:8083/connectors

echo "🚀 Registrando Neo4jSinkConnectorObservations..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-dest-obs/sink-connector.json http://localhost:8083/connectors

echo "✅ Todos los connectores cargados correctamente."
