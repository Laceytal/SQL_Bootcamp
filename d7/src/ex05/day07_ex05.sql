SELECT DISTINCT PER.name AS name
FROM person_order PO
JOIN person PER ON PO.person_id = PER.id
ORDER BY name;