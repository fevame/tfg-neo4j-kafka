// Eliminar todos los nodos y relaciones existentes
MATCH (n) DETACH DELETE n;

// Crear pacientes
MERGE (p1:Patient {id: '12345678A', name: 'Juan Pérez'})
MERGE (p2:Patient {id: '23456789B', name: 'María Gómez'})
MERGE (p3:Patient {id: '34567890C', name: 'Luis García'})

// Crear dispositivos
MERGE (d1:Device {id: 'd1', type: 'Thermometer', manufacturer: 'MedTech', serialNumber: 'SN1234', status: 'active'})
MERGE (d2:Device {id: 'd2', type: 'PulseOximeter', manufacturer: 'HealthCorp', serialNumber: 'SN5678', status: 'active'})

// Asignar dispositivos a pacientes
MERGE (d1)-[:ASSIGNED_TO]->(p1)
MERGE (d2)-[:ASSIGNED_TO]->(p2)

// Crear observaciones
MERGE (o1:Observation {id: 'o1', temperature: 38.5, timestamp: datetime()})
MERGE (o2:Observation {id: 'o2', temperature: 36.8, timestamp: datetime()})
MERGE (o3:Observation {id: 'o3', temperature: 39.2, timestamp: datetime()})

// Relacionar observaciones con pacientes y dispositivos
MERGE (p1)-[:HAS]->(o1)
MERGE (d1)-[:TAKES]->(o1)

MERGE (p2)-[:HAS]->(o2)
MERGE (d2)-[:TAKES]->(o2)

MERGE (p3)-[:HAS]->(o3)
MERGE (d2)-[:TAKES]->(o3)

// Encadenar observaciones cronológicamente
MERGE (o1)-[:NEXT]->(o2)
MERGE (o2)-[:NEXT]->(o3)

// Crear eventos técnicos
MERGE (te1:TechnicalEvent {id: 'te1', eventName: 'BatteryLow', eventStatus: 'critical', timestamp: datetime()})
MERGE (te2:TechnicalEvent {id: 'te2', eventName: 'SensorFailure', eventStatus: 'critical', timestamp: datetime()})

// Relacionar eventos con dispositivos
MERGE (d1)-[:GENERATES]->(te1)
MERGE (d2)-[:GENERATES]->(te2)
