SELECT PER.name AS name, COUNT(*) AS count_of_visits
FROM person_visits PV
LEFT JOIN person PER ON PV.person_id = PER.id
GROUP BY PER.name
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;

