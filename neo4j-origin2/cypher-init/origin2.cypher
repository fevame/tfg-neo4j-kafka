MATCH (n) DETACH DELETE n;

CREATE (p:Patient {id: 'p1', name: 'Juan Perez'});
CREATE (o:Observation {id: 'o1', temperature: 38.5, timestamp: datetime()});

MATCH (p:Patient {id: 'p1'}), (o:Observation {id: 'o1'}) MERGE (p)-[:HAS_OBSERVATION]->(o);

CREATE (p:Patient {id: 'p2', name: 'Maria Gomez'});
CREATE (o:Observation {id: 'o2', temperature: 36.8, timestamp: datetime()});

MATCH (p:Patient {id: 'p2'}), (o:Observation {id: 'o2'}) MERGE (p)-[:HAS_OBSERVATION]->(o);

CREATE (p:Patient {id: 'p3', name: 'Luis Garcia'});
CREATE (o:Observation {id: 'o3', temperature: 39.2, timestamp: datetime()});

MATCH (p:Patient {id: 'p3'}), (o:Observation {id: 'o3'}) MERGE (p)-[:HAS_OBSERVATION]->(o);
