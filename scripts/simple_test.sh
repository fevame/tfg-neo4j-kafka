#!/usr/bin/env bash

# Script para añadir paciente + dispositivo + observación y (opcionalmente) evento técnico

echo "📡 Seleccione la base de datos de destino:"
select db in "neo4j-origin1" "neo4j-origin2"; do
    case $REPLY in
        1) CONTAINER="neo4j-origin1"; break ;;
        2) CONTAINER="neo4j-origin2"; break ;;
        *) echo "❌ Opción no válida. Intente de nuevo." ;;
    esac
done

USER="neo4j"
PASS="password"

read -p "ID del nuevo paciente (ej. 12345678A): " pid
read -p "Nombre: " pname
read -p "Edad: " age
read -p "Género (male/female/other): " gender

read -p "ID del dispositivo: " did
read -p "Tipo de dispositivo: " dtype
read -p "Fabricante: " manufacturer
read -p "Número de serie: " serial
read -p "Estado del dispositivo (active/inactive): " status

read -p "ID de la observación: " oid
read -p "Valor medido: " value
TIMESTAMP=$(date -Iseconds)

echo "🚀 Insertando datos en $CONTAINER..."

# Crear paciente y dispositivo, relacionarlos
docker exec -i $CONTAINER cypher-shell -u $USER -p $PASS \
"MATCH (n) WHERE n.id = '$pid' OR n.id = '$did' OR n.id = '$oid' DETACH DELETE n;
 MERGE (p:Patient {id: '$pid', name: '$pname', age: $age, gender: '$gender'})
 MERGE (d:Device {id: '$did', type: '$dtype', manufacturer: '$manufacturer', serialNumber: '$serial', status: '$status'})
 MERGE (d)-[:ASSIGNED_TO]->(p)
 MERGE (o:Observation {id: '$oid', measuredValue: $value, timestamp: datetime()})
 MERGE (p)-[:HAS]->(o)
 MERGE (d)-[:TAKES]->(o)"

read -p "¿Desea añadir una incidencia técnica para este dispositivo? (s/n): " answer
if [[ "$answer" == "s" || "$answer" == "S" ]]; then
    read -p "ID del evento técnico: " eid
    read -p "Tipo de evento (ej. BatteryLow): " etype
    EVENT_TIMESTAMP=$(date -Iseconds)
    docker exec -i $CONTAINER cypher-shell -u $USER -p $PASS \
    "MERGE (e:TechnicalEvent {id: '$eid', eventName: '$etype', eventStatus: 'pending', timestamp: datetime()})
     WITH e MATCH (d:Device {id: '$did'}) MERGE (d)-[:GENERATES]->(e)"
    echo "✅ Incidencia '$etype' registrada para el dispositivo '$did'."
fi

echo "✅ Inserción completada."
