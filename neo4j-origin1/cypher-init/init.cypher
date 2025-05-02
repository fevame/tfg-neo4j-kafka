// Crear dispositivos
MERGE (d1:Device {id: 'D001', serialNumber: 'ABC123', type: 'TM', manufacturer: 'AcmeCorp', status: 'active'})
MERGE (d2:Device {id: 'D002', serialNumber: 'HRM456', type: 'HRM', manufacturer: 'BioMedInc', status: 'active'})

// Crear pacientes
MERGE (p1:Patient {id: 'P001', name: 'Alice', age: 30, gender: 'F'})
MERGE (p2:Patient {id: 'P002', name: 'Bob', age: 40, gender: 'M'})

// Asignar dispositivos a pacientes
MERGE (d1)-[:ASSIGNED_TO]->(p1)
MERGE (d2)-[:ASSIGNED_TO]->(p2)

// Crear observaciones
MERGE (o1:Observation {id: 'O001', temperature: 38.5, timestamp: datetime()})
MERGE (p1)-[:HAS]->(o1)

MERGE (o2:Observation {id: 'O002', temperature: 36.7, timestamp: datetime()})
MERGE (p2)-[:HAS]->(o2)

// Crear eventos técnicos
MERGE (t1:TechnicalEvent {id: 'T001', eventName: 'Low Battery', eventStatus: 'pending', timestamp: datetime()})
MERGE (d1)-[:GENERATES]->(t1)

