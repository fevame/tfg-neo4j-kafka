#!/bin/bash

connectors=("Neo4jSourceConnectorOrigin1" "Neo4jSourceConnectorOrigin2" "Neo4jSinkConnectorTechnicalEvents" "Neo4jSinkConnectorObservations")

for connector in "${connectors[@]}"; do
    echo "🗑️  Eliminando connector $connector si existe..."
    curl -X DELETE http://localhost:8083/connectors/$connector
    sleep 2
done

echo "🚀 Registrando Neo4jSourceConnectorOrigin1..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-origin1/source-connector.json http://localhost:8083/connectors

echo "🚀 Registrando Neo4jSourceConnectorOrigin2..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-origin2/source-connector.json http://localhost:8083/connectors

echo "🚀 Registrando Neo4jSinkConnectorTechnicalEvents..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-dest-tech/sink-connector.json http://localhost:8083/connectors

echo "🚀 Registrando Neo4jSinkConnectorObservations..."
curl -X POST -H "Content-Type: application/json" --data @neo4j-dest-obs/sink-connector.json http://localhost:8083/connectors

echo "✅ Todos los connectors cargados."

