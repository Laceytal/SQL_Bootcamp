SELECT
    COALESCE(person.name,'-') AS person_name,
    VISITS.visit_date AS visit_date,
    COALESCE(pizzeria.name,'-') AS pizzeria_name
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS VISITS
FULL JOIN pizzeria ON pizzeria.id = VISITS.pizzeria_id
FULL JOIN person ON person.id=VISITS.person_id
ORDER BY person_name,visit_date,pizzeria_name;