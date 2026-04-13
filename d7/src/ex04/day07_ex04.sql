SELECT person.name, COUNT(person_visits.id) AS total_count
FROM person
  JOIN person_visits ON person_visits.person_id = person.id
GROUP BY person.name
HAVING COUNT(person_visits.id) > 3

