// Eliminar todos los nodos y relaciones existentes
MATCH (n) DETACH DELETE n;

// Crear pacientes
MERGE (p4:Patient {id: '49547630T', name: 'Juan Pérez'})
MERGE (p5:Patient {id: '44247414A', name: 'María Gómez'})
MERGE (p6:Patient {id: '44442222F', name: 'Luis García'})

// Crear dispositivos
MERGE (d3:Device {id: 'd3', type: 'ECG', manufacturer: 'CardioTech', serialNumber: 'SN9101', status: 'active'})
MERGE (d4:Device {id: 'd4', type: 'InfusionPump', manufacturer: 'MediFlow', serialNumber: 'SN1121', status: 'inactive'})
MERGE (d5:Device {id: 'd5', type: 'BloodPressureMonitor', manufacturer: 'LifeCheck', serialNumber: 'SN3344', status: 'active'})

// Asignar dispositivos a pacientes
MERGE (d3)-[:ASSIGNED_TO]->(p4)
MERGE (d4)-[:ASSIGNED_TO]->(p5)
MERGE (d5)-[:ASSIGNED_TO]->(p6)

// Crear observaciones
MERGE (o7:Observation {id: 'o7', temperature: 37.9, timestamp: datetime()})
MERGE (o8:Observation {id: 'o8', temperature: 38.2, timestamp: datetime()})
MERGE (o9:Observation {id: 'o9', temperature: 36.5, timestamp: datetime()})
MERGE (o10:Observation {id: 'o10', temperature: 39.5, timestamp: datetime()})
MERGE (o11:Observation {id: 'o11', temperature: 36.7, timestamp: datetime()})
MERGE (o12:Observation {id: 'o12', temperature: 38.9, timestamp: datetime()})

// Relacionar observaciones con pacientes y dispositivos
MERGE (p4)-[:HAS]->(o7)
MERGE (p4)-[:HAS]->(o8)
MERGE (d3)-[:TAKES]->(o7)
MERGE (d3)-[:TAKES]->(o8)

MERGE (p5)-[:HAS]->(o9)
MERGE (p5)-[:HAS]->(o10)
MERGE (d4)-[:TAKES]->(o9)
MERGE (d4)-[:TAKES]->(o10)

MERGE (p6)-[:HAS]->(o11)
MERGE (p6)-[:HAS]->(o12)
MERGE (d5)-[:TAKES]->(o11)
MERGE (d5)-[:TAKES]->(o12)

// Encadenar observaciones cronológicamente por dispositivo
MERGE (o7)-[:NEXT]->(o8)
MERGE (o9)-[:NEXT]->(o10)
MERGE (o11)-[:NEXT]->(o12)

// Crear eventos técnicos
MERGE (te5:TechnicalEvent {id: 'te5', eventName: 'Overheating', eventStatus: 'warning', timestamp: datetime()})
MERGE (te6:TechnicalEvent {id: 'te6', eventName: 'PowerFailure', eventStatus: 'critical', timestamp: datetime()})

// Relacionar eventos con dispositivos
MERGE (d3)-[:GENERATES]->(te5)
MERGE (d4)-[:GENERATES]->(te6)
