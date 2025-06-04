// Eliminar todos los nodos y relaciones existentes
MATCH (n) DETACH DELETE n;

// Crear pacientes
MERGE (p4:Patient {id: '49282750Y', name: 'Juan Pérez'})
MERGE (p5:Patient {id: '44247414A', name: 'María Gómez'})
MERGE (p6:Patient {id: '44442222F', name: 'Luis García'})

// Crear dispositivos
MERGE (d3:Device {id: 'd3', type: 'ECG', manufacturer: 'CardioTech', serialNumber: 'SN9101', status: 'active'})
MERGE (d4:Device {id: 'd4', type: 'InfusionPump', manufacturer: 'MediFlow', serialNumber: 'SN1121', status: 'inactive'})

// Asignar dispositivos a pacientes
MERGE (d3)-[:ASSIGNED_TO]->(p4)
MERGE (d4)-[:ASSIGNED_TO]->(p5)

// Crear observaciones
MERGE (o4:Observation {id: 'o4', temperature: 37.9, timestamp: datetime()})
MERGE (o5:Observation {id: 'o5', temperature: 36.5, timestamp: datetime()})
MERGE (o6:Observation {id: 'o6', temperature: 39.5, timestamp: datetime()})

// Relacionar observaciones con pacientes y dispositivos
MERGE (p4)-[:HAS]->(o4)
MERGE (d3)-[:TAKES]->(o4)

MERGE (p5)-[:HAS]->(o5)
MERGE (d4)-[:TAKES]->(o5)

MERGE (p6)-[:HAS]->(o6)
MERGE (d4)-[:TAKES]->(o6)

// Encadenar observaciones cronológicamente
MERGE (o4)-[:NEXT]->(o5)
MERGE (o5)-[:NEXT]->(o6)

// Crear eventos técnicos
MERGE (te3:TechnicalEvent {id: 'te3', eventName: 'Overheating', eventStatus: 'warning', timestamp: datetime()})
MERGE (te4:TechnicalEvent {id: 'te4', eventName: 'PowerFailure', eventStatus: 'critical', timestamp: datetime()})

// Relacionar eventos con dispositivos
MERGE (d3)-[:GENERATES]->(te3)
MERGE (d4)-[:GENERATES]->(te4)
