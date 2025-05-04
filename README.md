## 🔧 Componentes principales

- **Neo4j Origin 1 & 2:** Bases de datos de origen que publican eventos (observaciones y eventos técnicos) en Kafka.
- **Neo4j Destination Tech & Obs:** Bases de datos de destino que reciben y almacenan la información desde Kafka.
- **Kafka:** Plataforma de intermediación para capturar y transmitir eventos entre orígenes y destinos.
- **Docker Compose:** Orquestador de los contenedores para facilitar el despliegue.
- **Scripts:** Automatizan la carga de datos y la configuración de Kafka Connect (Sources y Sinks).
- **Cypher Init:** Consultas Cypher para inicializar las bases de datos de origen.

## 🚀 Objetivos del proyecto

✅ Montar 2 contenedores Docker con Neo4j como publicadores (orígenes).  
✅ Montar 2 contenedores Docker con Neo4j como suscriptores (destinos).  
✅ Configurar un contenedor Kafka completo (broker, zookeeper, schema registry, connect, control center).  
✅ Publicar automáticamente observaciones y eventos técnicos en Kafka desde los orígenes.  
✅ Consumir los eventos en las BDs de destino usando Kafka Connect.  
✅ Automatizar la carga de datos y la configuración de los conectores.  

## 📚 Guía de instalación

Consulta el archivo [`guia-instalacion.md`](guia-instalacion.md) para desplegar el entorno y usar los scripts incluidos.

## 📄 Licencia

Este proyecto se entrega como parte de mi TFG. Puede ser usado, modificado y mejorado por futuros estudiantes.
