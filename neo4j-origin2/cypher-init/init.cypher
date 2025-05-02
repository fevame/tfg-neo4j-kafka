// Crear dispositivos
MERGE (d3:Device {id: 'D003', serialNumber: 'BPM789', type: 'BPM', manufacturer: 'MediTech', status: 'active'})

// Crear pacientes
MERGE (p3:Patient {id: 'P003', name: 'Charlie', age: 50, gender: 'M'})

// Asignar dispositivo a paciente
MERGE (d3)-[:ASSIGNED_TO]->(p3)

// Crear observaciones
MERGE (o3:Observation {id: 'O003', temperature: 39.0, timestamp: datetime()})
MERGE (p3)-[:HAS]->(o3)

// Crear eventos técnicos
MERGE (t2:TechnicalEvent {id: 'T002', eventName: 'Calibration Needed', eventStatus: 'pending', timestamp: datetime()})
MERGE (d3)-[:GENERATES]->(t2)

