# TFG: Integración de Neo4j y Kafka con Docker

Este proyecto forma parte de mi Trabajo de Fin de Grado (TFG) y tiene como objetivo construir un entorno replicable de integración entre bases de datos Neo4j y Kafka usando contenedores Docker. El objetivo es que futuros estudiantes puedan usarlo como base para sus propios proyectos.

## 📦 Estructura del repositorio

📦 tfg-neo4j-kafka
├── docker-compose.yml
├── neo4j-origin1/
│   ├── cypher-init/
│   │   └── init.cypher
│   └── source-connector.json
├── neo4j-origin2/
│   ├── cypher-init/
│   │   └── init.cypher
│   └── source-connector.json
├── neo4j-dest-tech/
│   └── sink-connector.json
├── neo4j-dest-obs/
│   └── sink-connector.json
├── kafka/
│   └── configs.md
├── README.md
└── guia-instalacion.md


## 🔧 Componentes principales

- **Neo4j Origin 1 & 2:** Bases de datos de origen que publican eventos (observaciones y eventos técnicos) en Kafka.
- **Neo4j Destination Tech & Obs:** Bases de datos de destino que reciben y almacenan la información desde Kafka.
- **Kafka:** Sistema de mensajería para transmitir eventos entre orígenes y destinos.
- **Docker Compose:** Orquestador de los contenedores para facilitar el despliegue.

## 🚀 Objetivos del proyecto

✅ Montar 2 contenedores Docker con Neo4j preconfigurados como publicadores.  
✅ Montar 2 contenedores Docker con Neo4j preconfigurados como suscriptores.  
✅ Configurar un contenedor Kafka completo (broker, zookeeper, schema registry, connect, control center).  
✅ Publicar automáticamente observaciones y eventos técnicos en Kafka desde los orígenes.  
✅ Consumir los eventos en las BDs de destino usando Kafka Connect.  
✅ Documentar todo el proceso de instalación y configuración.

## 📚 Guía de instalación

Consulta el archivo [`guia-instalacion.md`](guia-instalacion.md) para desplegar el entorno en tu máquina.

## 📄 Licencia

Este proyecto se entrega como parte de mi TFG. Puede ser usado, modificado y mejorado por futuros estudiantes.

