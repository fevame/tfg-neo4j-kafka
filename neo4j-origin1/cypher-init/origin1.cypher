MATCH (n) DETACH DELETE n;

CREATE (d:Device {id: 'd1', type: 'Thermometer', manufacturer: 'MedTech', serialNumber: 'SN1234', status: 'active'});
CREATE (te:TechnicalEvent {id: 'te1', eventName: 'BatteryLow', eventStatus: 'critical', timestamp: datetime()});

MATCH (d:Device {id: 'd1'}), (te:TechnicalEvent {id: 'te1'}) MERGE (d)-[:GENERATES]->(te);

CREATE (d:Device {id: 'd2', type: 'PulseOximeter', manufacturer: 'HealthCorp', serialNumber: 'SN5678', status: 'active'});
CREATE (te:TechnicalEvent {id: 'te2', eventName: 'SensorFailure', eventStatus: 'critical', timestamp: datetime()});

MATCH (d:Device {id: 'd2'}), (te:TechnicalEvent {id: 'te2'}) MERGE (d)-[:GENERATES]->(te);
