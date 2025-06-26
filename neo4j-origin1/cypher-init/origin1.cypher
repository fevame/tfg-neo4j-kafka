// Eliminar todos los nodos y relaciones existentes
MATCH (n) DETACH DELETE n;

// Crear pacientes
MERGE (p1:Patient {id: '12345678A', name: 'Juan Pérez'})
MERGE (p2:Patient {id: '23456789B', name: 'María Gómez'})
MERGE (p3:Patient {id: '34567890C', name: 'Luis García'})

// Crear dispositivos
MERGE (d1:Device {id: 'd1', type: 'Thermometer', manufacturer: 'MedTech', serialNumber: 'SN1234', status: 'active'})
MERGE (d2:Device {id: 'd2', type: 'PulseOximeter', manufacturer: 'HealthCorp', serialNumber: 'SN5678', status: 'active'})
MERGE (d3:Device {id: 'd3', type: 'ECG', manufacturer: 'CardioPlus', serialNumber: 'SN9012', status: 'active'})

// Asignar dispositivos a pacientes
MERGE (d1)-[:ASSIGNED_TO]->(p1)
MERGE (d2)-[:ASSIGNED_TO]->(p2)
MERGE (d3)-[:ASSIGNED_TO]->(p3)

// Crear observaciones
MERGE (o1:Observation {id: 'o1', temperature: 38.2, timestamp: datetime()})
MERGE (o2:Observation {id: 'o2', temperature: 38.7, timestamp: datetime()})
MERGE (o3:Observation {id: 'o3', temperature: 36.5, timestamp: datetime()})
MERGE (o4:Observation {id: 'o4', temperature: 36.3, timestamp: datetime()})
MERGE (o5:Observation {id: 'o5', temperature: 39.6, timestamp: datetime()})
MERGE (o6:Observation {id: 'o6', temperature: 39.9, timestamp: datetime()})

// Relacionar observaciones con pacientes y dispositivos
MERGE (p1)-[:HAS]->(o1)
MERGE (p1)-[:HAS]->(o2)
MERGE (d1)-[:TAKES]->(o1)
MERGE (d1)-[:TAKES]->(o2)

MERGE (p2)-[:HAS]->(o3)
MERGE (p2)-[:HAS]->(o4)
MERGE (d2)-[:TAKES]->(o3)
MERGE (d2)-[:TAKES]->(o4)

MERGE (p3)-[:HAS]->(o5)
MERGE (p3)-[:HAS]->(o6)
MERGE (d3)-[:TAKES]->(o5)
MERGE (d3)-[:TAKES]->(o6)

// Encadenar observaciones cronológicamente por dispositivo
MERGE (o1)-[:NEXT]->(o2)
MERGE (o3)-[:NEXT]->(o4)
MERGE (o5)-[:NEXT]->(o6)

// Crear eventos técnicos
MERGE (te1:TechnicalEvent {id: 'te1', eventName: 'BatteryLow', eventStatus: 'critical', timestamp: datetime()})
MERGE (te2:TechnicalEvent {id: 'te2', eventName: 'SensorFailure', eventStatus: 'warning', timestamp: datetime()})

// Relacionar eventos con dispositivos
MERGE (d1)-[:GENERATES]->(te1)
MERGE (d2)-[:GENERATES]->(te2)
