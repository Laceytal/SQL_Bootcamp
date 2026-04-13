SELECT name, rating
FROM pizzeria PIZZERIA
LEFT JOIN person_visits VISITS
    ON VISITS.pizzeria_id = PIZZERIA.id
    WHERE VISITS.pizzeria_id IS NULL;
