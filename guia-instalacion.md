# 📄 Guía de Instalación y Despliegue del Proyecto

Esta guía explica cómo desplegar y probar el entorno Docker que integra Neo4j y Kafka. Está pensada para ser fácilmente reutilizable para futuros proyectos.

---

## ✅ Requisitos previos

- Docker instalado  --> https://www.docker.com/products/docker-desktop/
- Git instalado  --> https://git-scm.com/downloads
- Conexión a internet

---

## 🚀 Despliegue del entorno

1. **Clona el repositorio:**
   
   ```bash
   git clone https://github.com/fevame/tfg-neo4j-kafka.git
   cd tfg-neo4j-kafka
   ```

2. **Arranca el entorno:**
   
   ```bash
   docker-compose up -d
   ```

3. **Carga los datos de prueba en Neo4j origen:**
   
   ```bash
   ./scripts/load_neo4j_data.sh
   ```

4. **Carga los conectores de Kafka Connect:**
   
   ```bash
   ./scripts/load_kafka_connectors.sh
   ```

---

## 📂 Estructura de carpetas

```
.
├── README.md
├── docker-compose.yml
├── guia-instalacion.md
├── neo4j-dest-obs
│   └── sink-connector.json
├── neo4j-dest-tech
│   └── sink-connector.json
├── neo4j-origin1
│   ├── cypher-init
│   │   └── origin1.cypher
│   └── source-connector.json
├── neo4j-origin2
│   ├── cypher-init
│   │   └── origin2.cypher
│   └── source-connector.json
├── plugins
│   └── neo4j-kafka-connect-5.1.7.jar
└── scripts
    ├── load_kafka_connectors.sh
    └── load_neo4j_data.sh
```

---

## 📄 Notas importantes

- Si necesitas reiniciar el proyecto por algún motivo, puedes hacer:
  
  ```bash
  docker-compose down -v
  ```

  Esto borrará también los volúmenes y los datos guardados.

- Si actualizas los `.cypher` o los conectores, vuelve a ejecutar los scripts correspondientes dejando la linea de eliminación para evitar errores.
- En caso de perder algún tipo de conexión, por ejemplo perder acceso a neo4j o al control center de Kafka, probar primero volver a ejecutar:

  ```bash
  docker-compose up -d
  ```

  