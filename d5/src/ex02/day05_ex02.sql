CREATE INDEX IF NOT EXISTS idx_person_name ON person(UPPER(name));

SET enable_seqscan TO ON;
EXPLAIN ANALYSE
  SELECT * FROM person
  WHERE UPPER(name) LIKE 'PETER';

SET enable_seqscan TO OFF;
EXPLAIN ANALYSE
  SELECT * FROM person
  WHERE UPPER(name) LIKE 'PETER';
